<?php
$log_agErr = $log_bdErr = "";
if (isset($_GET["agerror"])) {
    $log_agErr = $_GET["agerror"];
}
if (isset($_GET["bderror"])) {
    $log_bdErr = $_GET["bderror"];
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="js/login_signup.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/emp_log.css">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    </head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-trasparent">
        <h2 style="letter-spacing: -1px;"><a class="navbar-brand" href="#"
                style="color: #5469d4;">ParkMe</a></h2>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
    <!-- Main Content -->
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center" style="height: 80vh">
            <div class="col-6">
                <div class="formbg left">
                    <span class="intr">Sei impiegato presso un operatore?</span>
                    <form id="stripe-login" action="db/login.php" method="post">
                        <div class="row form-group">
                            <div class="col-md-12">
                                <label for="username">Email o username</label>
                                <span class="error">
                                    <?php echo $log_agErr; ?>
                                </span><br>
                                <input type="text" name="username" required>
                            </div>
                            <div class="col-md-12">
                                <label for="password">Password</label><br>
                                <div class="pass-box">
                                    <input type="password" name="password" id="pass1" required>
                                    <i class="fa-solid fa-eye" id="eye1"></i>
                                </div>
                                <div class="reset-pass">
                                    <a href="#">Password dimenticata?</a>
                                </div>
                            </div>
                            <div class="col-md-12 text-right">
                                <input type="submit" name="log_agent" class="btn btn-primary" value="Accedi">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-6">
                <div class="formbg right">
                    <span class="intr">Sei un impiegato comunale?</span>
                    <form id="stripe-login" action="db/login.php" method="post">
                        <div class="row form-group">
                            <div class="col-md-12">
                                <label for="username">Email o username</label>
                                <span class="error">
                                    <?php echo $log_bdErr; ?>
                                </span><br>
                                <input type="text" name="username" required>
                            </div>
                            <div class="col-md-12">
                                <label for="password">Password</label><br>
                                <div class="pass-box">
                                    <input type="password" name="password" id="pass2" required>
                                    <i class="fa-solid fa-eye" id="eye2"></i>
                                </div>
                                <div class="reset-pass">
                                    <a href="#">Password dimenticata?</a>
                                </div>
                            </div>
                            <div class="col-md-12 text-right">
                                <input type="submit" name="log_body" class="btn btn-primary" value="Accedi">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 footer-link">
        <div class="listing d-flex align-items-center justify-content-center">
            <span><a href="#">© ParkMe</a></span>
            <span><a href="#">Contact</a></span>
            <span><a href="#">Privacy & terms</a></span>
        </div>
    </div>
</body>

</html>