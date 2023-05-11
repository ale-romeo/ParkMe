<?php
include('../connection.php');

$sub_id = $conn->real_escape_string($_POST['sub_id']);

$subs = "DELETE FROM `Subscription` WHERE id = '$sub_id'";
$result = $conn->query($subs) or die("Query failed: " . $conn->connect_error);
?>