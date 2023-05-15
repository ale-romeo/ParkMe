<?php
session_start();
date_default_timezone_set('Europe/Rome');
include('../connection.php');

$usr = "";
$ii = "";
$hh = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$slot = $conn->real_escape_string($_POST['posto']);

$update_slots = "UPDATE Parking_Space JOIN Reservation ON Parking_Space.id = Reservation.id_parking SET Parking_Space.STATUS = 'Available', Reservation.solved = 0 WHERE Parking_Space.id = '$slot' AND Parking_Space.STATUS = 'Reserved' AND Reservation.solved = 1";
$uptodate = $conn->query($update_slots);
?>