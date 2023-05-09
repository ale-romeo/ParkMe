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
    <script src="../../js/acc.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../css/emp_acc.css">
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
            <span class="wtd" id="up-text" style="font-weight: 600;">Area Personale</span>
            <form id="edit-acc">
                <div class="row form-group">
                    <div class="col-md-6">
                        <label for="name">Nome:</label>
                        <input type="text" id="name" name="name" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="surname">Cognome:</label>
                        <input type="text" id="surname" name="surname" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="username">Username:</label>
                        <span class="error" id="usrErr"></span>
                        <input type="text" id="username" name="username">
                    </div>

                    <div class="col-md-6">
                        <label for="date">Data di nascita:</label>
                        <input type="date" id="bdate" name="bdate" readonly>
                    </div>

                    <div class="col-md-12">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" readonly>
                    </div>

                    <div class="col-md-6">
                        <label for="phone">Telefono:</label>
                        <input type="text" id="phone" name="phone">
                    </div>

                    <div class="col-md-6">
                        <label for="gender">Sesso:</label>
                        <select name="gender" id="gender">
                            <option value="male">Maschio</option>
                            <option value="female">Femmina</option>
                            <option value="other">Altro</option>
                        </select>
                    </div>

                    <div class="col-md-12">
                        <label for="priv_email">Email privata:</label>
                        <span class="error" id="emlErr"></span>
                        <input type="email" id="priv_email" name="priv_email">
                    </div>
                    <div class="col-md-12 text-right">
                        <button onclick="location.href = 'res_pass.php'" class="btn btn-primary">Cambia
                            password</button>
                        <button type="submit" class="btn btn-primary">Salva</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>


</html>