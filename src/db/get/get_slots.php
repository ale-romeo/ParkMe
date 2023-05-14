<?php
session_start();
include('../connection.php');
$user = "";

// Recupera il valore della zona selezionata dall'utente
$zona = $conn->real_escape_string($_GET['zona']);

if (isset($_SESSION["username"])) {
    $user = $conn->real_escape_string($_SESSION["username"]);
}

$get_class = "SELECT * FROM Account WHERE username = '$user'";
$got = $conn->query($get_class);
$row_user = $got->fetch_assoc();
$type = $row_user['type'];
if ($type == 'body_emp' or $type == 'sup_body_emp') {
    $id_body = $row_user['Body_id'];
    $posti = "SELECT * FROM Parking_Space WHERE zone_id = '$zona' AND id_body = '$id_body' ORDER BY CAST(SUBSTRING(id, 2) AS UNSIGNED)";
} else if ($type == 'agent_emp' or $type == 'sup_agent_emp') {
    $id_agent = $row_user['Agent_id'];
    $posti = "SELECT * FROM Parking_Space WHERE zone_id = '$zona' AND id_agent = '$id_agent' ORDER BY CAST(SUBSTRING(id, 2) AS UNSIGNED)";
} else if ($type == 'end_user') {
    $posti = "SELECT * FROM Parking_Space WHERE zone_id = '$zona' AND id_agent != 'NULL' ORDER BY CAST(SUBSTRING(id, 2) AS UNSIGNED)";
}

// Query per recuperare i posti auto della zona selezionata
$result = $conn->query($posti) or die("Query failed: " . $conn->connect_error);

$av_vis = '<span class="status-icon"><i class="fas fa-circle text-success"></i></span>';
$pr_vis = '<span class="status-icon"><i class="fas fa-circle text-primary"></i></span>';
$ofo_vis = '<span class="status-icon"><i class="fas fa-circle"></i></span>';
$oc_vis = '<span class="status-icon"><i class="fas fa-circle text-danger"></i></span>';

if ($type == 'sup_body_emp') {
    // Genera la tabella dei parcheggi
    $table_html = '<table>';
    $table_html .= '<thead><tr><th>Codice</th><th>Stato</th><th> </th><th>Operatore</th><th> </th></tr></thead>';
    $table_html .= '<tbody>';
    while ($row = $result->fetch_assoc()) {
        $assign = '';
        $id = $row['id'];
        $stato = $row['STATUS'];
        $ag = $row['id_agent'];

        if ($stato == 'Available') {
            $vis = $av_vis;
        }
        if ($stato == 'Out of order') {
            $vis = $ofo_vis;
        }
        if ($stato == 'Occupied') {
            $vis = $oc_vis;
        }
        if ($stato == 'Reserved') {
            $vis = $pr_vis;
        }

        if ($ag == NULL) {
            $ag = 'Vacant';
            $assign = '<a href="#" class="assegna-operatore" data-toggle="modal" data-target="#myModal">Assegna</a>';
        } else {
            $assign = '<a href="#" class="assegna-operatore" data-toggle="modal" data-target="#myModal">Riassegna</a>';
        }
        $table_html .= "<tr><td>$id</td><td>$stato</td><td>$vis</td><td>$ag</td><td>$assign</td></tr>";
    }
    $table_html .= '</tbody></table>';
} else if ($type == 'body_emp') {
    // Genera la tabella dei parcheggi
    $table_html = '<table>';
    $table_html .= '<thead><tr><th>Codice</th><th>Stato</th><th> </th><th>Operatore</th></tr></thead>';
    $table_html .= '<tbody>';
    while ($row = $result->fetch_assoc()) {
        $id = $row['id'];
        $stato = $row['STATUS'];
        $ag = $row['id_agent'];

        if ($stato == 'Available') {
            $vis = $av_vis;
        }
        if ($stato == 'Out of order') {
            $vis = $ofo_vis;
        }
        if ($stato == 'Occupied') {
            $vis = $oc_vis;
        }
        if ($stato == 'Reserved') {
            $vis = $pr_vis;
        }

        if ($ag == NULL) {
            $ag = 'Vacant';
        }
        $table_html .= "<tr><td>$id</td><td>$stato</td><td>$vis</td><td>$ag</td></tr>";
    }
    $table_html .= '</tbody></table>';
} else if ($type == 'agent_emp' or $type == 'sup_agent_emp') {
    $assign = '<a href="#" class="cambia-tariffa" data-toggle="modal" data-target="#single">Aggiorna Tariffe</a>';

    // Genera la tabella dei parcheggi
    $table_html = '<table>';
    $table_html .= '<thead><tr><th>Codice</th><th>Stato</th><th> </th><th>Tar. oraria</th><th>Tar. periodica</th><th> </th></tr></thead>';
    $table_html .= '<tbody>';
    while ($row = $result->fetch_assoc()) {
        $id = $row['id'];
        $stato = $row['STATUS'];
        $ag = $row['id_agent'];
        $tar_or = $row['hourly_price'];
        $tar_per = $row['periodic_price'];

        if ($stato == 'Available') {
            $vis = $av_vis;
        }
        if ($stato == 'Out of order') {
            $vis = $ofo_vis;
        }
        if ($stato == 'Occupied') {
            $vis = $oc_vis;
        }
        if ($stato == 'Reserved') {
            $vis = $pr_vis;
        }

        $table_html .= "<tr><td>$id</td><td>$stato</td><td>$vis</td><td>$tar_or</td><td>$tar_per</td><td>$assign</td></tr>";
    }
    $table_html .= '</tbody></table>';
} else if ($type == 'end_user') {
    $table_html = '<select name="park_slot" id="park_slot_id">';
    while ($row = $result->fetch_assoc()) {
        $stato = $row['STATUS'];
        if ($stato == 'Available') {
            $vis = 'L';
        }
        if ($stato == 'Out of order') {
            $vis = 'Inagibile';
        }
        if ($stato == 'Occupied') {
            $vis = 'O';
        }
        if ($stato == 'Reserved') {
            $vis = 'R';
        }
        $table_html .= '<option value="'.$row['id'].'">'.$row['id'].' - '.$row['id_agent'].'&nbsp&nbsp&nbsp'.$vis.'</option>';
    }
    $table_html .= '</select>';
}

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>