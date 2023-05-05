<?php
include('connection.php');

// Recupera il valore della zona selezionata dall'utente
$zona = $_GET['zona'];

// Query per recuperare i posti auto della zona selezionata
$posti = "SELECT * FROM Parking_Space WHERE id LIKE '$zona%' ORDER BY CAST(SUBSTRING(id, 2) AS UNSIGNED)";
$result = $conn->query($posti) or die("Query failed: " . $conn->connect_error);

// Genera la tabella dei parcheggi
$gr_vis = '<span class="status-icon"><i class="fas fa-circle text-success"></i></span>';
$assign = '';
$table_html = '<table>';
$table_html .= '<thead><tr><th>Codice</th><th>Stato</th><th> </th><th>Operatore</th><th> </th></tr></thead>';
$table_html .= '<tbody>';
while ($row = $result->fetch_assoc()) {
    $id = $row['id'];
    $stato = $row['STATUS'];
    $ag = $row['id_agent'];
    if ($stato == 'Available') {
        $vis = $gr_vis;
    }
    if ($ag == NULL){
        $ag = 'Vacant';
        $assign = '<a href="#" class="assegna-operatore" data-toggle="modal" data-target="#myModal">Assegna</a>
        ';
    }
    $table_html .= "<tr><td>$id</td><td>$stato</td><td>$vis</td><td>$ag</td><td>$assign</td></tr>";
}
$table_html .= '</tbody></table>';

// Stampa la tabella HTML dei parcheggi
echo $table_html;
// Chiudi la connessione al database
$conn->close();
?>