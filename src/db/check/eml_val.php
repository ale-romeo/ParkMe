<?php
$email = trim($_POST['priv_email']);

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo 'invalid';
} else {
    echo 'valid';
}

?>