<?php
include('../connection.php');
// Query per recuperare la lista degli operatori
$status = 'Aperto';
$tkt_id = $conn->real_escape_string($_POST['tkt_id']);
$answer = $conn->real_escape_string($_POST['answer']);
if ($answer != "") {
    $status = 'Chiuso';
}

$assign = "UPDATE Ticket SET answer = '$answer', status = '$status' WHERE id = '$tkt_id'";
$result = $conn->query($assign) or die("Si è verificato un errore durante la modifica: " . $conn->connect_error);
if ($status == 'Aperto') {
    echo 'Ticket Aperto!';
} else {
    echo 'Ticket Risolto!';
}
?>