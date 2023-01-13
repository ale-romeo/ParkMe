<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/land.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
  <title>QR Code Generator</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div class="loginbox">
    <img src='img/logo.png' alt='logo'/>
    <header>
        <h1>Inserire codice univoco:</h1>
    </header>
    <main>
      <form action="qrcode.php" id="qr-generation-form">
        <input type="text" id="user_id" name="user_id" placeholder="Enter user ID" autocomplete="off"/>
        <input type="submit" value="Generate QR Code"/>
      </form><br/>
      <div id="qr-code"></div>
    </main>
  </div>
  
</body>
<footer>
  <div class="footer">
    <div class="left">
      <p class="copyright">Copyright 2022</p>
    </div>
    <div class="center">
      <ul>
        <li><a href="mailto:romeoalessandroing@gmail.com" class="contact">Contact</a></li>
      </ul>
    </div>
    <div class="right">
      <p class="author">Alessandro Romeo</p>
    </div>
  </div>
</footer>
</html>