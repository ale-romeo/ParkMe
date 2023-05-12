<?php
session_start();
include("../connection.php");
$zona = $conn->real_escape_string(trim($_POST['zona']));
$id_emp = "";
if (isset($_SESSION['username'])) {
    $id_emp = $conn->real_escape_string($_SESSION['username']);
};

$log = "INSERT INTO Operations_Log (user_id, slot_zone, action) VALUES ('$id_emp', '$zona', 'Visualizzazione Zona')";
$result = $conn->query($log) or die("Errore durante l'inserimento del log: ". $conn->connect_error);

?>