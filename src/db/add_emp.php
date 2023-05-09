<?php
session_start();
include('connection.php');

$nome = $_POST["nome"];
$cognome = $_POST["cognome"];
$data_nascita = $_POST["data_nascita"];
$id_body = "";
if (isset($_SESSION["id_body"])) {
    $id_body = $_SESSION["id_body"];
}
$username = strtolower($nome) . '.' . strtolower($cognome);
$email = $username . '@comune.' . strtolower($id_body) . '.it';
$type = 'body_emp';
$pass = password_hash('prova', PASSWORD_BCRYPT);

$add_e = "INSERT INTO Account (username, email, password, name, surname, birth_date, Body_id, type) VALUES ('$username', '$email', '$pass', '$nome', '$cognome', '$data_nascita', '$id_body', '$type')";
$result = $conn->query($add_e) or die("Si è verificato un errore durante l'inserimento di un nuovo impiegato." . $conn->connect_error);

?>