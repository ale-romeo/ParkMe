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
    <div class="loginbox">
        <?php
        if (isset($_SESSION["error"])) {
            echo "<img src='img/logo.png' alt='logo' />
            <p class='downlogo'>" . $_SESSION["error"] . " Try again.</p>";
            unset($_SESSION["error"]);
        }else{
            echo "<img src='img/logo.png' alt='logo' />
            <p class='downlogo'>Login</p>";
        }
        ?>
        <form action="logged.php" method="post">
            <label><input type="text" placeholder="Username" name="username" required></label><br>
            <label><input type="password" placeholder="Password" name="password" required></label><br>
            <input type="submit" name="login" value="Log in">
            <p>Don't have an account? <a href="signup.php" class="signup-button">Sign up</a></p>
        </form>
    </div>
</body>
</html>