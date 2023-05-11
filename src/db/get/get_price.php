<?php
include("../connection.php");

$posto = $_POST['posto'];

$query = "SELECT hourly_price, periodic_price FROM Parking_Space WHERE id = '$posto'";
$res = $conn->query($query) or die("Errore di caricamento dei prezzi");

$row = $res->fetch_assoc();

header('Content-Type: application/json');
echo json_encode(array($row['hourly_price'], $row['periodic_price']));

?>