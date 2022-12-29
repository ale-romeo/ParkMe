<?php
function test_input($data){
    $data = trim($data);
    return $data;
}

if(isset($_REQUEST['signup'])){
    $nameErr = $emailErr = $passErr = "";
    include('connection.php');
    if (empty($_REQUEST["username"])){
        $nameErr = "Name is required";
    }else{
        $username = test_input($_REQUEST["username"]);
        $username = $conn->real_escape_string($username);
    }
    if (empty($_REQUEST["email"])){
        $emailErr = "Email is required";
    }else{
        $email = test_input($_REQUEST["email"]);
        $email = $conn->real_escape_string($email);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $emailErr = "Invalid email format";
        }
    }
    if (empty($_REQUEST["password"])){
        $passErr = "Password is required";
    }else{
        $password = test_input($_REQUEST["password"]);
        $password = $conn->real_escape_string($password);
        $secure_pass = password_hash($password, PASSWORD_BCRYPT);
    }
    if (empty($nameErr) && empty($emailErr) && empty($passErr)) {
        $sql = "INSERT INTO admins (username, email, password)
            VALUES('$username', '$email', '$secure_pass')";
        $result = $conn->query($sql) or die("Query failed: ". $conn->connect_error);
        header("location: login_page.php");
    }
}
?>