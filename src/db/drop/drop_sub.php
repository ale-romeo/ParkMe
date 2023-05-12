<?php
include('../connection.php');

$sub_id = $conn->real_escape_string($_POST['sub_id']);

$drop = "DELETE FROM Managing WHERE sub_id = '$sub_id';";
$res = $conn->query($drop) or die("Query failed: " . $conn->connect_error);
$drop1 = " DELETE FROM `Subscription` WHERE id = '$sub_id'";
$res = $conn->query($drop1) or die("Query failed: " . $conn->connect_error);
?>