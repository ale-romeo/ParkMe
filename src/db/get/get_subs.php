<?php
session_start();
include('../connection.php');

$ag_id = "";
if (isset($_SESSION["id_agent"])) {
    $ag_id = $conn->real_escape_string($_SESSION["id_agent"]);
}

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$get_class = "SELECT * FROM Account WHERE username = '$usr'";
$got = $conn->query($get_class);
$row_user = $got->fetch_assoc();
$usr_type = $row_user['type'];

$subs = "SELECT * FROM Subscription WHERE id_agent = '$ag_id' AND removed = 0 ORDER BY type";
$result = $conn->query($subs) or die("Query failed: " . $conn->connect_error);
$edit = '<a href="#" class="edit-sub" data-toggle="modal" data-target="#edit-sub-modal">Modifica</a>';
$drop = '<a href="#" class="del-sub" style="cursor: pointer;">Rimuovi</a>';

$table_html = '<table>';
$table_html .= '<thead><tr><th>ID</th><th>Titolo</th><th>Tipo</th><th> </th><th> </th></tr></thead>';
$table_html .= '<tbody>';

if ($usr_type == 'agent_emp') {
    while ($row = $result->fetch_assoc()) {
        $id = $row['id'];
        $title = $row['title'];
        $type = $row['type'];

        $table_html .= "<tr><td>$id</td><td>$title</td><td>$type</td><td>$edit</td><td> </td></tr>";
    }
} else if ($usr_type == 'sup_agent_emp') {
    while ($row = $result->fetch_assoc()) {
        $id = $row['id'];
        $title = $row['title'];
        $type = $row['type'];

        $table_html .= "<tr><td>$id</td><td>$title</td><td>$type</td><td>$edit</td><td>$drop</td></tr>";
    }
}

$table_html .= '</tbody></table>';

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>