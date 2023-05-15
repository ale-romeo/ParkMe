$(document).on("click", "#btn-send", function () {

    var title = $('#modal_title_tkt').val();
    var text = $("#modal_text_tkt").val();
    var agent = $("#agent_tkt option:selected").val();

    $.ajax({
        type: "POST",
        url: "db/upload/new_tkt.php",
        data: { title: title, text: text, agent: agent },
        success: function () {
            alert('Ticket inviato');
            // Chiudi il modal e aggiorna la tabella degli abbonamenti
            $("#tkt-modal").modal("hide");
            show_tkts();
        },
        error: function () {
            alert('Si è verificato un errore durante la modifica dell\' abbonamento.');
        }
    });
});


$(document).ready(function () {
    $(document).on("click", "#btn-tkt", function (e) {
        e.preventDefault();
        $.ajax({
            url: 'db/get/get_agents.php',
            dataType: 'json',
            success: function (operatori) {
                var modalContent = '';
                modalContent += '<div class="modal-header">';
                modalContent += '<h5 class="modal-title" id="tkt-modal-title">Nuovo ticket</h5>';
                modalContent += '<button type="button" class="close" data-dismiss="modal">';
                modalContent += '<span>&times;</span>';
                modalContent += '</button>';
                modalContent += '</div>';
                modalContent += '<div class="modal-body">';
                modalContent += '<form>';
                modalContent += '<div class="form-group">';
                modalContent += '<label for="title_tkt">Titolo:</label><br>';
                modalContent += '<input type="text" name="title_tkt" id="modal_title_tkt" required><br>';
                modalContent += '<label for="text_tkt">Testo:</label><br>';
                modalContent += '<textarea name="text_tkt" id="modal_text_tkt" required></textarea><br>';
                modalContent += '<label for="agent_tkt">Operatore:</label><br>';
                modalContent += '<select name="agent_tkt" id="agent_tkt" required>';
                $.each(operatori, function (index, operatore) {
                    modalContent += '<option value="' + operatore + '">' + operatore + '</option>';
                });
                modalContent += '</select><br>';
                modalContent += '</div>';
                modalContent += '</form>';
                modalContent += '</div>';
                modalContent += '<div class="modal-footer">';
                modalContent += '<button type="button" class="btn btn-primary" id="btn-send">Invia</button>';
                modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
                modalContent += '</div>';

                $('#new-tkt-modal .modal-content').html(modalContent);
                $('#new-tkt-modal').modal('show');
            },
            error: function () {
                alert('Si è verificato un errore durante il recupero degli operatori.');
            }
        });

    });
});

$(document).on("click", ".mostra-testo", function () {
    // Ottieni il posto selezionato
    var tkt_id = $(this).closest("tr").find("td:first-child").text();

    $.ajax({
        url: "db/get/get_tkt_det.php",
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
            modalContent += '<textarea name="ans_tkt" id="modal_ans_tkt" readonly></textarea><br>';
            modalContent += '</div>';
            modalContent += '</form>';
            modalContent += '</div>';
            modalContent += '<div class="modal-footer">';
            modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
            modalContent += '</div>';

            $('#tkt-modal .modal-content').html(modalContent);
            $('#modal_title_tkt').val(data[0]);
            $('#modal_text_tkt').val(data[1]);
            $('#tkt-modal').modal('show');
        },
        error: function () {
            alert("Errore nel caricamento dei dettagli del ticket.");
        }

    });
});

function show_tkts() {
    $.ajax({
        url: "db/get/get_tkts_end.php",
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

function logout() {
    var confirmLogout = confirm("Sei sicuro di voler effettuare il logout?");
    if (confirmLogout) {
        window.location.href = "logout.php";
    }
}
