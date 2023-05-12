<?php
include('../connection.php');
// Query per recuperare la lista degli operatori
$slot = $conn->real_escape_string($_POST['posto']);
$ag_name = $conn->real_escape_string($_POST['agent_id']);
$assign = "UPDATE Parking_Space SET id_agent = NULL WHERE id = '$slot'";
$result = $conn->query($assign) or die("Si è verificato un errore durante l'assegnazione dell'operatore al posto $slot: " . $conn->connect_error);

?>