<?php
date_default_timezone_set('Europe/Rome');
include("../connection.php");

$time = date('Y-m-d H:i:s', time());
$update_slots = "UPDATE Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id SET Parking_Space.STATUS = 'Available', Parking_Space.parking_ending_time = NULL, Payment.status = 0 WHERE Parking_Space.STATUS = 'Occupied' AND Parking_Space.parking_ending_time < '$time' AND Payment.status = 1";
$uptodate = $conn->query($update_slots);
$update_slots = "UPDATE Parking_Space JOIN Reservation ON Parking_Space.id = Reservation.id_parking SET Parking_Space.STATUS = 'Available', Reservation.solved = 0 WHERE Reservation.ending_time < '$time' AND Parking_Space.STATUS = 'Reserved' AND Reservation.solved = 1";
$uptodate = $conn->query($update_slots);

$update_ooo = "UPDATE Parking_Space SET STATUS = 'Available' WHERE STATUS = 'Out of order' AND hourly_price IS NOT NULL AND periodic_price IS NOT NULL AND reservation_price IS NOT NULL";
$up = $conn->query($update_ooo);
$update_ooo = "UPDATE Parking_Space SET STATUS = 'Out of order' WHERE hourly_price IS NULL OR periodic_price IS NULL OR reservation_price IS NULL";
$up = $conn->query($update_ooo);
?>