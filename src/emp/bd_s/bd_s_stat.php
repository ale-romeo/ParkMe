<?php
session_start();
$username = "";
$bd_id = "";
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
}
if (isset($_SESSION["id_body"])) {
    $bd_id = $_SESSION["id_body"];
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
    <script src="../../js/bd_mng.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/bd_mng.css">
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico">
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
                    <a class="nav-link" href="bd_s_dash.php">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bd_s_mng.php">Impiegati</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white;">Statistiche</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../acc.php">
                        <i class="fas fa-user" style="color: white;"></i>&nbsp&nbspProfilo
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Main Content -->
    <div class="container-fluid">
        <div class="row" style="margin-top: 200px;">
            <div class="col-6">
                <div class="box-left">

                </div>
            </div>

            <div class="col-6">
                <div class="box-right">

                </div>
            </div>
        </div>
    </div>

    <script>        var bd_id = <?php echo json_encode($bd_id); ?>;
    </script>
</body>


</html>