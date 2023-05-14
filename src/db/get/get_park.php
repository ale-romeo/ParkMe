<?php
session_start();
date_default_timezone_set('Europe/Rome');
include("../connection.php");
$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$get_park = "SELECT Parking_Space.id, Parking_Space.parking_ending_time FROM Parking_Space JOIN Payment ON Payment.park_id = Parking_Space.id WHERE Payment.user_id = '$usr' AND Payment.service = 'Parcheggio' AND Payment.status = 1";
$park_istance = $conn->query($get_park);

if ($park_istance->num_rows > 0) {
    $row = $park_istance->fetch_assoc();
    $end_time = strtotime($row['parking_ending_time']) - time();
    $min = date('i', $end_time);
    $ore = date('H', $end_time);
    $giorni = date('d', $end_time);

    echo json_encode(array($row['id'], $min, $ore, $giorni));
} else {
    echo json_encode('free');
}
?>