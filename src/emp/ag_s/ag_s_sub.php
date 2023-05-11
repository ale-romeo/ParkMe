<?php
session_start();
$username = "";
$ag_id = "";
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
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
    <script src="../../js/ag_s_sub.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/ag_sub.css">
    <link rel="icon" type="image/x-icon" href="../../img/favicon.ico">
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
                    <a class="nav-link" href="ag_s_dash.php">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ag_s_mng.php">Impiegati</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white;">Abbonamenti</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ag_s_logs.php">Logs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ag_s_tkt.php">Ticket</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: white; font-weight: 600;">
                        <?php echo $ag_id ?>&nbsp&nbsp&nbsp&nbsp
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../acc.php">
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
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center" style="height: 90vh;">
            <div class="col-6">
                <div class="box-left">
                    <div class="box-left-inner">
                        <span class="wtd" id="up-text" style="font-weight: 400;">Ciao
                            <strong style="color: #4f25d6;">
                                <?php echo $username ?>
                            </strong>,<br>Vuoi creare un nuovo abbonamento?
                        </span>
                        <form id="add-sub">
                            <div class="row form-group">
                                <div class="col-md-4">
                                    <label for="subs-types">Tipo</label>
                                    <select name="subs-types" id="subs-sel" required>
                                        <option value="Settimanale">Settimanale</option>
                                        <option value="Mensile">Mensile</option>
                                        <option value="Trimestrale">Trimestrale</option>
                                        <option value="Semestrale">Semestrale</option>
                                        <option value="Annuale">Annuale</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="title">Titolo</label>
                                    <input type="text" name="title" id="title" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="price">Prezzo</label>
                                    <input type="number" id="sub_price" name="price" min="0" max="10000" step="0.01" required>
                                </div>
                                <div class="col-md-12 text-right">
                                    <button type="submit" class="btn btn-primary">Aggiungi</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-6">
                <div class="box-right">
                    <div class="box-right-inner">
                        <span class="padding-bottom--15 wtd" id="up-text" style="font-weight: 400;">Lista impiegati:
                        </span>
                        <div id="table-wrapper" style="display: none;">
                            <table id="tabella-abbonamenti">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="edit-sub-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content"></div>
        </div>
    </div>
</body>


</html>