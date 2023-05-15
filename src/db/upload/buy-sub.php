<?php
session_start();
include("../connection.php");

$usr = "";
if (isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$sub_id = $conn->real_escape_string($_POST["sub_id"]);

$get_subs = "SELECT * FROM Subscription WHERE id = '$sub_id'";
$got_subs = $conn->query($get_subs);

if ($got_subs->num_rows > 0) {
    $row = $got_subs->fetch_assoc();
    $price = $row['price'];
    $ag = $row['id_agent'];
    $type = $row['type'];
}

if ($type == 'Settimanale') {
    $exp = date('Y-m-d H:i:s', strtotime('+1 week'));
} else if ($type == 'Mensile') {
    $exp = date('Y-m-d H:i:s', strtotime('+1 month'));
} else if ($type == 'Trimestrale') {
    $exp = date('Y-m-d H:i:s', strtotime('+3 months'));
} else if ($type == 'Semestrale') {
    $exp = date('Y-m-d H:i:s', strtotime('+6 months'));
} else if ($type == 'Annuale') {
    $exp = date('Y-m-d H:i:s', strtotime('+1 year'));
}

$buy = "INSERT INTO Payment (service, amount, user_id, sub_id, agent_id, exp_sub) VALUES ('Abbonamento', '$price', '$usr', '$sub_id', '$ag', '$exp')";
$res = $conn->query($buy);

$up_balance = "UPDATE Agent SET balance = balance + $amount WHERE NAME = '$ag'";
$uptodate = $conn->query($up_balance);

?>