<?php
session_start();
$username = "";
$bd_id = "";
$ag_id = "";
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
}
if (isset($_SESSION["id_body"])) {
    $bd_id = $_SESSION["id_body"];
}
if (isset($_SESSION["id_agent"])) {
    $ag_id = $_SESSION["id_agent"];
}
?>

<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ParkMe - The easy way to park.</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../js/res_pass.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../css/res_pass.css">
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico">
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-trasparent">
        <h2 style="letter-spacing: -1px; font-family: Source Sans Pro Black;"><a class="navbar-brand" href="#"
                style="color: #4f25d6;">ParkMe</a></h2>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" onclick="history.back()" style="cursor: pointer; color: white;">
                        <i class="fas fa-arrow-left" style="color: white;"></i>&nbsp&nbspIndietro
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Main Content -->
    <div class="d-flex flex-column justify-content-center align-items-center" style="height: 90vh;">
        <div class="box">
            <span class="wtd" id="up-text" style="font-weight: 600;">Cambia password</span>
            <form id="edit-pass">
                <div class="row form-group">
                    <div class="col-md-12">
                        <span class="error" id="passErr"></span>
                        <span class="error" id="npassErr"></span>
                    </div>
                    <div class="col-md-12">
                        <label for="password">Passowrd attuale:</label><br>
                        <input type="password" id="password" name="password">
                    </div>

                    <div class="col-md-12">
                        <label for="npass">Nuova password:</label><br>
                        <input type="text" id="npass" name="npass">
                    </div>

                    <div class="col-md-12">
                        <label for="cpass">Conferma password:</label><br>
                        <input type="text" id="cpass" name="cpass">
                    </div>

                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary">Salva</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>


</html>