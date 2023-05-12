<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ParkMe - The easy way to park.</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
  <script src="js/usr_int.js"></script>
  <link rel="stylesheet" type="text/css" href="css/login_signup.css">
  <link rel="stylesheet" type="text/css" href="css/usr_int.css">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
</head>

<body>
  <div id="map"></div>
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbNPf97Eygay20RttKTUPcgDjcbfh8CB8&callback=initMap&v=weekly"
    defer></script>
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbNPf97Eygay20RttKTUPcgDjcbfh8CB8&libraries=places&callback=initMap" async defer></script>
  <div id="form-container" class="formbg">
    <div class="formbg-inner padding-horizontal--48">
      <span class="padding-bottom--15 wtd" style="color: #4f25d6;">Dove si trova il parcheggio?</span>
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
</body>

</html>