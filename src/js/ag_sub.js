$(document).on("click", ".del-sub", function () {
    var sub_id = $(this).closest("tr").find("td:first-child").text();
    var confirmDrop = confirm("Sei sicuro di voler rimuovere questo abbonamento?");

    if (confirmDrop) {
        $.ajax({
            type: "POST",
            url: "../../db/drop/drop_sub.php",
            data: { sub_id: sub_id },
            success: function () {
                alert("Abbonamento eliminato");
                sub_log_rem(sub_id);
                // Aggiorna la tabella degli abbonamenti
                show_subs();
            },
            error: function () {
                alert('Si è verificato un errore durante l\'eliminazione dell\'abbonamento.');
            }
        });
    }
});


$(document).on("click", "#btn-edit-sub-modal", function () {
    // Ottieni il posto selezionato
    var sub_id = $("#edit-sub-modal-title").text().replace("Modifica abbonamento ", "");

    var title = $('#modal_title_sub').val();
    var price = $('#modal_price_sub').val();

    $.ajax({
        type: "POST",
        url: "../../db/upload/edit_sub.php",
        data: { sub_id: sub_id, title: title, price: price },
        success: function () {
            alert("Abbonamento modificato");
            // Chiudi il modal e aggiorna la tabella degli abbonamenti
            $("#edit-sub-modal").modal("hide");
            show_subs();
            sub_log(sub_id);
        },
        error: function () {
            alert('Si è verificato un errore durante la modifica dell\' abbonamento.');
        }
    });
});

$(document).on("click", ".edit-sub", function () {
    // Ottieni il posto selezionato
    var sub_id = $(this).closest("tr").find("td:first-child").text();

    $.ajax({
        url: "../../db/get/get_sub_det.php",
        type: "POST",
        data: { sub_id: sub_id },
        dataType: 'json',
        success: function (data) {
            var modalContent = '';
                modalContent += '<div class="modal-header">';
                modalContent += '<h5 class="modal-title" id="edit-sub-modal-title">Modifica abbonamento ' + sub_id + '</h5>';
                modalContent += '<button type="button" class="close" data-dismiss="modal">';
                modalContent += '<span>&times;</span>';
                modalContent += '</button>';
                modalContent += '</div>';
                modalContent += '<div class="modal-body">';
                modalContent += '<form>';
                modalContent += '<div class="form-group">';
                modalContent += '<label for="title_sub_modal">Titolo:</label><br>';
                modalContent += '<input type="text" name="title_sub_modal" id="modal_title_sub"><br>';
                modalContent += '<label for="price">Prezzo:</label><br>';
                modalContent += '<input type="number" name="price" id="modal_price_sub"><br>';
                modalContent += '</div>';
                modalContent += '</form>';
                modalContent += '</div>';
                modalContent += '<div class="modal-footer">';
                modalContent += '<button type="button" class="btn btn-primary" id="btn-edit-sub-modal">Modifica</button>';
                modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
                modalContent += '</div>';
                
            $('#edit-sub-modal .modal-content').html(modalContent);
            $('#modal_title_sub').val(data[0]);
            $('#modal_price_sub').val(data[1]);
            $('#edi-sub-modal').modal('show');
        },
        error: function () {
            alert("Errore nel caricamento dei prezzi.");
        }

    });
});

$(document).ready(function () {
    $("#add-sub").submit(function (event) {
        // Impedisci il comportamento predefinito del form
        event.preventDefault();

        // Ottieni i dati dal form
        var titolo = $("#title").val();
        var prezzo = $("#sub_price").val();
        var tipo = $("#subs-sel").val();
        var reduct = $("#sub_reduction").val();

        // Invia i dati via ajax al file PHP per l'inserimento nel database
        $.ajax({
            type: "POST",
            url: "../../db/upload/add_sub.php",
            data: { titolo: titolo, prezzo: prezzo, tipo: tipo, reduction: reduct },
            success: function (r) {
                alert(r);
                show_subs();
                sub_log_add(r.replace("Nuovo abbonamento creato! ID: ", ""));
                $("#title").val("");
                $("#sub_price").val("");
                $("#subs-sel").val("");
            },
            error: function () {
                alert("Si è verificato un errore durante l'invio dei dati.");
            }
        });
    });
});

function show_subs() {
    $.ajax({
        url: "../../db/get/get_subs.php",
        type: "POST",
        success: function (data) {
            // Aggiungi le righe della tabella con i dati dei parcheggi ottenuti dal database
            $("#tabella-abbonamenti").html(data);

            // Visualizza la tabella
            $("#table-wrapper").show();

            //Scrolla all'inizio della tabella
            $("#table-wrapper").scrollTop(0);
        },
        error: function () {
            alert('Si è verificato un errore durante la visualizzazione degli abbonamenti.');
        }
    });
}

$(document).ready(function () {
    show_subs();
});

function sub_log_rem(sub_id) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'sub_rem', sub_id: sub_id },
        error: function() {
            alert('Si è verficato un errore durante il salvataggio del log.');
        }
    });
}

function sub_log_add(sub_id) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'sub_add', sub_id: sub_id },
        error: function() {
            alert('Si è verficato un errore durante il salvataggio del log.');
        }
    });
}

function sub_log(sub_id) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'sub_edit', sub_id: sub_id },
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
