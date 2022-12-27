<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Parking Lot Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="header">
        <img src="img/logo.png" alt="logo" />
    </div>
    <div class="container">
        <h2>Welcome</h2>
        <p>Please log in to access the system:</p>
        <form action="login.php" method="post">
            <label>Username:</label><br>
            <input type="text" name="username" required><br>
            <label>Password:</label><br>
            <input type="password" name="password" required><br>
            <input type="submit" name="login" value="Log in">
        </form>
    </div>
    <?php
    Include('connection.php');
    if(isset($_REQUEST['login'])){
        if($_REQUEST['username']=="" || $_REQUEST['password']==""){
            echo "Field must be filled.";
        }else{
            $sql1 = "SELECT * FROM users WHERE email = '". $_REQUEST['username']."' && password = '". $_REQUEST['password']."'";
            $result = mysqli_query($sql1);
            $num_rows = mysqli_num_rows($result);
            if($num_rows > 0){
                echo "You have logged in successfully. Redirecting...";
                sleep(3);
                header("location:filename.php"); 
            }else{
                echo "Username or password incorrect.";
            }
        }
    }
    ?>

</body>
</html>
