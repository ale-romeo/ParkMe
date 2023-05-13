$(document).on("click", ".drop-emp", function () {
    var user_id = $(this).closest("tr").find("td:first-child").text();
    var confirmDrop = confirm("Sei sicuro di voler rimuovere questo account?");

    if (confirmDrop) {
        $.ajax({
            type: "POST",
            url: "../../db/drop/drop_emp.php",
            data: { user_id: user_id },
            success: function () {
                alert("Account impiegato eliminato");
                emp_rem_log(user_id);
                // Aggiorna la tabella degli abbonamenti
                show_emps();
            },
            error: function () {
                alert('Si è verificato un errore durante l\'eliminazione dell\'abbonamento.');
            }
        });
    }
});

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
            url: "../../db/upload/add_emp.php",
            data: { nome: nome, cognome: cognome, data_nascita: data_nascita },
            success: function (r) {
                alert(r);
                emp_add_log(r.replace(" inserito con successo!", ""));
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
        url: "../../db/get/get_emps.php",
        type: "POST",
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

function emp_add_log(emp_id) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'emp_add', emp_id: emp_id },
        error: function() {
            alert('Si è verficato un errore durante il salvataggio del log.');
        }
    });
}

function emp_rem_log(emp_id) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'emp_rem', emp_id: emp_id },
        error: function() {
            alert('Si è verficato un errore durante il salvataggio del log.');
        }
    });
}

function logout() {
    var confirmLogout = confirm("Sei sicuro di voler effettuare il logout?");
    if (confirmLogout) {
        window.location.href = "../../logout_emp.php";
    }
}
