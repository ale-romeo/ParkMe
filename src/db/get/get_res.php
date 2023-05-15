<?php
session_start();
include("../connection.php");

$ag = "";
if (isset($_SESSION['id_agent'])) {
    $ag = $_SESSION['id_agent'];
}

$get_res = "SELECT reservation_price FROM Parking_Space WHERE id_agent = '$ag'";
$res = $conn->query($get_res);

if ($res->num_rows > 0) {
    $row = $res->fetch_assoc();
    echo $row['reservation_price'];
}

?>