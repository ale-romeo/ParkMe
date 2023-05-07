<?php
session_start();
include("connection.php");
$bd_id = "";
$ag_id  = "";

if (!isset($_SESSION['username'])){
    header('location: ../login_pg.php');
    exit();
} else {
    $username = $_SESSION["username"];
}
if (isset($_SESSION["id_body"])) {
    $bd_id = $_SESSION["id_body"];
    $get_acc = "SELECT * FROM Account WHERE username = '$username' AND Body_id = '$bd_id'";
}
if (isset($_SESSION["id_agent"])) {
    $ag_id = $_SESSION["id_agent"];
    $get_acc = "SELECT * FROM Account WHERE username = '$username' AND Agent_id = '$ag_id'";
}


$get_acc = "SELECT * FROM Account WHERE username = '$username'";
$result = $conn->query($get_acc) or die("Errore durante il caricamento dell'utente" . $conn->connect_error);

if ($result->num_rows > 0){
    $row = $result->fetch_assoc();
    echo json_encode($row);
}

?>