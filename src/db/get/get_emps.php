<?php
session_start();
include('../connection.php');

$emp = "";
$bd_id = "";
$ag_id = "";
$type = "";

if (isset($_SESSION['username'])) {
    $emp = $conn->real_escape_string($_SESSION['username']);
}
$get_class = "SELECT type FROM Account WHERE username = '$emp'";
$got_class = $conn->query($get_class);
$class = ($got_class->fetch_assoc())['type'];

$curr_date = date('Y-m-d');
$exp_emp = "UPDATE Account SET removed = 1, exp_emp_date = NULL WHERE exp_emp_date < '$curr_date'";
$rem_old = $conn->query($exp_emp);

if (isset($_SESSION["id_body"])) {
    $bd_id = $conn->real_escape_string($_SESSION["id_body"]);
    $type = 'body_emp';
    $posti = "SELECT username, surname, reg_date FROM Account WHERE type = '$type' AND Body_id = '$bd_id' AND removed = 0 ORDER BY name";
} else if (isset($_SESSION["id_agent"])) {
    $ag_id = $conn->real_escape_string($_SESSION["id_agent"]);
    $type = 'agent_emp';
    $posti = "SELECT username, surname, reg_date FROM Account WHERE type = '$type' AND Agent_id = '$ag_id' AND removed = 0 ORDER BY name";
}

$result = $conn->query($posti) or die("Query failed: " . $conn->connect_error);
$drop = '<a href="#" class="drop-emp" data-toggle="modal" data-target="#drop-emp-modal">Elimina</a>';

if ($class == 'sup_agent_emp' or $class == 'sup_body_emp') {
    $table_html = '<table>';
    $table_html .= '<thead><tr><th>Username</th><th>Cognome</th><th>Data ass.</th><th> </th></tr></thead>';
    $table_html .= '<tbody>';
    while ($row = $result->fetch_assoc()) {
        $username = $row['username'];
        $surname = $row['surname'];
        $date = explode(" ", $row['reg_date'])[0];

        $table_html .= "<tr><td>$username</td><td>$surname</td><td>$date</td><td>$drop</td></tr>";
    }
    $table_html .= '</tbody></table>';
} else {
    $table_html = '<table>';
    $table_html .= '<thead><tr><th>Nome</th><th>Cognome</th><th>Data ass.</th></tr></thead>';
    $table_html .= '<tbody>';
    while ($row = $result->fetch_assoc()) {
        $name = $row['name'];
        $surname = $row['surname'];
        $date = explode(" ", $row['reg_date'])[0];

        $table_html .= "<tr><td>$name</td><td>$surname</td><td>$date</td></tr>";
    }
    $table_html .= '</tbody></table>';
}

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>