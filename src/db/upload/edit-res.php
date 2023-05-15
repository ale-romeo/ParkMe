<?php
session_start();
include("../connection.php");

$ag = "";
if (isset($_SESSION['id_agent'])) {
    $ag = $conn->real_escape_string($_SESSION['id_agent']);
}
$price = $conn->real_escape_string($_POST['price']);

$edit_res = "UPDATE Parking_Space SET reservation_price = $price WHERE id_agent = '$ag'";
$res = $conn->query($edit_res);
?>