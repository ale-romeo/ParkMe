<!DOCTYPE html>
<html>

<head>
  <title>ParkME</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="styletest.css">
  <link rel="shortcut icon" href="img/favicon.ico">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="js/land.js"></script>
</head>

<body>

  <nav class="navbar navbar-expand-sm fixed-top navbar-light">
    <a class="navbar-brand" href="#"><img id="logo" src="img/ParkME-logos_white.png" alt="Logo"></a>
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto" id="dropdown-menu">
          <li class="nav-item">
            <a class="nav-link" href="#home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#about">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#services">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#contact">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container-fluid my-5">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h1 class="text-white pt-5">Welcome to our parking app</h1>
        <p class="text-white pt-3">We offer an easy way to find, reserve and navigate to parking spots</p>
        <div class="text-center pt-3">
          <a href="login.php" class="btn btn-primary mr-2">Login</a>
          <a href="signup.php" class="btn btn-secondary">Signup</a>
        </div>
      </div>
    </div>
  </div>


</body>

</html>