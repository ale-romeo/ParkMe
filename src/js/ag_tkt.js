$(document).on("click", "#btn-ans-tkt-modal", function () {
    // Ottieni il posto selezionato
    var tkt_id = $("#tkt-modal-title").text().replace("Ticket: ", "");

    var answer = $('#modal_ans_tkt').val();

    $.ajax({
        type: "POST",
        url: "../../db/upload/edit_tkt.php",
        data: { tkt_id: tkt_id, answer: answer },
        success: function (r) {
            alert(r);
            tkt_log(tkt_id);
            // Chiudi il modal e aggiorna la tabella degli abbonamenti
            $("#tkt-modal").modal("hide");
            show_tkts();
        },
        error: function () {
            alert('Si è verificato un errore durante la modifica dell\' abbonamento.');
        }
    });
});

$(document).on("click", ".mostra-testo", function () {
    // Ottieni il posto selezionato
    var tkt_id = $(this).closest("tr").find("td:first-child").text();

    $.ajax({
        url: "../../db/get/get_tkt_det.php",
        type: "POST",
        data: { tkt_id: tkt_id },
        dataType: 'json',
        success: function (data) {
            var modalContent = '';
                modalContent += '<div class="modal-header">';
                modalContent += '<h5 class="modal-title" id="tkt-modal-title">Ticket: ' + tkt_id + '</h5>';
                modalContent += '<button type="button" class="close" data-dismiss="modal">';
                modalContent += '<span>&times;</span>';
                modalContent += '</button>';
                modalContent += '</div>';
                modalContent += '<div class="modal-body">';
                modalContent += '<form>';
                modalContent += '<div class="form-group">';
                modalContent += '<label for="title_tkt">Titolo:</label><br>';
                modalContent += '<input type="text" name="title_tkt" id="modal_title_tkt" readonly><br>';
                modalContent += '<label for="text_tkt">Testo:</label><br>';
                modalContent += '<textarea name="text_tkt" id="modal_text_tkt" readonly></textarea><br>';
                modalContent += '<label for="ans_tkt">Risposta:</label><br>';
                modalContent += '<textarea name="ans_tkt" id="modal_ans_tkt" required></textarea><br>';
                modalContent += '</div>';
                modalContent += '</form>';
                modalContent += '</div>';
                modalContent += '<div class="modal-footer">';
                modalContent += '<button type="button" class="btn btn-primary" id="btn-ans-tkt-modal">Modifica</button>';
                modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
                modalContent += '</div>';
                
            $('#tkt-modal .modal-content').html(modalContent);
            $('#modal_title_tkt').val(data[0]);
            $('#modal_text_tkt').val(data[1]);
            $('#modal_ans_tkt').val(data[2]);
            $('#tkt-modal').modal('show');
        },
        error: function () {
            alert("Errore nel caricamento dei dettagli del ticket.");
        }

    });
});

function show_tkts() {
    $.ajax({
        url: "../../db/get/get_tkts.php",
        type: "POST",
        success: function (data) {
            $("#tabella-tickets").html(data);

            $("#table-wrapper").show();

            $("#table-wrapper").scrollTop(0);
        },
        error: function () {
            alert('Si è verificato un errore durante la visualizzazione dei logs.');
        }
    });
}

$(document).ready(function () {
    show_tkts();
});

function tkt_log(tkt_id) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'tkt', tkt_id: tkt_id },
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