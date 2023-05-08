<?php
session_start();
include('connection.php');
$bd_id = "";
if (isset($_SESSION["id_body"])) {
    $bd_id = $_SESSION["id_body"];
}

// Query per recuperare i posti auto della zona selezionata
$posti = "SELECT name, surname, reg_date FROM Account WHERE type = 'body_emp' AND Body_id = '$bd_id' ORDER BY name";
$result = $conn->query($posti) or die("Query failed: " . $conn->connect_error);

$table_html = '<table>';
$table_html .= '<thead><tr><th>Nome</th><th>Cognome</th><th>Data ass.</th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $result->fetch_assoc()) {
    $name = $row['name'];
    $surname = $row['surname'];
    $date = explode(" ", $row['reg_date'])[0];

    $table_html .= "<tr><td>$name</td><td>$surname</td><td>$date</td></tr>";
}
$table_html .= '</tbody></table>';

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>