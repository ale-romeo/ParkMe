<?php
include('connection.php');

// Recupera il valore della zona selezionata dall'utente
$zona = $_POST['zona'];

// Query per recuperare i posti auto della zona selezionata
$posti = "SELECT * FROM posti_auto WHERE id LIKE '$zona%'";
$result = $conn->query($posti) or die("Query failed: " . $conn->connect_error);

// Genera la tabella dei parcheggi
$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Stato</th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $result->fetch_assoc()) {
    $id = $row['id'];
    $stato = $row['STATUS'];
    $table_html .= "<tr><td>$id</td><td>$stato</td></tr>";
}
$table_html .= '</tbody></table>';

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>