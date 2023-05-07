<?php
include("connection.php");

$username = trim($_POST['username']);
$email = trim($_POST['email']);
$phone = trim($_POST['phone']);
$gender = trim($_POST['gender']);
$priv_email = trim($_POST['priv_email']);

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

?>