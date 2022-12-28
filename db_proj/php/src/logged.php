<?php
if(isset($_REQUEST['login'])){
    Include('connection.php');
    if($_REQUEST['username']=="" || $_REQUEST['password']==""){
        echo "Field must be filled.";
    }else{
        $username = $_REQUEST["username"];
        $password = $_REQUEST["password"];
        $username = mysqli_real_escape_string($conn, $username);
        $password = mysqli_real_escape_string($conn, $password);
        $query = "SELECT * FROM users WHERE email = '$username' && password = '$password'";
        $result = mysqli_query($conn, $query) or die("Query failed: ".mysqli_error($conn));
        $num_rows = mysqli_num_rows($result);
        if($num_rows > 0){
            session_start();
            $_SESSION["username"] = $username;
            echo "You have logged in successfully. Redirecting...";
            sleep(3);
            header("location: dashboard.php"); 
        }else{
            session_start();
            $_SESSION["error"] = "Invalid username or password.";
            header("location: index.php");
        }
    }
}
?>