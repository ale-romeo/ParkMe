<?php/*
session_start();
$cookie_name = "user";
$cookie_value = "Alessandro Romeo";
setcookie($cookie_name, $cookie_value, time() + (86400 * 30), "/"); // 86400 = 1 day
*/?>

<html>
    <body>
        
        <?php/*
        if(!isset($_COOKIE[$cookie_name])){
            echo "Cookie named '" . $cookie_name . "' is not set!";
        }else{
            echo "Cookie '" . $cookie_name . "' is set!<br>";
            echo "Value is: " . $_COOKIE[$cookie_name].".<br>";
        }
        $_SESSION["favcolor"] = "green";
        $_SESSION["favanimal"] = "cat";
        echo "Session variables are set, ".$_SESSION["favanimal"]." ".$_SESSION["favcolor"],".<br>";
        ?>
        <?php
        $cars = array("Volvo", "BMW", "Toyota");
        echo json_encode($cars);
        */?>
        <?php
        $name = $gender = $email = $comment = "";
        $nameErr = $genderErr = $emailErr = "";

        if ($_SERVER["REQUEST_METHOD"] == "POST"){
            if (empty($_POST["name"])){
                $nameErr = "Name is required";
            }else{
                $name = test_input($_POST["name"]);
                if (!preg_match("/^[a-zA-Z-' ]*$/",$name)){
                    $nameErr = "Only letters and white space allowed";
                }
            }
            if (empty($_POST["gender"])){
                $nameErr = "other";
            }else{
                $gender = test_input($_POST["gender"]);
            }
            if (empty($_POST["email"])){
                $nameErr = "Email is required";
            }else{
                $email = test_input($_POST["email"]);
                if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
                    $emailErr = "Invalid email format";
                }
            }
            if (empty($_POST["comment"])){
                $comment = "";
            }else{
                $comment = test_input($_POST["comment"]);
            }
        }

        function test_input($data){
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }
        ?>

        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <?php 
            date_default_timezone_set("Europe/Rome");
            echo "Today is " . date("l") . " " . date("d.m.Y") . " at time: " . date("H:i:s") ."<br><br>";
            ?>
            Name: <input type="text" name="name" value="<?php echo $name;?>">
            <span class="error">* <?php echo $nameErr ?></span>
            <br><br>
            E-mail: <input type="text" name="email" value="<?php echo $email;?>">
            <span class="error">* <?php echo $emailErr ?></span>
            <br><br>
            Gender:
            <input type="radio" name="gender" <?php if (isset($gender) && $gender=="female") echo "checked";?> value="female">Female
            <input type="radio" name="gender" <?php if (isset($gender) && $gender=="male") echo "checked";?> value="male">Male
            <input type="radio" name="gender" <?php if (isset($gender) && $gender=="other") echo "checked";?> value="other">Other
            <span class="error">* <?php echo $genderErr ?></span>
            <br><br>
            Comment: <textarea name="comment" rows="5" cols="40"><?php echo $comment; ?></textarea><br><br>
            <input type="submit" name="submit" value="Submit">
            <br><br>

        </form>
        
        <form action="upload.php" method="post" enctype="multipart/form-data">
            Select image to upload:
            <input type="file" name="fileToUpload" id="fileToUpload">
            <input type="submit" value="Upload Image" name="submit">
        </form>
        <?php
        if(isset($_POST['delck'])){
            setcookie("user", "", time() - 3600);
            echo "Cookie cancellato.";
        }
        ?>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <input type="submit" name="delck" value="delck1">
        </form>
    </body>
</html>
<?php
$conn->close();
// remove all session variables
session_unset();

// destroy the session
session_destroy();
?>