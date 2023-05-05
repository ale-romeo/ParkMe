<?php
include('connection.php');
// Query per recuperare la lista degli operatori
$slot = $_POST['posto'];
$ag_name = $_POST['agent_id'];
$assign = "UPDATE Parking_Space SET id_agent = '$ag_name' WHERE id = '$slot'";
$result = $conn->query($assign) or die("Si è verificato un errore durante l'assegnazione dell'operatore al posto $slot: " . $conn->connect_error);
?>