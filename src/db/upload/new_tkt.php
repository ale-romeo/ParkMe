<?php
session_start();
include('../connection.php');

$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}
$title = $conn->real_escape_string($_POST['title']);
$text = $conn->real_escape_string($_POST['text']);
$agent = $conn->real_escape_string($_POST['agent']);

$new = "INSERT INTO Ticket (title, body_text, agent_id, id_user) VALUES ('$title', '$text', '$agent', '$usr')";
$res = $conn->query($new);
?>