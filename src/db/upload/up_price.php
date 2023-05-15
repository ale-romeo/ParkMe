<?php
session_start();
include("../connection.php");
$ag = "";
if (isset($_SESSION['id_agent'])) {
    $ag = $conn->real_escape_string($_SESSION['id_agent']);
}

$slot = "";
$zone = "";
$tar_or = "";
$tar_per = "";
if (isset($_POST['tar_or'])) {
    $tar_or = $_POST['tar_or'];
}
if (isset($_POST['tar_per'])) {
    $tar_per = $_POST['tar_per'];
}
if (isset($_POST['posto'])) {
    $slot = $_POST['posto'];
    $sql = "UPDATE Parking_Space SET hourly_price = ?, periodic_price = ? WHERE id = ?";
    if ($tar_or == "") {
        $tar_or = NULL;
    }
    if ($tar_per == "") {
        $tar_per = NULL;
    }
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('dds', $tar_or, $tar_per, $slot);
    $stmt->execute();
    $stmt->close();
} else if (isset($_POST['zona'])) {
    $zone = $_POST['zona'];
    $sql = "UPDATE Parking_Space SET hourly_price = ?, periodic_price = ? WHERE zone_id = ?  AND id_agent = ?";
    if ($tar_or == "") {
        $tar_or = NULL;
    }
    if ($tar_per == "") {
        $tar_per = NULL;
    }
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('dds', $tar_or, $tar_per, $zone);
    $stmt->execute();
    $stmt->close();
}
?>