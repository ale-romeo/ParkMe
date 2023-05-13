<?php
session_start();
include('../connection.php');

$title = $conn->real_escape_string($_POST["titolo"]);
$price = $conn->real_escape_string($_POST["prezzo"]);
$reduction = $conn->real_escape_string($_POST["reduction"]);
$type = $conn->real_escape_string($_POST["tipo"]);
$id_agent = "";

if (isset($_SESSION["id_agent"])) {
    $id_agent = $conn->real_escape_string($_SESSION["id_agent"]);
}

$ck_sub = "SELECT * FROM Subscription WHERE title = '$title' AND price = '$price' AND type = '$type' AND reduction = '$reduction' AND id_agent = '$id_agent'";
$checked_sub = $conn->query($ck_sub);

if($checked_sub->num_rows > 0) {
    $row = $checked_sub->fetch_assoc();
    if ($row['removed'] == 1) {
        $row_id = $row['id'];
        $add_sub = "UPDATE Subscription SET removed = 0 WHERE id = '$row_id'";
    } else {
        echo 'Abbonamento già esistente';
        exit();
    }
} else {
    $add_sub = "INSERT INTO Subscription (title, type, price, reduction, id_agent) VALUES ('$title', '$type', '$price', '$reduction', '$id_agent')";
}

$result = $conn->query($add_sub) or die("Si è verificato un errore durante l'inserimento di un nuovo impiegato." . $conn->connect_error);

echo 'Nuovo abbonamento creato! ID: '. $conn->insert_id;


?>