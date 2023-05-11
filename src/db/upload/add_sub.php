<?php
session_start();
include('../connection.php');

$title = $conn->real_escape_string($_POST["titolo"]);
$price = $conn->real_escape_string($_POST["prezzo"]);
$type = $conn->real_escape_string($_POST["tipo"]);
$id_agent = "";

if (isset($_SESSION["id_agent"])) {
    $id_agent = $conn->real_escape_string($_SESSION["id_agent"]);
}

$add_sub = "INSERT INTO Subscription (title, type, price, id_agent) VALUES ('$title', '$type', '$price', '$id_agent')";
$result = $conn->query($add_sub) or die("Si è verificato un errore durante l'inserimento di un nuovo impiegato." . $conn->connect_error);

?>