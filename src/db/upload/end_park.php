<?php
session_start();
date_default_timezone_set('Europe/Rome');
include('../connection.php');

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$slot = $conn->real_escape_string($_POST['posto']);

$get_refund = "SELECT Parking_Space.parking_ending_time, Parking_Space.periodic_price FROM Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id WHERE Payment.user_id = '$usr' AND Payment.status = 1 AND Payment.service = 'Parcheggio'";
$res_refund = $conn->query($get_refund);

if ($res_refund->num_rows > 0) {
    $row_refund = $res_refund->fetch_assoc();
    $end_time = DateTime::createFromFormat('Y-m-d H:i:s', $row_refund['parking_ending_time']);
    $time = new DateTime();
    $interval = $end_time->diff($time);
    $refund_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
    $refund = round(($row_refund['periodic_price']*$refund_time/60), 2);
}

$update_tabs = "UPDATE Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id SET Parking_Space.STATUS = 'Available', Parking_Space.parking_ending_time = NULL, Payment.status = 0 WHERE Payment.user_id = '$usr' AND Payment.status = 1 AND Payment.service = 'Parcheggio'";
$res_up = $conn->query($update_tabs);
?>