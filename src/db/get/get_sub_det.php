<?php
include('../connection.php');

$sub_id = $conn->real_escape_string($_POST['sub_id']);

$subs = "SELECT * FROM Subscription WHERE id = '$sub_id'";
$result = $conn->query($subs) or die("Query failed: " . $conn->connect_error);
$row = $result->fetch_assoc();

header('Content-Type: application/json');
echo json_encode(array($row['title'], $row['price']));
$conn->close();
?>