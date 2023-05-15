<?php
session_start();
include("../connection.php");

$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$get_tkts = "SELECT * FROM Subscription WHERE removed = 0 ORDER BY id DESC";
$res = $conn->query($get_tkts) or die("Errore durante il caricamento dei tickets: ". $conn->connect_error);
$show_text = '<a href="#" class="acquista-abbonamento">Acquista</a>';

$table_html = '<table>';
$table_html .= '<thead><tr><th>ID</th><th>Operatore</th><th>Titolo</th><th>Tipo</th><th>Riduzione</th><th>Prezzo</th><th> </th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $res->fetch_assoc()) {
    $id = $row['id'];
    $agent = $row['id_agent'];
    $title = $row['title'];
    $type = $row['type'];
    $red = $row['reduction'];
    $price = $row['price'];
    $table_html .= "<tr><td>$id</td><td>$agent</td><td>$title</td><td>$type</td><td>$red</td><td>$price</td><td>$show_text</td></tr>";
}

$table_html .= '</tbody></table>';
// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();

?>