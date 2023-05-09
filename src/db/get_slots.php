<?php
session_start();
include('connection.php');
$user = "";
if (isset($_SESSION["username"])) {
    $user = $_SESSION["username"];
}

$get_class = "SELECT type FROM Account WHERE username = '$user'";
$got = $conn->query($get_class);
$type = ($got->fetch_assoc())['type'];

// Recupera il valore della zona selezionata dall'utente
$zona = $_GET['zona'];

// Query per recuperare i posti auto della zona selezionata
$posti = "SELECT * FROM Parking_Space WHERE id LIKE '$zona%' ORDER BY CAST(SUBSTRING(id, 2) AS UNSIGNED)";
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
        }
        $table_html .= "<tr><td>$id</td><td>$stato</td><td>$vis</td><td>$ag</td><td>$assign</td></tr>";
    }
    $table_html .= '</tbody></table>';
}
else if ($type == 'body_emp') {
    // Genera la tabella dei parcheggi
$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Stato</th><th> </th><th>Operatore</th></tr></thead>';
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

    if ($ag == NULL){
        $ag = 'Vacant';
    }
    $table_html .= "<tr><td>$id</td><td>$stato</td><td>$vis</td><td>$ag</td></tr>";
}
$table_html .= '</tbody></table>';
}

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>