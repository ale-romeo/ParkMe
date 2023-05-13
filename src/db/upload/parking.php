<?php
session_start();
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

$get_slot_info = "SELECT * FROM Parking_Space WHERE id = '$slot'";
$res_slot = $conn->query($get_slot_info);
$row_slot = $res_slot->fetch_assoc();
$slot_agent = $row_slot['id_agent'];

$get_usr_sub = "SELECT Payment.sub_id, Payment.agent_id, Payment.date, Subscription.reduction FROM Payment JOIN Subscription ON Payment.sub_id = Subscription.id WHERE Payment.user_id = '$usr' AND Subscription.id_agent = '$slot_agent'";
$res_usr_sub = $conn->query($get_usr_sub);
if ($res_usr_sub->num_rows > 0) {
    while ($row_sub = $res_usr_sub->fetch_assoc()) {
        if (time() - strtotime($row_sub['date']) < 604800) {
            $reduction = $row_sub['reduction'];
            $agent = $row_sub['agent_id'];
        }
    }
}

if ($tar_opt == 'tar_or') {
    $price = $row_slot['hourly_price'] - $reduction;
    $amount = $price*$durata/60 + 0.17;
}
if ($tar_opt == 'tar_per') {
    $price = $row_slot['periodic_price'] - $reduction;
    $amount = $price*$durata/60 + 0.35;
}

$pay = "INSERT INTO Payment (amount, user_id, park_id, agent_id) VALUES ('$amount', '$usr', '$slot', '$slot_agent')";
$res_pay = $conn->query($pay) or die("Si è verificato un errore durante il pagamento: " . $conn->connect_error);

$exp = date('Y-m-d H:i:s', strtotime("+ $durata minutes", time()));
$occupied = "UPDATE Parking_Space SET STATUS = 'Occupied', parking_ending_time = '$exp' WHERE id = '$slot'";
$res_occ = $conn->query($occupied);
?>