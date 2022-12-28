<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Parking Lot Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <img src="img/logo.png" alt="logo" />
        <div class="loginbox">
            <?php
            if (isset($_SESSION["error"])) {
                echo "<h2>Welcome</h2>
                <p>" . $_SESSION["error"] . " Try again.</p>";
                unset($_SESSION["error"]);
            }else{
                echo "<h2>Welcome</h2>
                <p>Please log in to access the system:</p>";
            }
            ?>
            <form action="logged.php" method="post">
                <label>Username:</label><br>
                <input type="text" name="username" required><br>
                <label>Password:</label><br>
                <input type="password" name="password" required><br>
                <input type="submit" name="login" value="Log in">
            </form>
        </div>
    </div>
</body>
</html>