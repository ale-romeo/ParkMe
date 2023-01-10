<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/land.js"></script>
  <title>Parking Lot Management System</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div class="loginbox">
    <img src='img/logo.png' alt='logo' />
    <form action="ticket.php" method="post">
        <input type="submit" class="ticket" name="Park" value="Get Ticket">
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