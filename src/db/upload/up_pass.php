<?php
session_start();
include('../connection.php');

$username = "";
if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];
}

$pass = trim($_POST['password']);
$new_pass = password_hash($pass, PASSWORD_BCRYPT);

$up_pass = "UPDATE Account SET password = '$new_pass'";
$res = $conn->query($up_pass) or die("Errore durante il cambio della password: ". $conn->connect_error);

?>