<?php
$nameErr = $surnameErr = $emailErr = $passErr = "";
if (isset($_GET["nameErr"])) {
  $nameErr = $_GET["nameErr"];
}
if (isset($_GET["surnameErr"])) {
  $surnameErr = $_GET["surnameErr"];
}
if (isset($_GET["emailErr"])) {
  $emailErr = $_GET["emailErr"];
}
if (isset($_GET["passErr"])) {
  $passErr = $_GET["passErr"];
}
?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ParkMe - The easy way to park.</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/login_signup.js"></script>
  <link rel="stylesheet" type="text/css" href="css/login_signup.css">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
  <style>
    span {
      display: block;
      font-size: 20px;
      line-height: 28px;
      color: #1a1f36;
    }
  </style>
</head>

<body>
  <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">

      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="#" rel="dofollow">ParkMe</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15">Benvenuto!</span>
              <form id="stripe-signup" action="db/signup.php" method="post">
                <div class="row field">
                  <div class="col padding-bottom--24">
                    <label for="nome">Nome</label>
                    <span class="error">
                      <?php echo $nameErr; ?>
                    </span>
                    <input type="nome" name="name" required>
                  </div>
                  <div class="col padding-bottom--24">
                    <label for="cognome">Cognome</label>
                    <span class="error">
                      <?php echo $surnameErr; ?>
                    </span>
                    <input type="cognome" name="surname" required>
                  </div>
                </div>
                <div class="field padding-bottom--24">
                  <label for="email">Email</label>
                  <span class="error" id="emailErr">
                    <?php echo $emailErr; ?>
                  </span>
                  <input type="email" id="email" name="email">
                </div>
                <div class="field padding-bottom--24">
                  <label for="password">Password</label>
                  <span class="error">
                    <?php echo $passErr; ?>
                  </span>
                  <div class="pass-box">
                    <input type="password" name="password" id="pass1" required>
                    <i class="fa-solid fa-eye" id="eye1"></i>
                  </div>
                </div>
                <div class="field">
                  <input type="submit" name="signup" value="Registrati">
                </div>
              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">
            <span class="regline">Hai già un account? <a href="login_pg.php">Login</a></span>
            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span><a href="#">© ParkMe</a></span>
              <span><a href="#">Contact</a></span>
              <span><a href="#">Privacy & terms</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#email").blur(function () {
        var email = $(this).val();
        $.ajax({
          url: 'db/ck_eml.php',
          type: 'post',
          data: { email: email },
          success: function (response) {
            if (response == 'exists') {
              $("#emailErr").html("This email is already registered");
              $("#email").val("");
            } else {
              $("#emailErr").html("");
            }
          }
        });
      });
    });
  </script>
</body>

</html>