<?php
session_start();
include("../connection.php");
$id_emp = "";
if (isset($_SESSION['username'])) {
    $id_emp = $conn->real_escape_string($_SESSION['username']);
};

$action = $conn->real_escape_string($_POST['action']);

$zone = "";
$sub_id = "";
$slot = "";
$tkt = "";

if (isset($_POST['zona'])) {
    $zone = $conn->real_escape_string($_POST['zona']);
}
if (isset($_POST['sub_id'])) {
    $sub_id = $conn->real_escape_string($_POST['sub_id']);
}
if (isset($_POST['posto'])) {
    $slot = $conn->real_escape_string($_POST['posto']);
}
if (isset($_POST['tkt_id'])) {
    $tkt = $conn->real_escape_string($_POST['tkt_id']);
}

if ($action == 'view') {
    $log = "INSERT INTO Managing (id_employee, action, zone) VALUES ('$id_emp', 'Visualizzazione', '$zone')";

    echo $log;
}
if ($action == 'sub_edit') {
    $log = "INSERT INTO Managing (id_employee, action, sub_id) VALUES ('$id_emp', 'Modifica Abbonamento', '$sub_id')";
}
if ($action == 'tar_edit') {
    if ($zone != ""){
        $log = "INSERT INTO Managing (id_employee, action, zone) VALUES ('$id_emp', 'Modifica Tariffa', '$zone')";
    } else {
        $log = "INSERT INTO Managing (id_employee, action, tar_id) VALUES ('$id_emp', 'Modifica Tariffa', '$slot')";
    }
}
if ($action == 'tkt') {
    $log = "INSERT INTO Managing (id_employee, tkt_id) VALUES ('$id_emp', '$tkt')";
}

$result = $conn->query($log) or die("Errore durante l'inserimento del log: ". $conn->connect_error);

?>