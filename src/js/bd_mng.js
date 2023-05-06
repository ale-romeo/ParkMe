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
            data: { nome: nome, cognome: cognome, data_nascita: data_nascita, id_body: bd_id },
            success: function (response) {
                alert("Utente inserito con successo!");
                show_emps();
            },
            error: function () {
                alert("Si è verificato un errore durante l'invio dei dati.");
            }
        });
    });
});

function show_emps() {
    $.ajax({
        url: "../../db/get_emps.php",
        type: "GET",
        data: {
            bd_id: bd_id
        },
        success: function (data) {
            // Aggiungi le righe della tabella con i dati dei parcheggi ottenuti dal database
            $("#tabella-personale").html(data);

            // Visualizza la tabella
            $("#table-wrapper").show();

            //Scrolla all'inizio della tabella
            $("#table-wrapper").scrollTop(0);
        },
        error: function () {
            alert('Si è verificato un errore durante la visualizzazione dei posti.');
        }
    });
}

$(document).ready(function () {
    show_emps();
});
