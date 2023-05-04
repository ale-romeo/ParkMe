<?php
include('connection.php');

// Recupera il valore della zona selezionata dall'utente
$zona = $_GET['zona'];

// Query per recuperare i posti auto della zona selezionata
$posti = "SELECT * FROM posti_auto WHERE id LIKE '$zona%'";
$result = $conn->query($posti) or die("Query failed: " . $conn->connect_error);

// Genera la tabella dei parcheggi
if ($result->num_rows > 0) {
    echo "<table>";
    echo "<tr><th>ID</th><th>Stato</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["id"] . "</td>";
        echo "<td>" . $row["stato"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Nessun parcheggio trovato per la zona $zona.";
}

// Chiudi la connessione al database
$conn->close();
?>