<?php
session_start();
session_unset();
session_destroy();
header("Location: emp_log_pg.php");
exit();
?>
