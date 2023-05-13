<?php
include('../connection.php');

$sub_id = $conn->real_escape_string($_POST['sub_id']);

$drop = "UPDATE Subscription SET removed = 1 WHERE id = '$sub_id';";
$res = $conn->query($drop) or die("Query failed: " . $conn->connect_error);
?>