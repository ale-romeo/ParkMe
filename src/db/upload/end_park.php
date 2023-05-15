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

$get_refund = "SELECT Parking_Space.parking_ending_time, Parking_Space.periodic_price, Parking_Space.id_agent FROM Parking_Space JOIN Parking_Payment ON Parking_Space.id = Parking_Payment.park_id WHERE Parking_Payment.user_id = '$usr' AND Parking_Payment.status = 1";
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
        $new_end_time_f = $new_end_time->format('Y-m-d H:i:s');
        if ($new_end_time->getTimestamp() < $time->getTimestamp()) {
            echo 'invalid';
            exit();
        } else if ($new_end_time->getTimestamp() > $end_time->getTimestamp()) {
            $interval = $new_end_time->diff($end_time);
            $add_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
            $addition = round(($price * $add_time / 60), 2);

            $up_balance = "UPDATE Agent SET balance = balance + $addition WHERE NAME = '$ag'";
            $uptodate = $conn->query($up_balance);
            $update_tabs = "UPDATE Parking_Space JOIN Parking_Payment ON Parking_Space.id = Parking_Payment.park_id SET Parking_Space.parking_ending_time = '$new_end_time_f', Parking_Payment.status = 0 WHERE Parking_Payment.user_id = '$usr' AND Parking_Payment.status = 1";
            $res_up = $conn->query($update_tabs);
            $pay = "INSERT INTO Parking_Payment (status, amount, user_id, park_id) VALUES (1, '$addition', '$usr', '$slot')";
            $dopay = $conn->query($pay);
        } else if ($new_end_time->getTimestamp() < $end_time->getTimestamp()) {
            $interval = $end_time->diff($new_end_time);
            $refund_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
            $refund = round(($price * $refund_time / 60), 2);

            $up_balance = "UPDATE Agent SET balance = balance - $refund WHERE NAME = '$ag'";
            $uptodate = $conn->query($up_balance);
            $update_tabs = "UPDATE Parking_Space JOIN Parking_Payment ON Parking_Space.id = Parking_Payment.park_id SET Parking_Space.parking_ending_time = '$new_end_time_f', Parking_Payment.status = 0 WHERE Parking_Payment.user_id = '$usr' AND Parking_Payment.status = 1";
            $res_up = $conn->query($update_tabs);
            $pay = "INSERT INTO Parking_Payment (status, amount, user_id, park_id) VALUES (1, '$refund', '$usr', '$slot')";
            $dopay = $conn->query($pay);
        }
        echo 'valid';
        exit();
    } else {
        $interval = $end_time->diff($time);
        $refund_time = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;
        $refund = round(($price * $refund_time / 60), 2);
        $up_balance = "UPDATE Agent SET balance = balance - $refund WHERE NAME = '$ag'";
        $uptodate = $conn->query($up_balance);
        $pay = "INSERT INTO Parking_Payment (status, amount, user_id, park_id) VALUES (1, '$refund', '$usr', '$slot')";
        $dopay = $conn->query($pay);

        $update_tabs = "UPDATE Parking_Space JOIN Parking_Payment ON Parking_Space.id = Parking_Payment.park_id SET Parking_Space.STATUS = 'Available', Parking_Space.parking_ending_time = NULL, Parking_Payment.status = 0, Parking_Space.plate = NULL WHERE Parking_Payment.user_id = '$usr' AND Parking_Payment.status = 1";
        $res_up = $conn->query($update_tabs);
        echo 'end';
    }
}
?>