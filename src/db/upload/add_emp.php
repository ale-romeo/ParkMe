<?php
session_start();
include('../connection.php');

$nome = $conn->real_escape_string($_POST["nome"]);
$cognome = $conn->real_escape_string($_POST["cognome"]);
$data_nascita = $conn->real_escape_string($_POST["data_nascita"]);
$id_body = "";
$id_agent = "";
$_ = 0;

$username = strtolower($nome) . '.' . strtolower($cognome);
$pass = password_hash('prova', PASSWORD_BCRYPT);
$now = date('Y-m-d');
$exp_date = date('Y-m-d', strtotime('+1 year', strtotime($now)));

$ck_str = "SELECT * FROM Account WHERE username = '$username'";
$get_ck = $conn->query($ck_str);
$new_usrn = $username;

while ($get_ck->num_rows > 0) {
    $username = $new_usrn.$_;
    $ck_str = "SELECT * FROM Account WHERE username = '$username'";
    $get_ck = $conn->query($ck_str);
    $_++;
}
if (isset($_SESSION["id_body"])) {
    $id_body = $conn->real_escape_string($_SESSION["id_body"]);
    $email = $username . '@comune.' . strtolower($id_body) . '.it';
    $type = 'body_emp';

    $add_e = "INSERT INTO Account (username, email, password, name, surname, birth_date, Body_id, type, exp_emp_date) VALUES ('$username', '$email', '$pass', '$nome', '$cognome', '$data_nascita', '$id_body', '$type', '$exp_date')";
}
if (isset($_SESSION["id_agent"])) {
    $id_agent = $conn->real_escape_string($_SESSION["id_agent"]);
    $email = $username . '@' . strtolower($id_agent) . '.it';
    $type = 'agent_emp';

    $add_e = "INSERT INTO Account (username, email, password, name, surname, birth_date, Agent_id, type, exp_emp_date) VALUES ('$username', '$email', '$pass', '$nome', '$cognome', '$data_nascita', '$id_agent', '$type', '$exp_date')";
}

$result = $conn->query($add_e) or die("Si è verificato un errore durante l'inserimento di un nuovo impiegato." . $conn->connect_error);
echo $username . ' inserito con successo!';
?>