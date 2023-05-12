<?php
session_start();
include('../connection.php');

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$amount = "";
// Query per recuperare la lista degli operatori
$slot = $conn->real_escape_string($_POST['posto']);
$tar_opt = $conn->real_escape_string($_POST['tar']);
$durata = $conn->real_escape_string($_POST['durata']);

$get_slot_info = "SELECT * FROM Parking_Space WHERE id = '$slot'";
$res_slot = $conn->query($get_slot_info);
$row_slot = $res_slot->fetch_assoc();

if ($tar_opt == 'tar_or') {
    $amount = $row_slot['hourly_price']*$durata/60 + 0.17;
}
if ($tar_opt == 'tar_per') {
    $amount = $row_slot['periodic_price']*$durata/60 + 35;
}

date_default_timezone_set('Europe/Rome');
$date = date('Y-m-d h:i:s', time());

$pay = "INSERT INTO Payment (amount, id_user, id_parking, date) VALUES ('$amount', '$usr', '$slot', '$date')";
$res_pay = $conn->query($pay) or die("Si è verificato un errore durante il pagamento: " . $conn->connect_error);

$occupied = "UPDATE Parking_Space SET STATUS = 'Occupied' WHERE id = '$slot'";
$res_occ = $conn->query($occupied);

$countdown = "CREATE EVENT `aggiorna_stato_parcheggi` ON SCHEDULE EVERY 1 MINUTE STARTS CURRENT_TIMESTAMP DO UPDATE Parking_Space SET STATUS = 'Available' WHERE id = '$slot' AND NOW() > DATE_ADD('$date', INTERVAL $durata MINUTE) AND STATUS = 'Occupied'";
$event = $conn->query($countdown);
?>