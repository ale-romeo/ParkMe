<?php
session_start();
include('../connection.php');

$bd_id = "";
$ag_id = "";
$type = "";
if (isset($_SESSION["id_body"])) {
    $bd_id = $conn->real_escape_string($_SESSION["id_body"]);
    $type = 'body_emp';
    $posti = "SELECT name, surname, reg_date FROM Account WHERE type = '$type' AND Body_id = '$bd_id' ORDER BY name";
}
else if (isset($_SESSION["id_agent"])) {
    $ag_id = $conn->real_escape_string($_SESSION["id_agent"]);
    $type = 'agent_emp';
    $posti = "SELECT name, surname, reg_date FROM Account WHERE type = '$type' AND Agent_id = '$ag_id' ORDER BY name";
}

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