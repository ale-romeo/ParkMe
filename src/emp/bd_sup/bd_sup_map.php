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
    <script src="../../js/bd_map.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/login_signup.css">
    <link rel="stylesheet" type="text/css" href="../../css/usr_int.css">
    <link rel="stylesheet" type="text/css" href="../../css/bd_dash.css">
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <h2 style="letter-spacing: -1px; font-family: Source Sans Pro Black;"><a class="navbar-brand" href="#"
                style="color: #5469d4;">ParkMe</a></h2>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Parcheggi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Fruitori</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Statistiche</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Main Content -->
    <div id="map"></div>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbNPf97Eygay20RttKTUPcgDjcbfh8CB8&callback=initMap&v=weekly"
        defer></script>

    <div id="form-container" class="formbg">
        <div class="formbg-inner padding-horizontal--48">
            <span class="padding-bottom--15 wtd" style="color: #4f25d6; font-weight: 400;">Clicca su una zona per
                visualizzarne i posti auto...</span>
            <table id="tabella-parcheggi">
                <thead>
                    <tr>
                        <th>Codice</th>
                        <th>Stato</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>

</html>