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

$get_refund = "SELECT Parking_Space.parking_ending_time, Parking_Space.periodic_price, Parking_Space.id_agent FROM Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id WHERE Payment.user_id = '$usr' AND Payment.status = 1 AND Payment.service = 'Parcheggio'";
$res_refund = $conn->query($get_refund);
$time = new DateTime();


if ($res_refund->num_rows > 0) {
    $row_endtime = $res_refund->fetch_assoc();
    $end_time = DateTime::createFromFormat('Y-m-d H:i:s', $row_endtime['parking_ending_time']);
    $price = $row_endtime['periodic_price'];
    $ag = $row_endtime['id_agent'];

    if (isset($_POST['ii'])) {
        $ii = $conn->real_escape_string($_POST['ii']);
        $hh = $conn->real_escape_string($_POST['hh']);

        $new_end_time = DateTime::createFromFormat('Y-m-d H:i:s', $row_endtime['parking_ending_time']);
        $new_end_time->setTime($hh, $ii);
        if ($new_end_time->getTimestamp() < $time->getTimestamp()) {
            echo 'invalid';
            exit();
        } else if ($new_end_time->getTimestamp() > $end_time->getTimestamp()) {
            $interval = $new_end_time->diff($end_time);
            $add_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
            $addition = round(($price * $add_time / 60), 2);

            $up_balance = "UPDATE Agent SET balance = balance + $addition WHERE NAME = '$ag'";
            $uptodate = $conn->query($up_balance);
        } else if ($new_end_time->getTimestamp() < $end_time->getTimestamp()) {
            $interval = $end_time->diff($new_end_time);
            $refund_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
            $refund = round(($price * $refund_time / 60), 2);

            $up_balance = "UPDATE Agent SET balance = balance - $refund WHERE NAME = '$ag'";
            $uptodate = $conn->query($up_balance);
        }
        $new_end_time = $new_end_time->format('Y-m-d H:i:s');
        $update_tabs = "UPDATE Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id SET Parking_Space.parking_ending_time = '$new_end_time' WHERE Payment.user_id = '$usr' AND Payment.status = 1 AND Payment.service = 'Parcheggio'";
        $res_up = $conn->query($update_tabs);
        echo 'valid';
        exit();
    } else {
        $interval = $end_time->diff($time);
        $refund_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
        $refund = round(($price * $refund_time / 60), 2);
        $up_balance = "UPDATE Agent SET balance = balance - $refund WHERE NAME = '$ag'";
        $uptodate = $conn->query($up_balance);

        $update_tabs = "UPDATE Parking_Space JOIN Payment ON Parking_Space.id = Payment.park_id SET Parking_Space.STATUS = 'Available', Parking_Space.parking_ending_time = NULL, Payment.status = 0 WHERE Payment.user_id = '$usr' AND Payment.status = 1 AND Payment.service = 'Parcheggio'";
        $res_up = $conn->query($update_tabs);
        echo 'end';
    }
}
?>