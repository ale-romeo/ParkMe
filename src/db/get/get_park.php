<?php
session_start();
date_default_timezone_set('Europe/Rome');
include("../connection.php");
$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$get_park = "SELECT Parking_Space.id, Parking_Space.parking_ending_time, Payment.user_id FROM Parking_Space JOIN Payment ON Payment.park_id = Parking_Space.id WHERE Payment.user_id = '$usr' AND Payment.service = 'Parcheggio' AND Payment.status = 1";
$park_istance = $conn->query($get_park);

$get_res = "SELECT Parking_Space.id, Reservation.ending_time, Reservation.id_user FROM Parking_Space JOIN Reservation ON Parking_Space.id = Reservation.id_parking WHERE Reservation.solved = 1 AND Reservation.id_user = '$usr' AND Parking_Space.STATUS = 'Reserved'";
$got_res = $conn->query($get_res);

if ($park_istance->num_rows > 0) {
    $row = $park_istance->fetch_assoc();
    $end_time = strtotime($row['parking_ending_time']);

    $days = date('d', $end_time);
    $hours = date('H', $end_time);
    $minutes = date('i', $end_time);

    echo json_encode(array('occupied', $row['id'], $minutes, $hours, $days, $row['user_id']));
} else if ($got_res->num_rows > 0) {
    $row = $got_res->fetch_assoc();
    $end_time = DateTime::createFromFormat('Y-m-d H:i:s', $row['ending_time']);
    $time = new DateTime();
    $rest_time = $time->diff($end_time);

    $minutes = $rest_time->format('%i');
    $seconds = $rest_time->format('%s');

    echo json_encode(array('reserved', $row['id'], $minutes, $seconds, $row['id_user']));
} else {
    echo json_encode(array('free'));
}
?>