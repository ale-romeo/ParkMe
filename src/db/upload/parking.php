<?php
session_start();
date_default_timezone_set('Europe/Rome');
include('../connection.php');

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$amount = "";
$reduction = 0;
// Query per recuperare la lista degli operatori
$slot = $conn->real_escape_string($_POST['posto']);
$tar_opt = $conn->real_escape_string($_POST['tar']);
$durata = $conn->real_escape_string($_POST['durata']);
$targa = $conn->real_escape_string($_POST['targa']);

$get_slot_info = "SELECT * FROM Parking_Space WHERE id = '$slot'";
$res_slot = $conn->query($get_slot_info);
$row_slot = $res_slot->fetch_assoc();
$slot_agent = $row_slot['id_agent'];

$time = date('Y-m-d H:i:s', time());

$get_usr_sub = "SELECT Subscription.reduction FROM Subscription_Payment JOIN Subscription ON Subscription_Payment.sub_id = Subscription.id WHERE Subscription_Payment.user_id = '$usr' AND Subscription.id_agent = '$slot_agent' AND Subscription_Payment.expiration < '$time'";
$res_usr_sub = $conn->query($get_usr_sub);
if ($res_usr_sub->num_rows > 0) {
    while ($row_sub = $res_usr_sub->fetch_assoc()) {
        $reduction = $row_sub['reduction'];
    }
}

if ($tar_opt == 'tar_or') {
    $price = $row_slot['hourly_price'] - $reduction;
    $amount = round(($price * $durata / 60 + 0.17), 2);
    $up_balance = "UPDATE Agent SET balance = balance + $amount WHERE NAME = '$slot_agent'";
    $uptodate = $conn->query($up_balance);
}
if ($tar_opt == 'tar_per') {
    $price = $row_slot['periodic_price'] - $reduction;
    $amount = round(($price * $durata / 60 + 0.35), 2);
    $up_balance = "UPDATE Agent SET balance = balance + $amount WHERE NAME = '$slot_agent'";
    $uptodate = $conn->query($up_balance);
}

$pay = "INSERT INTO Parking_Payment (status, amount, user_id, park_id) VALUES (1, '$amount', '$usr', '$slot')";
$res_pay = $conn->query($pay) or die("Si è verificato un errore durante il pagamento: " . $conn->connect_error);

$exp = date('Y-m-d H:i:s', strtotime("+ $durata minutes", time()));
$occupied = "UPDATE Parking_Space SET STATUS = 'Occupied', parking_ending_time = '$exp', plate = '$targa' WHERE id = '$slot'";
$res_occ = $conn->query($occupied);
?>