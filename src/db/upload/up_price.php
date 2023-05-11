<?php
include("../connection.php");

$slot = "";
$zone = "";
$tar_or = $_POST['tar_or'];
$tar_per = $_POST['tar_per'];
if (isset($_POST['posto'])) {
    $slot = $_POST['posto'];
    $assign = "UPDATE Parking_Space SET hourly_price = '$tar_or', periodic_price = '$tar_per' WHERE id = '$slot'";
}
else if (isset($_POST['zona'])) {
    $zone = $_POST['zona'];
    $assign = "UPDATE Parking_Space SET hourly_price = '$tar_or', periodic_price = '$tar_per' WHERE id LIKE '$zone%'";
}

$result = $conn->query($assign) or die("Si è verificato un errore durante l'assegnazione dell'operatore al posto $slot: " . $conn->connect_error);

?>