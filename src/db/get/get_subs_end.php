<?php
session_start();
include("../connection.php");
date_default_timezone_set('Europe/Rome');

$time = date('Y-m-d H:i:s', time());

$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$get_tkts = "SELECT Subscription.* FROM Subscription JOIN Subscription_Payment ON Subscription.id = Subscription_Payment.sub_id WHERE Subscription.removed = 0 AND Subscription_Payment.expiration > '$time' ORDER BY Subscription_Payment.id DESC";
$res = $conn->query($get_tkts) or die("Errore durante il caricamento dei tickets: ". $conn->connect_error);

$table_html = '<table>';
$table_html .= '<thead><tr><th>Operatore</th><th>Titolo</th><th>Tipo</th><th>Riduzione</th><th>Prezzo</th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $res->fetch_assoc()) {
    $id = $row['id'];
    $agent = $row['id_agent'];
    $title = $row['title'];
    $type = $row['type'];
    $red = $row['reduction'];
    $price = $row['price'];
    $table_html .= "<tr><td>$agent</td><td>$title</td><td>$type</td><td>$red</td><td>$price</td></tr>";
}

$table_html .= '</tbody></table>';
// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();

?>