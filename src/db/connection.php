<?php
$servername = "database";
$username = "aleromeo";
$password = "al3.r0m30";
$dbname = "parkme";

$conn = new mysqli($servername, $username, $password, $dbname) or die("Error connecting to database.");
// Set timezone
$sql = "SET time_zone = '+02:00';";
$conn->query($sql);

?>