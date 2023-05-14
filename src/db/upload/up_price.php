<?php
session_start();
include("../connection.php");
$ag = "";
if (isset($_SESSION['id_agent'])) {
    $ag = $conn->real_escape_string($_SESSION['id_agent']);
}

$slot = "";
$zone = "";
$tar_or = $conn->real_escape_string($_POST['tar_or']);
$tar_per = $conn->real_escape_string($_POST['tar_per']);

if (isset($_POST['posto'])) {
    $slot = $_POST['posto'];
    $assign = "UPDATE Parking_Space SET hourly_price = '$tar_or', periodic_price = '$tar_per' WHERE id = '$slot'";
}
else if (isset($_POST['zona'])) {
    $zone = $_POST['zona'];
    $assign = "UPDATE Parking_Space SET hourly_price = '$tar_or', periodic_price = '$tar_per' WHERE zone_id = '$zone' AND id_agent = '$ag'";
}

$result = $conn->query($assign) or die("Si è verificato un errore durante l'assegnazione dell'operatore al posto $slot: " . $conn->connect_error);

?>