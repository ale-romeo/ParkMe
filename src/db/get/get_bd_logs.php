<?php
session_start();
include("../connection.php");

$id_body = "";
if (isset($_SESSION["id_body"])) {
    $id_body = $_SESSION["id_body"];
}

$get_logs = "SELECT Operations_Log.* FROM Operations_Log JOIN Account ON Account.username = Operations_Log.user_id WHERE Account.Body_id = '$id_body' ORDER BY Operations_Log.id DESC";
$res = $conn->query($get_logs) or die("Errore durante il caricamento dei logs: " . $conn->connect_error);

$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Impiegato</th><th>Azione</th><th>Oggetto</th><th>Data</th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $res->fetch_assoc()) {
    $id = $row['id'];
    $emp_usrn = $row['user_id'];
    $action = $row['action'];
    if ($row['zone_id'] != NULL) {
        $obj = $row['zone_id'];
    } else if ($row['slot_id'] != NULL) {
        $obj = $row['slot_id'];
    } else if ($row['sub_id'] != NULL) {
        $obj = $row['sub_id'];
    } else if ($row['res_id'] != NULL) {
        $obj = $row['res_id'];
    } else if ($row['emp_id'] != NULL) {
        $obj = $row['emp_id'];
    } else if ($row['tkt_id'] != NULL) {
        $obj = $row['tkt_id'];
    }

    $date = $row['date'];

    $table_html .= "<tr><td>$id</td><td>$emp_usrn</td><td>$action</td><td>$obj</td><td>$date</td></tr>";
}
$table_html .= '</tbody></table>';

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();

?>