<?php
session_start();
include("connection.php");
$zona = trim($_POST['zona']);
$id_emp = "";
if (isset($_SESSION['username'])) {
    $id_emp = $_SESSION['username'];
};

$log = "INSERT INTO Viewing_slots (emp_id, slot_zone) VALUES ('$id_emp', '$zona')";
$result = $conn->query($log) or die("Errore durante l'inserimento del log: ". $conn->connect_error);

?>