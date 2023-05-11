<?php
session_start();
include('../connection.php');

$username = "";
if (isset($_SESSION['username'])) {
    $username = $conn->real_escape_string($_SESSION['username']);
}

$pass = $conn->real_escape_string(trim($_POST['password']));
$new_pass = password_hash($pass, PASSWORD_BCRYPT);

$up_pass = "UPDATE Account SET password = '$new_pass' WHERE username = '$username'";
$res = $conn->query($up_pass) or die("Errore durante il cambio della password: ". $conn->connect_error);

?>