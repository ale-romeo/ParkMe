<?php

if (isset($_REQUEST['log_end'])) {
    $log_endErr = "";
    include('connection.php');
    $username = $_REQUEST["username"];
    $password = $_REQUEST["password"];
    $type = 'end_user';
    $username = $conn->real_escape_string($username);
    $password = $conn->real_escape_string($password);
    $sql = "SELECT * FROM Account WHERE (email = '$username' OR username = '$username') AND type = '$type'";
    $result = $conn->query($sql) or die("Query failed: " . $conn->connect_error);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            session_start();
            $_SESSION["username"] = explode('@', $username)[0];
            header("location: ../user_int.php");
            exit(); // Assicurati di uscire subito dopo il redirect
        } else {
            $log_endErr = "Invalid username or password";
            header("location: ../login_pg.php?enderror=$log_endErr");
            exit();
        }
    } else {
        $log_endErr = "Invalid username or password";
        header("location: ../login_pg.php?enderror=$log_endErr");
        exit();
    }

}

if (isset($_REQUEST['log_body'])) {
    $log_bdErr = "";
    include('connection.php');
    $username = $_REQUEST["username"];
    $password = $_REQUEST["password"];
    $type = 'body_emp';
    $type_sup = 'sup_body_emp';
    $username = $conn->real_escape_string($username);
    $password = $conn->real_escape_string($password);
    $sql = "SELECT * FROM Account WHERE (email = '$username' OR username = '$username') AND (type = '$type' OR type = '$type_sup')";
    $result = $conn->query($sql) or die("Query failed: " . $conn->connect_error);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            session_start();
            $_SESSION["username"] = explode('@', $username)[0];
            $_SESSION["id_body"] = $row['Body_id'];
            if ($row['type'] == $type_sup) {
                header("location: ../emp/bd_s/bd_s_dash.php");
            }else {
                header("location: ../emp/bd/bd_map.php");
            }
            exit(); // Assicurati di uscire subito dopo il redirect
        } else {
            $log_bdErr = "Invalid username or password";
            header("location: ../emp_log_pg.php?bderror=$log_bdErr");
            exit();
        }
    } else {
        $log_bdErr = "Invalid username or password";
        header("location: ../emp_log_pg.php?bderror=$log_bdErr");
        exit();
    }

}

if (isset($_REQUEST['log_agent'])) {
    $log_agErr = "";
    include('connection.php');
    $username = $_REQUEST["username"];
    $password = $_REQUEST["password"];
    $type = 'agent_emp';
    $type_sup = 'sup_agent_emp';
    $username = $conn->real_escape_string($username);
    $password = $conn->real_escape_string($password);
    $sql = "SELECT * FROM Account WHERE (email = '$username' OR username = '$username') AND (type = '$type' OR type = '$type_sup')";
    $result = $conn->query($sql) or die("Query failed: " . $conn->connect_error);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row['password'])) {
            session_start();
            $_SESSION["username"] = explode('@', $username)[0];
            $_SESSION['id_agent'] = $row['Agent_id'];
            if ($row['type'] == $type_sup) {
                header("location: ../emp/ag_s/ag_s_dash.php");
            }else {
                header("location: ../emp/ag/ag_dash.php");
            }
            exit(); // Assicurati di uscire subito dopo il redirect
        } else {
            $log_agErr = "Invalid username or password";
            header("location: ../emp_log_pg.php?agerror=$log_agErr");
            exit();
        }
    } else {
        $log_agErr = "Invalid username or password";
        header("location: ../emp_log_pg.php?agerror=$log_agErr");
        exit();
    }

}
?>
