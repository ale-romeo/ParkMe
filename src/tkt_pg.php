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
  <script src="js/tkt_end.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/tkt_end.css">
  <link rel="icon" type="image/x-icon" href="img/favicon.ico">
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
          <a class="nav-link" href="user_int.php">Parcheggia</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sub_pg.php">Abbonamenti</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="color: white;">Ticket</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="end_usr_acc.php">
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
  <div class="d-flex flex-column justify-content-center align-items-center" style="height: 90vh;">
        <div class="box">
            <span class="wtd" id="up-text" style="font-weight: 600;">Visualizza Tickets</span>
            <div id="table-wrapper" style="display: none;">
                <table id="tabella-tickets">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            </div>
            <div class="btn-cont">
              <button type="button" class="btn btn-primary" id="btn-tkt">Nuovo Ticket</button>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="tkt-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content"></div>
        </div>
    </div>
    <div class="modal fade" id="new-tkt-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content"></div>
        </div>
    </div>
</body>

</html>