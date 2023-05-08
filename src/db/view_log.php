<?php
include("connection.php");
$zona = trim($_POST['zona']);
$id_emp = $_SESSION['id_body'];

$log = "INSERT INTO Viewing_slots (emp_id, slot_zone) VALUES ('$id_emp', '$zona')";
$result = $conn->query($log) or die("Errore durante l'inserimento del log: ". $conn->connect_error);
?>