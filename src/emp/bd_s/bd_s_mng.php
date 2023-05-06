<?php
session_start();
$username = "";
$bd_id = "";
$addErr = "";
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
}
if (isset($_SESSION["id_body"])) {
    $bd_id = $_SESSION["id_body"];
}
if (isset($_GET["adderror"])) {
    $addErr = $_GET["adderror"];
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
    <link rel="stylesheet" type="text/css" href="../../css/login_signup.css">
    <link rel="stylesheet" type="text/css" href="../../css/usr_int.css">
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
                    <a class="nav-link" href="#" style="color: white;">Impiegati</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Statistiche</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- Main Content -->
    <div id="form-container" class="formbg">
        <div class="formbg-inner padding-horizontal--48">
            <span class="padding-bottom--15 wtd" id="up-text" style="font-weight: 400;">Ciao
                <strong style="color: #4f25d6;">
                    <?php echo $username ?>
                </strong>,<br>Vuoi creare un nuovo account?
            </span>
            <form id="add-account">
                <div class="form-group row">
                    <div class="col-md-4">
                        <label for="name">Nome</label>
                        <input type="text" name="name" id="nome" required>
                    </div>
                    <div class="col-md-4">
                        <label for="surname">Cognome</label>
                        <input type="text" name="surname" id="cognome" required>
                    </div>
                    <div class="col-md-4">
                        <label for="bdate">Data di nascita</label>
                        <input type="date" id="bdate" name="bdate" required>
                    </div>
                    <div class="col-md-12 text-right">
                        <button type="submit" class="btn btn-primary">Aggiungi</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content"></div>
        </div>
    </div>
    <script>        var bd_id = <?php echo json_encode($bd_id); ?>;
    </script>
</body>


</html>