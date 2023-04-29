<?php
include('connection.php');
if(isset($_POST['email'])){
	$email = $conn->real_escape_string($_POST['email']);
	$sql = "SELECT * FROM Account WHERE email='$email'";
	$result = $conn->query($sql) or die("Query failed: ". $conn->connect_error);
	if($result->num_rows > 0){
		echo 'exists';
	}else{
		echo 'not_exists';
	}
}
?>
