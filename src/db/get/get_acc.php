<?php
session_start();
include("../connection.php");
$bd_id = "";
$ag_id  = "";

if (isset($_SESSION['username'])){
    $username = $_SESSION["username"];
}

$get_acc = "SELECT * FROM Account WHERE username = '$username'";
$result = $conn->query($get_acc) or die("Errore durante il caricamento dell'utente" . $conn->connect_error);

if ($result->num_rows > 0){
    $row = $result->fetch_assoc();
    echo json_encode($row);
}
?>