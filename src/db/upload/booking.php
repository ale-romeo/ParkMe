<?php
session_start();
date_default_timezone_set('Europe/Rome');
include('../connection.php');

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$slot = $conn->real_escape_string($_POST['posto']);

$get_slot_info = "SELECT * FROM Parking_Space WHERE id = '$slot'";
$res_slot = $conn->query($get_slot_info);
$row_slot = $res_slot->fetch_assoc();
$res_price = $row_slot['reservation_price'];

$res_date = date('Y-m-d H:i:s', strtotime("+ 10 minutes", time()));

$res_query = "INSERT INTO Reservation (solved, amount, id_user, id_parking, ending_time) VALUES (1, '$res_price', '$usr', '$slot', '$res_date')";
$reserve = $conn->query($res_query);

$status_query = "UPDATE Parking_Space SET STATUS = 'Reserved' WHERE id = '$slot'";
$status = $conn->query($status_query);

?>