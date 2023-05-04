<?php
session_start();
$username = "";
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
}
?>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ParkMe - The easy way to park.</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="js/land.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/login_signup.css">
    <link rel="stylesheet" type="text/css" href="../../css/usr_int.css">
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>
    
    <!-- Main Content -->
    

    <div id="form-container" class="formbg">
    <div class="formbg-inner padding-horizontal--48">
      <span class="padding-bottom--15 wtd" style="color: #4f25d6; font-weight: 600;">Bentornato, <?php $username?>  </span>
      <form id="stripe-signup" action="db/signup.php" method="post">
        <div class="field padding-bottom--24">
          <label for="address">Indirizzo</label>
          <input type="indirizzo" name="address" id="address-input" required>
        </div>
        <div class="field padding-bottom--24">
          <label for="cognome">Posto</label>
          <span class="error">
          </span>
          <input type="cognome" name="surname" required>
        </div>
        <div class="field">
          <input type="submit" name="signup" value="Registrati">
        </div>
      </form>
    </div>
  </div>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html