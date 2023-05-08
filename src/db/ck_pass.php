<?php
session_start();
include("connection.php");
$username = "";

if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];
} else {
    echo 'expired_emp';
    exit();
}

$try = $_POST['password'];

$get_pass = "SELECT password FROM Account WHERE username = '$username'";
$res = $conn->query($get_pass) or die("Errore durante il recupero della password: ". $conn->connect_error);

if($res->num_rows > 0) {
    $row = $res->fetch_assoc();
    if(!password_verify($try, $row['password'])) {
        echo 'invalid';
        exit();
    }
}

?>