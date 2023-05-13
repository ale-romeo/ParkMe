<?php
include("../connection.php");

$usr = "";
if (isset($_POST['user_id'])) {
    $usr = $conn->real_escape_string($_POST['user_id']);
}

$rem = "UPDATE Account SET removed = 1 WHERE username = '$usr'";
$removed = $conn->query($rem);
?>