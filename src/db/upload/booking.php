<?php
session_start();
date_default_timezone_set('Europe/Rome');
include('../connection.php');

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$slot = $conn->real_escape_string($_POST['posto']);

$get_slot_info = "SELECT * FROM Parking_Space WHERE id = '$slot'";
$res_slot = $conn->query($get_slot_info);
$row_slot = $res_slot->fetch_assoc();
$slot_agent = $row_slot['id_agent'];
$res_price = $row_slot['reservation_price'];

$res_date = date('Y-m-d H:i:s', strtotime("+ 10 minutes", time()));

$res_query = "INSERT INTO Reservation (solved, id_user, id_parking, ending_time) VALUES (1, '$usr', '$slot', '$res_date')";
$reserve = $conn->query($res_query);
$res_id = $conn->insert_id;

$pay_res_query = "INSERT INTO Payment (service, amount, user_id, res_id, agent_id) VALUES ('Prenotazione', '$res_price', '$usr', '$res_id', '$slot_agent')";
$pay_res = $conn->query($pay_res_query);

$status_query = "UPDATE Parking_Space SET STATUS = 'Reserved' WHERE id = '$slot'";
$status = $conn->query($status_query);

?>