<?php
function test_input($data)
{
    $data = trim($data);
    return $data;
}

function check_password_strength($password)
{
    $uppercase = preg_match('@[A-Z]@', $password);
    $lowercase = preg_match('@[a-z]@', $password);
    $number = preg_match('@[0-9]@', $password);
    $specialChars = preg_match('@[^\w]@', $password);

    if (!$uppercase || !$lowercase || !$number || !$specialChars || strlen($password) < 8) {
        return false;
    } else {
        return true;
    }
}


if (isset($_REQUEST['signup'])) {
    $nameErr = $surnameErr = $emailErr = $passErr = "";
    include('connection.php');
    if (empty($_REQUEST["name"])) {
        $nameErr = "Name is required";
    } else {
        $name = test_input($_REQUEST["name"]);
        $name = $conn->real_escape_string($name);
    }
    if (empty($_REQUEST["surname"])) {
        $surnameErr = "Surname is required";
    } else {
        $surname = test_input($_REQUEST["surname"]);
        $surname = $conn->real_escape_string($surname);
    }
    if (empty($_REQUEST["email"])) {
        $emailErr = "Email is required";
    } else {
        $email = test_input($_REQUEST["email"]);
        $email = $conn->real_escape_string($email);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
        }
    }
    if (empty($_REQUEST["password"])) {
        $passErr = "Password is required";
    } else {
        $password = $_REQUEST["password"];
        $password = $conn->real_escape_string($password);
        if (check_password_strength($password)) {
            $secure_pass = password_hash($password, PASSWORD_BCRYPT);
        } else {
            $passErr = "Password doesn't match minimum security standards";
        }
    }
    if (empty($nameErr) && empty($surnameErr) && empty($emailErr) && empty($passErr)) {
        $username = explode('@', $email)[0];
        $type = 'end_user';
        $signup_query = "INSERT INTO Account (username, name, surname, email, password, type)
            VALUES('$username', '$name', '$surname', '$email', '$secure_pass', '$type')";
        $result = $conn->query($signup_query) or die("Query failed: " . $conn->connect_error);
        header("location: ../login_pg.php");
    } else {
        header("location: ../signup_pg.php?nameErr=$nameErr&surnameErr=$surnameErr&emailErr=$emailErr&passErr=$passErr");
        exit;
    }
}
?>