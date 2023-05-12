<?php
include("../connection.php");

$get_logs = "SELECT * FROM Managing ORDER BY id DESC";
$res = $conn->query($get_logs) or die("Errore durante il caricamento dei logs: ". $conn->connect_error);

$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Impiegato</th><th>Azione</th><th>Oggetto</th><th>Data</th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $res->fetch_assoc()) {
    $id = $row['id'];
    $emp_usrn = $row['id_employee'];
    $action = $row['action'];
    if ($row['zone'] != NULL) {
        $obj = $row['zone'];
    }
    else if ($row['tar_id'] != NULL) {
        $obj = $row['tar_id'];
    }
    else if ($row['sub_id'] != NULL) {
        $obj = $row['sub_id'];
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