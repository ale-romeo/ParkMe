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
    <script src="js/land.js"></script>
    <link rel="stylesheet" type="text/css" href="css/login_signup.css">
    <link rel="stylesheet" type="text/css" href="css/emp_log.css">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        span {
            display: block;
            font-size: 20px;
            line-height: 28px;
            color: #1a1f36;
        }
    </style>
</head>

<body>
    <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
        <h1><a href="#" rel="dofollow">ParkMe</a></h1>
    </div>
    <div class="split left">
        <div class="centered">
            <div class="formbg-outer">
                <div class="formbg">
                    <div class="formbg-inner padding-horizontal--48">
                        <span class="padding-bottom--15" style="font-weight: 600; color: rgb(84, 105, 212);">Sei
                            impiegato presso un operatore?</span>
                        <form id="stripe-login" action="db/login.php" method="post">
                            <div class="field padding-bottom--24">
                                <label for="username">Email o username</label>
                                <span class="error">
                                    <?php echo $log_agErr; ?>
                                </span>
                                <input type="username" name="username" required>
                            </div>
                            <div class="field padding-bottom--24">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="pass" required>
                                <button class="btn btn-outline-secondary reveal" type="button"><i
                                        class="fa fa-eye"></i></button>
                                <div class="reset-pass">
                                    <a href="#">Password dimenticata?</a>
                                </div>
                            </div>
                            <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                                <label for="checkbox">
                                    <input type="checkbox" name="checkbox"> Rimani collegato per una settimana
                                </label>
                            </div>
                            <div class="field">
                                <input type="submit" name="log_agent" value="Accedi">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="split right">
        <div class="centered">
            <div class="formbg-outer">
                <div class="formbg">
                    <div class="formbg-inner padding-horizontal--48">
                        <span class="padding-bottom--15" style="font-weight: 600; color: rgb(84, 105, 212);">Sei un
                            impiegato comunale?</span>
                        <form id="stripe-login" action="db/login.php" method="post">
                            <div class="field padding-bottom--24">
                                <label for="username">Email o username</label>
                                <span class="error">
                                    <?php echo $log_bdErr; ?>
                                </span>
                                <input type="username" name="username" required>
                            </div>
                            <div class="field padding-bottom--24">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="pass1" required>
                                <button class="btn btn-outline-secondary reveal1" type="button"><i
                                        class="fa fa-eye"></i></button>
                                <div class="reset-pass">
                                    <a href="#">Password dimenticata?</a>
                                </div>
                            </div>
                            <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                                <label for="checkbox">
                                    <input type="checkbox" name="checkbox"> Rimani collegato per una settimana
                                </label>
                            </div>
                            <div class="field">
                                <input type="submit" name="log_body" value="Accedi">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="footer-link">
        <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center" style="">
            <span><a href="#">© ParkMe</a></span>
            <span><a href="#">Contact</a></span>
            <span><a href="#">Privacy & terms</a></span>
        </div>
    </div>
</body>

</html>