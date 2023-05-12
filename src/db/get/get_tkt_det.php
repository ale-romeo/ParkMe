<?php
include('../connection.php');

$tkt_id = $conn->real_escape_string($_POST['tkt_id']);

$subs = "SELECT * FROM Ticket WHERE id = '$tkt_id'";
$result = $conn->query($subs) or die("Query failed: " . $conn->connect_error);
$row = $result->fetch_assoc();

header('Content-Type: application/json');
echo json_encode(array($row['title'], $row['body_text']));
$conn->close();
?>