<?php

session_start();

if(isset($_POST['Park'])) {
  // Connect to database and generate unique ticket code
  $ticket = generateUniqueCode();
  include('connection.php');

  // Insert ticket code into database table
  $sql = "INSERT INTO guests (code) VALUES ('$ticket')";
  $result = $conn->query($sql) or die("Query failed: ". $conn->connect_error);

  echo "Your ticket code is: $ticket";
}

function generateUniqueCode() {
  // Generate unique code using current timestamp and random characters
  return time() . substr(str_shuffle(str_repeat('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', mt_rand(1,10))), 1, 10);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Parking Lot Management System</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/land.js"></script>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div class="loginbox">
    <img src='img/logo.png' alt='logo' />
    <form action="guest.php" method="post">
        <input type="submit" class="ticket" name="Park" value="Get Ticket" onclick="getTicket()">
        <p class="belowtxt">Are you an Admin? <a href="login_page.php" class="signup-button">Log in</a></p>
    </form>
  </div>
</body>
<footer>
  <div class="footer">
    <div class="left">
      <p class="copyright">Copyright 2022</p>
    </div>
    <div class="center">
      <ul>
        <li><a href="mailto:romeoalessandroing@gmail.com" class="contact">Contact</a></li>
      </ul>
    </div>
    <div class="right">
      <p class="author">Alessandro Romeo</p>
    </div>
  </div>
</footer>
</html>