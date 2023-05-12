<?php
session_start();
$username = "";
if (isset($_SESSION["username"])) {
  $username = $_SESSION["username"];
}
?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ParkMe - The easy way to park.</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
  <script src="../../js/usr_int.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../../css/usr_int.css">
  <link rel="icon" type="image/x-icon" href="../../img/favicon.ico">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark">
    <h2 style="letter-spacing: -1px;">
      <a class="navbar-brand" href="#" style="color: white;">ParkMe</a>
    </h2>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: white;">Parcheggia</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sub_pg.php">Abbonamenti</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="tkt_pg.php">Ticket</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="acc.php">
            <i class="fas fa-user" style="color: white;"></i>&nbsp&nbspProfilo
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" onclick="logout()" style="cursor: pointer;">
            &nbsp&nbsp<i class="fas fa-sign-out-alt" style="color: white;"></i>
          </a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Main Content -->
  <div id="map"></div>
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbNPf97Eygay20RttKTUPcgDjcbfh8CB8&callback=initMap&v=weekly"
    defer></script>
  <div class="park-box">
    <div class="park-box-inner">
      <span class="wtd" id="up-text" style="font-weight: 400;">Ciao
        <strong style="color: #376ba7;">
          <?php echo $username ?>
        </strong>,<br>Clicca sulla mappa per
        visualizzare i posti auto vicini...
      </span>
      <form action="" id="park-form" style="display: none;">
        <div class="row form-group">
          <div class="col-md-6">
            <label for="ins-zona">O inserisci la zona:</label>
          </div>
          <div class="col-md-6">
            <input type="text" id="zona_input" name="ins-zona">
          </div>
          <div class="col-md-6">
            <label for="park_slot">Scegli il posto:</label>
          </div>
          <div class="col-md-6">
            <select name="park_slot" id="park_slot_sel"></select>
          </div>
          <div class="col-md-6">
            <div class="btn-cont">
              <button class="btn btn-primary" id="reserve_btn" data-toggle="modal"
                data-target="#reservation">Prenota</button>
            </div>
          </div>
          <div class="col-md-6">
            <div class="btn-cont">
              <button class="btn btn-primary" id="park_now_btn" data-toggle="modal"
                data-target="#parknow">Parcheggia</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- Modal -->
  <div class="modal fade" id="reservation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content"></div>
    </div>
  </div>
  <div class="modal fade" id="parknow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content"></div>
    </div>
  </div>
</body>

</html>