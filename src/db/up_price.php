<?php
include("connection.php");

$slot = $_POST['posto'];
$tar_or = $_POST['tar_or'];
$tar_per = $_post['tar_per'];
$assign = "UPDATE Parking_Space SET hourly_price = '$tar_or', periodic_price = '$tar_per' WHERE id = '$slot'";
$result = $conn->query($assign) or die("Si è verificato un errore durante l'assegnazione dell'operatore al posto $slot: " . $conn->connect_error);

?>