<?php
session_start();
include("../connection.php");
$username = "";

if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];
}

$try = $_POST['password'];

$sql = "SELECT * FROM Account WHERE username = '$username'";

$result = $conn->query($sql) or die("Errore durante il recupero della password: ". $conn->connect_error);

if($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if(!password_verify($try, $row['password'])) {
        echo 'invalid';
        exit();
    }
}

?>