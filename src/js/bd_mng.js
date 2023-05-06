$(document).ready(function () {
    $("#add-account").submit(function (event) {
        // Impedisci il comportamento predefinito del form
        event.preventDefault();

        // Ottieni i dati dal form
        var nome = $("#nome").val();
        var cognome = $("#cognome").val();
        var data_nascita = $("#bdate").val();

        // Invia i dati via ajax al file PHP per l'inserimento nel database
        $.ajax({
            type: "POST",
            url: "../../db/add_emp.php",
            data: {nome: nome, cognome: cognome, data_nascita: data_nascita, id_body: bd_id},
            success: function (response) {
                // Se l'inserimento ha avuto successo, mostra un messaggio di conferma
                if (response.success) {
                    alert("Utente inserito con successo!");
                } else {
                    // Se c'è stato un errore, mostra un messaggio di errore
                    alert("Si è verificato un errore: " + response.error);
                }
            },
            error: function () {
                alert("Si è verificato un errore durante l'invio dei dati.");
            }
        });
    });
});
