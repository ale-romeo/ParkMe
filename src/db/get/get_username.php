<?php
session_start();
$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $_SESSION['username'];
}
echo $usr;
?>