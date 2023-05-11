<?php
session_start();
include("../connection.php");

$username = $conn->real_escape_string(trim($_POST['username']));
$email = $conn->real_escape_string(trim($_POST['email']));
$phone = $conn->real_escape_string(trim($_POST['phone']));
$gender = $conn->real_escape_string(trim($_POST['gender']));
$priv_email = $conn->real_escape_string(trim($_POST['priv_email']));

if ($gender == 'male') {
    $gender = 'M';
}
if ($gender == 'female') {
    $gender = 'F';
}
if ($gender == 'other') {
    $gender = 'O';
}

$up_acc = "UPDATE Account SET username = '$username', gender = '$gender', phone = '$phone', priv_email_employee = '$priv_email' WHERE email = '$email'";
$res = $conn->query($up_acc) or die("Errore durante il salvataggio nel db: ". $conn->connect_error);
$_SESSION['username'] = $username;
?>