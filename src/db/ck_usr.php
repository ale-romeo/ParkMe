<?php
include("connection.php");

$username = trim($_POST['username']);
$email = trim($_POST['email']);

$get_usrn = "SELECT username FROM Account WHERE email = '$email'";
$result = $conn->query($get_usrn) or die("Errore durante la ricerca della mail: ". $conn->connect_error);
if ($result->fetch_assoc()['username'] == $username) {
    echo 'not_exists';
    exit();
}

$ck_usr = "SELECT * FROM Account WHERE username = '$username'";
$res = $conn->query($ck_usr) or die("Errore durante la ricerca di username uguali: ". $conn->connect_error);
if ($res->num_rows > 0) {
    echo 'exists';
    exit();
} else {
    echo 'not_exists';
    exit();
}
?>