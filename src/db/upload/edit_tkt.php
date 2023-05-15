<?php
session_start();
include('../connection.php');

$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

// Query per recuperare la lista degli operatori
$status = 'Aperto';
$tkt_id = $conn->real_escape_string($_POST['tkt_id']);
$answer = $conn->real_escape_string($_POST['answer']);
if ($answer != "") {
    $status = 'Chiuso';
}

$assign = "UPDATE Ticket SET answer = '$answer', status = '$status', employee = '$usr' WHERE id = '$tkt_id'";
$result = $conn->query($assign) or die("Si è verificato un errore durante la modifica: " . $conn->connect_error);
if ($status == 'Aperto') {
    echo 'Ticket Aperto!';
} else {
    echo 'Ticket Risolto!';
}
?>