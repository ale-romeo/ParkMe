<?php
session_start();
include("../connection.php");

$username = $conn->real_escape_string(trim($_POST['username']));
$email = $conn->real_escape_string(trim($_POST['email']));
$phone = $conn->real_escape_string(trim($_POST['phone']));
$gender = $conn->real_escape_string(trim($_POST['gender']));

if ($gender == 'male') {
    $gender = 'M';
}
if ($gender == 'female') {
    $gender = 'F';
}
if ($gender == 'other') {
    $gender = 'O';
}
if (isset($_POST['priv_email'])){
    $priv_email = $conn->real_escape_string(trim($_POST['priv_email']));
    $up_acc = "UPDATE Account SET gender = '$gender', phone = '$phone', priv_email_employee = '$priv_email' WHERE username = '$username'";
} else {
    $up_acc = "UPDATE Account SET email = '$email', gender = '$gender', phone = '$phone' WHERE username = '$username'";
}

$res = $conn->query($up_acc) or die("Errore durante il salvataggio nel db: ". $conn->connect_error);
?>