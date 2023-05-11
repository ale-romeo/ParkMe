<?php
include('../connection.php');
// Query per recuperare la lista degli operatori
$sub_id = $conn->real_escape_string($_POST['sub_id']);
$price = $conn->real_escape_string($_POST['price']);
$title = $conn->real_escape_string($_POST['title']);

$assign = "UPDATE Subscription SET title = '$title', price = '$price' WHERE id = '$sub_id'";
$result = $conn->query($assign) or die("Si è verificato un errore durante la modifica: " . $conn->connect_error);

?>