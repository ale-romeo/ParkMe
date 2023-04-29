<?php
if (isset($_REQUEST['login'])) {
    include('connection.php');
    $username = $_REQUEST["username"];
    $password = $_REQUEST["password"];
    $username = $conn->real_escape_string($username);
    $password = $conn->real_escape_string($password);
    $sql = "SELECT * FROM Account WHERE (email = '$username' OR username = '$username')";
    $result = $conn->query($sql) or die("Query failed: " . $conn->connect_error);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            session_start();
            $_SESSION["username"] = $username;
            header("location: ../signup_pg.php");
            exit(); // Assicurati di uscire subito dopo il redirect
        } else {
            session_start();
            $_SESSION["error"] = "Invalid username or password.";
            header("location: ../login_pg.php");
            exit();
        }
    } else {
        session_start();
        $_SESSION["error"] = "Invalid username or password.";
        header("location: ../login_pg.php");
        exit();
    }

}
?>
