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

$buy = "INSERT INTO Subscription_Payment (amount, user_id, sub_id, expiration) VALUES ('$price', '$usr', '$sub_id', '$exp')";
$res = $conn->query($buy);
echo $buy;

$up_balance = "UPDATE Agent SET balance = balance + $price WHERE NAME = '$ag'";
$uptodate = $conn->query($up_balance);

?>