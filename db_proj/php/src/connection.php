<?php
$servername = "db";
$username = "ale";
$password = "pass";

$conn = new mysqli($servername, $username, $password);

if($conn->connect_error){
    die("Connection failed: ". $conn->connect_error);
}
echo "Connected to ".$servername." Database";
?>