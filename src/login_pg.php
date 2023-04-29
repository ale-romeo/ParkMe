<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ParkMe - The easy way to park.</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/land.js"></script>
  <link rel="stylesheet" type="text/css" href="css/login_signup.css">
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
              <span class="padding-bottom--15">Accedi con il tuo account.</span>
              <form id="stripe-login" action="db/login.php" method="post">
                <div class="field padding-bottom--24">
                  <label for="username">Email o username</label>
                  <input type="username" name="username" required>
                </div>
                <div class="field padding-bottom--24">
                  <label for="password">Password</label>
                  <div class="reset-pass">
                    <a href="#">Password dimenticata?</a>
                  </div>
                  <input type="password" name="password" required>
                </div>
                <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                  <label for="checkbox">
                    <input type="checkbox" name="checkbox"> Rimani collegato per una settimana
                  </label>
                </div>
                <div class="field padding-bottom--24">
                  <input type="submit" name="login" value="Accedi">
                </div>
              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">
            <span class="regline">Non hai ancora un account? <a href="signup_pg.php">Registrati</a></span>
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

</body>

</html>