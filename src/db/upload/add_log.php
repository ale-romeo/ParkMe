<?php
session_start();
include("../connection.php");
$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
};

$action = $conn->real_escape_string($_POST['action']);

$zone = "";
$sub_id = "";
$slot = "";
$tkt = "";
$id_emp = "";

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
if (isset($_POST['emp_id'])) {
    $id_emp = $conn->real_escape_string($_POST['emp_id']);
}

if ($action == 'view') {
    $log = "INSERT INTO Operations_Log (user_id, action, zone) VALUES ('$usr', 'Visualizzazione Zona', '$zone')";

    echo $log;
}
if ($action == 'sub_edit') {
    $log = "INSERT INTO Operations_Log (user_id, action, sub_id) VALUES ('$usr', 'Modifica Abbonamento', '$sub_id')";
}
if ($action == 'tar_edit') {
    if ($zone != ""){
        $log = "INSERT INTO Operations_Log (user_id, action, zone) VALUES ('$usr', 'Modifica Tariffa', '$zone')";
    } else {
        $log = "INSERT INTO Operations_Log (user_id, action, slot_id) VALUES ('$usr', 'Modifica Tariffa', '$slot')";
    }
}
if ($action == 'tkt') {
    $log = "INSERT INTO Operations_Log (user_id, action, tkt_id) VALUES ('$usr', 'Risoluzione Ticket', '$tkt')";
}
if ($action == 'slot_ass') {
    $log = "INSERT INTO Operations_Log (user_id, action, slot_id) VALUES ('$usr', 'Assegnazione Posto', '$slot')";
}
if ($action == 'slot_rem') {
    $log = "INSERT INTO Operations_Log (user_id, action, slot_id) VALUES ('$usr', 'Rimozione Posto', '$slot')";
}
if ($action == 'emp_add') {
    $log = "INSERT INTO Operations_Log (user_id, action, emp_id) VALUES ('$usr', 'Aggiunta Impiegato', '$id_emp')";
}
if ($action == 'emp_rem') {
    $log = "INSERT INTO Operations_Log (user_id, action, emp_id) VALUES ('$usr', 'Rimozione Impiegato', '$id_emp')";
}
if ($action == 'sub_add') {
    $log = "INSERT INTO Operations_Log (user_id, action, sub_id) VALUES ('$usr', 'Aggiunta Abbonamento', '$sub_id')";
}
if ($action == 'sub_rem') {
    $log = "INSERT INTO Operations_Log (user_id, action, sub_id) VALUES ('$usr', 'Rimozione Abbonamento', '$sub_id')";
}

$result = $conn->query($log) or die("Errore durante l'inserimento del log: ". $conn->connect_error);

?>