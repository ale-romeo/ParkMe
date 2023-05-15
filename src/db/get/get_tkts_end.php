<?php
session_start();
include("../connection.php");

$usr = "";
if(isset($_SESSION['username'])) {
    $usr = $conn->real_escape_string($_SESSION['username']);
}

$get_tkts = "SELECT * FROM Ticket WHERE id_user = '$usr' ORDER BY id DESC";
$res = $conn->query($get_tkts) or die("Errore durante il caricamento dei tickets: ". $conn->connect_error);
$show_text = '<a href="#" class="mostra-testo" data-toggle="modal" data-target="#show-text">Visualizza</a>';

$status_open = '<span class="status-icon"><i class="fas fa-circle text-success"></i></span>';
$status_close = '<span class="status-icon"><i class="fas fa-circle"></i></span>';

$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Utente</th><th>Titolo</th><th>Data</th><th>Stato</th><th> </th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $res->fetch_assoc()) {
    $id = $row['id'];
    $usrn = $row['id_user'];
    $title = $row['title'];
    $date = $row['date'];
    $status = $row['status'];

    if ($status == 'Chiuso') {
        $table_html .= "<tr><td>$id</td><td>$usrn</td><td>$title</td><td>$date</td><td>$status_close</td><td>$show_text</td></tr>";
    }
    else if ($status == 'Aperto') {
        $table_html .= "<tr><td>$id</td><td>$usrn</td><td>$title</td><td>$date</td><td>$status_open</td><td>$show_text</td></tr>";
    }
}

$table_html .= '</tbody></table>';
// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();

?>