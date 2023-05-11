<?php
include("../connection.php");

$get_logs = "SELECT * FROM Viewing_slots ORDER BY id DESC";
$res = $conn->query($get_logs) or die("Errore durante il caricamento dei logs: ". $conn->connect_error);

$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Impiegato</th><th>Zona Visualizzata</th><th>Data</th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $res->fetch_assoc()) {
    $id = $row['id'];
    $emp_usrn = $row['emp_id'];
    $zone = $row['slot_zone'];
    $date = $row['viewing_time'];

    $table_html .= "<tr><td>$id</td><td>$emp_usrn</td><td>$zone</td><td>$date</td></tr>";
}
$table_html .= '</tbody></table>';

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();

?>