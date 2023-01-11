
<?php
if(extension_loaded('gd')&& function_exists('gd_info')){
  echo "Installed";
}else{
  echo "Not installed";
}
include("phpqrcode/qrlib.php");
$data = "myuniqueid";
$filename = 'img/qrcode.png';
QRcode::png($data, $filename);
echo "<img src=<?php echo $filename?>>";
?>