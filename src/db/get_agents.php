<?php
include('connection.php');
// Query per recuperare la lista degli operatori

$get_ag = "SELECT NAME FROM Agent";
$result = $conn->query($get_ag) or die('Database error'. $conn->connect_error);

// Costruisce un array contenente i dati degli operatori
$operatori = array();
while ($row = $result->fetch_assoc()) {
    $operatori[] = $row['NAME'];
}

// Converte l'array in formato JSON e lo restituisce come response alla chiamata AJAX
header('Content-Type: application/json');
echo json_encode($operatori);
?>