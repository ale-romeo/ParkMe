<?php
include("../connection.php");

date_default_timezone_set('Europe/Rome');
$time = date('Y-m-d H:i:s', time());
$update_slots = "UPDATE Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id SET Parking_Space.STATUS = 'Available', Parking_Space.parking_ending_time = NULL, Payment.status = 0 WHERE parking_ending_time < '$time' AND Payment.status = 1";
$uptodate = $conn->query($update_slots);
?>