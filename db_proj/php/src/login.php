<?php
if(isset($_REQUEST['login'])){
    include('connection.php');
    if(empty($_REQUEST['username']) || empty($_REQUEST['password'])){
        echo "Field must be filled.";
    }else{
        $username = $_REQUEST["username"];
        $password = $_REQUEST["password"];
        $username = $conn->real_escape_string($username);
        $password = $conn->real_escape_string($password);
        $sql = "SELECT * FROM admins WHERE (email = '$username' OR username = '$username')";
        $result = $conn->query($sql) or die("Query failed: ". $conn->connect_error);
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                session_start();
                $_SESSION["username"] = $username;
                echo "You have logged in successfully. Redirecting...";
                sleep(3);
                header("location: dashboard.php");
            }else{
                session_start();
                $_SESSION["error"] = "Invalid username or password.";
                header("location: login_page.php");
            }
        }else{
            session_start();
            $_SESSION["error"] = "Invalid username or password.";
            header("location: login_page.php");
        }
    }
}
?>