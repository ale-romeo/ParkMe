$(document).on("click", "#btn-termina-prenotazione", function () {
    // Ottieni il posto selezionato
    var posto = $("#get-slot-strong").text();

    $.ajax({
        type: "POST",
        url: "db/upload/end_res.php",
        data: { posto: posto },
        success: function () {
            alert('Hai rinunciato alla prenotazione');
            update_parks();
            show_parks(posto.charAt(0));
        },
        error: function () {
            alert('Si è verificato un errore durante l\'assegnazione del posto.');
        }
    });
});

$(document).ready(function () {
    $(document).on("click", "#btn-inizia-sosta", function (e) {
        e.preventDefault();
        // Ottieni il posto selezionato
        var posto = $("#get-slot-strong").text();

        var modalContent = '';
        modalContent += '<div class="modal-header">';
        modalContent += '<h5 class="modal-title" id="get-posto-modal">Stai per iniziare la sosta nel posto ' + posto + '</h5>';
        modalContent += '<button type="button" class="close" data-dismiss="modal">';
        modalContent += '<span>&times;</span>';
        modalContent += '</button>';
        modalContent += '</div>';
        modalContent += '<div class="modal-body">';
        modalContent += '<form>';
        modalContent += '<div class="form-group">';
        modalContent += '<label for="sel_tar">Seleziona tariffa:</label><br>';
        modalContent += '<select name="sel_tar" id="tar_sel">';
        modalContent += '<option value="tar_or">Tariffa oraria</option>';
        modalContent += '<option value="tar_per">Tariffa periodica</option>';
        modalContent += '</select><br>';
        modalContent += '<label for="time">Durata della sosta(min. 5 minuti):</label><br>';
        modalContent += '<input type="number" name="time" id="durata_dd" min="1" placeholder="g" step="1">';
        modalContent += '<input type="number" name="time" id="durata_hh" placeholder="o" min="1" max="23" step="1">';
        modalContent += '<input type="number" name="time" id="durata_min" placeholder="m" min="1" max="59" step="1"><br>';
        modalContent += '</div>';
        modalContent += '</form>';
        modalContent += '</div>';
        modalContent += '<div class="modal-footer">';
        modalContent += '<button type="button" class="btn btn-primary" id="btn-pay">Paga</button>';
        modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
        modalContent += '</div>';

        // Inserisce il contenuto nel modal e mostra il modal
        $('#parknow .modal-content').html(modalContent);
        $('#parknow').modal('show');
    });
});

$(document).on("click", "#btn-aggiorna-sosta", function () {
    // Ottieni il posto selezionato
    var posto = $("#get-slot-strong").text();
    var minuti = $("#durata_min").val();
    var ore = $("#durata_hh").val();
    var zona = posto.charAt(0);

    $.ajax({
        type: "POST",
        url: "db/upload/end_park.php",
        data: { posto: posto, ii: minuti, hh: ore },
        success: function (r) {
            if (r == 'invalid') {
                alert('Non si può tornare indietro nel tempo, non ancora!');
                update_parks();
                ck_park();
            }
            else if (r == 'end') {
                alert('Sosta terminata');
                update_parks();
                show_parks(zona);
            } else if (r == 'valid') {
                alert('Sosta aggiornata');
                update_parks();
                ck_park();

            }

        },
        error: function () {
            alert('Si è verificato un errore durante l\'assegnazione del posto.');
        }
    });
});

$(document).on("click", "#btn-termina-sosta", function () {
    // Ottieni il posto selezionato
    var posto = $("#get-slot-strong").text();

    $.ajax({
        type: "POST",
        url: "db/upload/end_park.php",
        data: { posto: posto },
        success: function (r) {
            if (r == 'end') {
                alert('Sosta terminata');
                update_parks();
                show_parks(posto.charAt(0));
            }
        },
        error: function () {
            alert('Si è verificato un errore durante l\'assegnazione del posto.');
        }
    });
});

$(document).on("click", "#btn-pay", function () {
    // Ottieni il posto selezionato
    var posto = $("#get-posto-modal").text().replace("Stai per iniziare la sosta nel posto ", "");
    var tar = $("#tar_sel option:selected").val();
    var targa = $("#plate").val();

    var minuti = $("#durata_min").val();
    if (minuti == "") {
        minuti = 0;
    }
    var ore = $("#durata_hh").val();
    if (ore == "") {
        ore = 0;
    }
    var giorni = $("#durata_dd").val();
    if (giorni == "") {
        giorni = 0;
    }
    var durata = parseInt(minuti) + (parseInt(ore) * 60) + (parseInt(giorni) * 1440);
    var zona = posto.charAt(0);

    if (durata < 5) {
        alert('Inserisci una durata valida');
        return;
    } else if (durata >= 5) {
        // Esegui una richiesta AJAX per aggiornare il record del posto nel database
        $.ajax({
            type: "POST",
            url: "db/upload/parking.php",
            data: { posto: posto, tar: tar, durata: durata, targa: targa },
            success: function (r) {
                alert('Pagamento effettato con successo!' + r);
                // Chiudi il modal e aggiorna la tabella dei posti
                $("#parknow").modal("hide");
                show_parks(zona);
                update_parks();
                ck_park();
            },
            error: function () {
                alert('Si è verificato un errore durante l\'assegnazione del posto.');
            }
        });
    }
});

$(document).on("click", "#btn-pay_res", function () {
    // Ottieni il posto selezionato
    var posto = $("#get-posto-modal-res").text().replace("Prenotazione posto: ", "");
    var zona = posto.charAt(0);

    $.ajax({
        type: "POST",
        url: "db/upload/booking.php",
        data: { posto: posto },
        success: function (r) {
            alert('Prenotazione effettata con successo!' + r);
            $("#reservation").modal("hide");
            show_parks(zona);
            update_parks();
            ck_park();
        },
        error: function () {
            alert('Si è verificato un errore durante l\'assegnazione del posto.');
        }
    });
});

$(document).ready(function () {
    $(document).on("click", "#park_now_btn", function (e) {
        e.preventDefault();
        update_parks();
        ck_park();

        if ($("#park_slot_sel option:selected").val() == undefined || $("#park_slot_sel option:selected").text().slice(-1) == 'e') {
            alert('Seleziona un parcheggio valido');
        } else if ($("#park_slot_sel option:selected").text().slice(-1) == 'O') {
            alert('Questo parcheggio è già occupato');
        } else if ($("#park_slot_sel option:selected").text().slice(-1) == 'R') {
            alert('Questo parcheggio è prenotato');
        } else if ($("#park_slot_sel option:selected").val() != "" && stat == 1) {
            // Ottieni il posto selezionato
            var posto = $("#park_slot_sel option:selected").val();

            var modalContent = '';
            modalContent += '<div class="modal-header">';
            modalContent += '<h5 class="modal-title" id="get-posto-modal">Stai per iniziare la sosta nel posto ' + posto + '</h5>';
            modalContent += '<button type="button" class="close" data-dismiss="modal">';
            modalContent += '<span>&times;</span>';
            modalContent += '</button>';
            modalContent += '</div>';
            modalContent += '<div class="modal-body">';
            modalContent += '<form>';
            modalContent += '<div class="form-group">';
            modalContent += '<label for="sel_tar">Seleziona tariffa:</label><br>';
            modalContent += '<select name="sel_tar" id="tar_sel">';
            modalContent += '<option value="tar_or">Tariffa oraria</option>';
            modalContent += '<option value="tar_per">Tariffa periodica</option>';
            modalContent += '</select><br>';
            modalContent += '<label for="time">Durata della sosta(min. 5 minuti):</label><br>';
            modalContent += '<input type="number" name="time" id="durata_dd" min="1" placeholder="g" step="1">';
            modalContent += '<input type="number" name="time" id="durata_hh" placeholder="o" min="1" max="23" step="1">';
            modalContent += '<input type="number" name="time" id="durata_min" placeholder="m" min="1" max="59" step="1"><br>';
            modalContent += '<label for="plate">Targa:</label><br>';
            modalContent += '<input type="text" name="plate" id="plate" placeholder="Targa" required><br>';
            modalContent += '</div>';
            modalContent += '</form>';
            modalContent += '</div>';
            modalContent += '<div class="modal-footer">';
            modalContent += '<button type="button" class="btn btn-primary" id="btn-pay">Paga</button>';
            modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
            modalContent += '</div>';

            // Inserisce il contenuto nel modal e mostra il modal
            $('#parknow .modal-content').html(modalContent);
            $('#parknow').modal('show');
        }
    });
});

$(document).ready(function () {
    $(document).on("click", "#reserve_btn", function (e) {
        e.preventDefault();
        update_parks();
        ck_park();

        if ($("#park_slot_sel option:selected").val() == undefined || $("#park_slot_sel option:selected").text().slice(-1) == 'e') {
            alert('Seleziona un parcheggio valido');
        } else if ($("#park_slot_sel option:selected").text().slice(-1) == 'O') {
            alert('Questo parcheggio è già occupato');
        } else if ($("#park_slot_sel option:selected").text().slice(-1) == 'R') {
            alert('Questo parcheggio è prenotato');
        } else if ($("#park_slot_sel option:selected").val() != "" && stat == 1) {
            // Ottieni il posto selezionato
            var posto = $("#park_slot_sel option:selected").val();

            var modalContent = '';
            modalContent += '<div class="modal-header">';
            modalContent += '<h5 class="modal-title" id="get-posto-modal-res">Prenotazione posto: ' + posto + '</h5>';
            modalContent += '<button type="button" class="close" data-dismiss="modal">';
            modalContent += '<span>&times;</span>';
            modalContent += '</button>';
            modalContent += '</div>';
            modalContent += '<div class="modal-body">';
            modalContent += '<span>Il posto sarà riservato per 10 minuti dal momento del pagamento</span>';
            modalContent += '</div>';
            modalContent += '<div class="modal-footer">';
            modalContent += '<button type="button" class="btn btn-primary" id="btn-pay_res">Paga</button>';
            modalContent += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>';
            modalContent += '</div>';

            // Inserisce il contenuto nel modal e mostra il modal
            $('#reservation .modal-content').html(modalContent);
            $("#res_date").attr("min", new Date().toISOString().slice(0, 16));
            $('#reservation').modal('show');
        }
    });
});

$(document).ready(function () {
    $("#zona_input").blur(function () {
        var zona = $(this).val();

        $.ajax({
            url: "db/get/get_slots.php",
            type: "GET",
            data: { zona: zona },
            success: function (data) {
                $("#park_slot_sel").html(data);
            },
            error: function () {
                alert('Errore durante il caricamento dei posti.');
            }
        });
    });
});

var usr;

$(document).ready(function () {
    $.ajax({
        url: "db/get/get_username.php",
        success: function (r) {
            usr = r;
        },
        error: function () {
            alert('Impossibile recuperare nome utente.');
        }
    });
});

function show_parks(zona) {
    $.ajax({
        url: "db/get/get_slots.php",
        type: "GET",
        data: { zona: zona },
        success: function (data) {
            var modalContent = '';
            modalContent += '<div class="park-box-inner">';
            modalContent += '<span class="wtd" id="up-text" style="font-weight: 400;">Ciao ';
            modalContent += '<strong style="color: #376ba7;">' + usr + '</strong>,<br>Clicca sulla mappa per visualizzare i posti auto vicini...</span>';
            modalContent += '<form id="park-form">';
            modalContent += '<div class="row form-group">';
            modalContent += '<div class="col-md-6">';
            modalContent += '<label for="ins-zona">O inserisci la zona:</label>';
            modalContent += '</div>';
            modalContent += '<div class="col-md-6">';
            modalContent += '<input type="text" id="zona_input" name="ins-zona">';
            modalContent += '</div>';
            modalContent += '<div class="col-md-6">';
            modalContent += '<label for="park_slot">Scegli il posto:</label>';
            modalContent += '</div>';
            modalContent += '<div class="col-md-6">';
            modalContent += '<select name="park_slot" id="park_slot_sel"></select>';
            modalContent += '</div>';
            modalContent += '<div class="col-md-6">';
            modalContent += '<div class="btn-cont">';
            modalContent += '<button class="btn btn-primary" id="reserve_btn" data-toggle="modal">Prenota</button>';
            modalContent += '</div>';
            modalContent += '</div>';
            modalContent += '<div class="col-md-6">';
            modalContent += '<div class="btn-cont">';
            modalContent += '<button class="btn btn-primary" id="park_now_btn" data-toggle="modal">Parcheggia</button>';
            modalContent += '</div>';
            modalContent += '</div>';
            modalContent += '</div>';
            modalContent += '</form>';
            modalContent += '</div>';

            $(".park-box-inner").html(modalContent);
            $("#park_slot_sel").html(data);
            $("#zona_input").val(zona);
        },
        error: function () {
            alert('Errore durante il caricamento dei posti.');
        }
    });
}

function update_parks() {
    $.ajax({
        url: "db/update/update_park.php",
        success: function () {
        },
        error: function () {
            alert('Errore durante l\'aggiornamento dei posti.');
        }
    });
}

function startTimer(minutes, seconds, posto) {
    var countdownTimer = setInterval(function () {
        seconds--;
        if (seconds < 0) {
            seconds = 59;
            minutes--;
        }
        $("#timer").html(minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0'));

        if (minutes === 0 && seconds === 0) {
            clearInterval(countdownTimer);
            show_parks(posto.charAt(0));
        }
    }, 1000);
}

var stat;

function ck_park() {
    $.ajax({
        url: "db/get/get_park.php",
        dataType: 'json',
        success: function (r) {
            if (r[0] == 'reserved') {
                var modalContent = '';
                modalContent += '<div class="park-box-inner">';
                modalContent += '<span class="wtd" id="up-text" style="font-weight: 400;">Ciao ';
                modalContent += '<strong style="color: #376ba7;">' + usr + '</strong>,';
                modalContent += '<br>La tua prenotazione per il posto <strong id="get-slot-strong" style="color: #376ba7;">' + r[1] + '</strong><br>';
                modalContent += 'La prenotazione scade tra:</span>';
                modalContent += '<div id="timer"></div>';
                modalContent += '<div class="btn-cont">';
                modalContent += '<button type="button" class="btn btn-primary" id="btn-inizia-sosta" style="margin-right: 5px;">Parcheggia</button>';
                modalContent += '<button type="button" class="btn btn-secondary" id="btn-termina-prenotazione">Rinuncia</button>';
                modalContent += '</div>';
                modalContent += '</div>';

                // Inserisce il contenuto nel modal e mostra il modal
                startTimer(r[2], r[3], r[1]);
                $('.park-box-inner').html(modalContent);

                stat = 0;
            } else if (r[0] == 'occupied') {
                var modalContent = '';
                modalContent += '<div class="park-box-inner">';
                modalContent += '<span class="wtd" id="up-text" style="font-weight: 400;">Ciao ';
                modalContent += '<strong style="color: #376ba7;">' + usr + '</strong>,';
                modalContent += '<br>Attualmente stai sostando nel posto <strong id="get-slot-strong" style="color: #376ba7;">' + r[1] + '</strong></span>';
                modalContent += '<form id="parked-form">';
                modalContent += '<div class="row form-parked-group">';
                modalContent += '<div class="col-md-6">';
                modalContent += '<label for="time">La sosta scade alle:</label>';
                modalContent += '</div>';
                modalContent += '<div class="col-md-3">';
                modalContent += '<input type="number" name="time" id="durata_hh" placeholder="o" min="1" max="23" step="1">';
                modalContent += '</div>';
                modalContent += '<div class="col-md-3">';
                modalContent += '<input type="number" name="time" id="durata_min" placeholder="m" min="1" max="59" step="1"><br>';
                modalContent += '</div>';
                modalContent += '<div class="col-md-3">';
                modalContent += '<label for="time">Del:</label>';
                modalContent += '</div>';
                modalContent += '<div class="col-md-3">';
                modalContent += '<input type="number" name="time" id="durata_dd" min="1" step="1" readonly><br>';
                modalContent += '</div>';
                modalContent += '<div class="col-md-12 btn-cont">';
                modalContent += '<button type="button" class="btn btn-primary" id="btn-aggiorna-sosta" style="margin-right: 5px;">Aggiorna</button>';
                modalContent += '<button type="button" class="btn btn-secondary" id="btn-termina-sosta">Termina sosta</button>';
                modalContent += '</div>';
                modalContent += '</form>';
                modalContent += '</div>';

                // Inserisce il contenuto nel modal e mostra il modal

                $('.park-box-inner').html(modalContent);
                $("#durata_min").val(r[2]);
                $("#durata_hh").val(r[3]);
                $("#durata_dd").val(r[4]);
                stat = 0;
            } else {
                stat = 1;
            }
        },
        error: function () {
            alert('Errore durante il caricamento dell\'istanza di parcheggio');
        }
    });
}

$(document).ready(function () {
    update_parks();
    ck_park();
});

function logout() {
    var confirmLogout = confirm("Sei sicuro di voler effettuare il logout?");
    if (confirmLogout) {
        window.location.href = "logout.php";
    }
}

function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 16,
        center: { lat: 38.185230466362576, lng: 15.554387438776148 },
    });

    const macroareaCoords = [
        { lat: 38.18095478972737, lng: 15.547917950907431 },
        { lat: 38.18398209300131, lng: 15.550084676431693 },
        { lat: 38.19416646136503, lng: 15.552573026440045 },
        { lat: 38.197791466543315, lng: 15.55442411570764 },
        { lat: 38.19720718514786, lng: 15.557322133007126 },
        { lat: 38.19002314116971, lng: 15.55651473015213 },
        { lat: 38.18744275511689, lng: 15.562265385888788 },
        { lat: 38.18636335082837, lng: 15.561449994403738 },
        { lat: 38.18634648500947, lng: 15.561535825086375 },
        { lat: 38.186768129310934, lng: 15.560806264283963 },
        { lat: 38.17811549932769, lng: 15.552909841217136 },
        { lat: 38.18095478972737, lng: 15.547917950907431 }
    ];

    const parkingarea = new google.maps.Polygon({
        paths: macroareaCoords,
        strokeColor: "#5469d4",
        strokeOpacity: 0.7,
        strokeWeight: 2,
        fillColor: "#5469d4",
        fillOpacity: 0.35,
    });

    const zoneACoords = [
        { lat: 38.18095478972737, lng: 15.547917950907431 },
        { lat: 38.18486299553761, lng: 15.550894057420141 },
        { lat: 38.181943883914, lng: 15.5562849382449 },
        { lat: 38.17811549932769, lng: 15.552909841217136 },
        { lat: 38.18095478972737, lng: 15.547917950907431 }
    ]

    const zoneA = new google.maps.Polygon({
        paths: zoneACoords,
        strokeColor: "#808080",
        strokeOpacity: 0,
        strokeWeight: 2,
        fillColor: "#808080",
        fillOpacity: 0,
    });

    const zoneBCoords = [
        { lat: 38.18486299553761, lng: 15.550894057420141 },
        { lat: 38.187373208837926, lng: 15.552896605247433 },
        { lat: 38.184364645951284, lng: 15.558491342463656 },
        { lat: 38.181943883914, lng: 15.5562849382449 },
        { lat: 38.18486299553761, lng: 15.550894057420141 }
    ]

    const zoneB = new google.maps.Polygon({
        paths: zoneBCoords,
        strokeColor: "#B0C4DE",
        strokeOpacity: 0,
        strokeWeight: 2,
        fillColor: "#B0C4DE",
        fillOpacity: 0,
    });

    const zoneCCoords = [
        { lat: 38.187373208837926, lng: 15.552896605247433 },
        { lat: 38.190350000603054, lng: 15.555192511912566 },
        { lat: 38.18747147130265, lng: 15.562278693218577 },
        { lat: 38.1863295715727, lng: 15.561432806065488 },
        { lat: 38.18676486704263, lng: 15.560784166118522 },
        { lat: 38.184364645951284, lng: 15.558491342463656 },
        { lat: 38.187373208837926, lng: 15.552896605247433 }
    ]

    const zoneC = new google.maps.Polygon({
        paths: zoneCCoords,
        strokeColor: "#D8BFD8",
        strokeOpacity: 0,
        strokeWeight: 2,
        fillColor: "#D8BFD8",
        fillOpacity: 0,
    });

    const zoneDCoords = [
        { lat: 38.18398209300131, lng: 15.550084676431693 },
        { lat: 38.190350000603054, lng: 15.555192511912566 },
        { lat: 38.19196730292117, lng: 15.552027007138093 },
        { lat: 38.18398209300131, lng: 15.550084676431693 }
    ]

    const zoneD = new google.maps.Polygon({
        paths: zoneDCoords,
        strokeColor: "#D5FFD5",
        strokeOpacity: 0,
        strokeWeight: 2,
        fillColor: "#D5FFD5",
        fillOpacity: 0,
    });

    const zoneECoords = [
        { lat: 38.19196730292117, lng: 15.552027007138093 },
        { lat: 38.19416646136503, lng: 15.552573026440045 },
        { lat: 38.197791466543315, lng: 15.55442411570764 },
        { lat: 38.19720718514786, lng: 15.557322133007126 },
        { lat: 38.18980619198771, lng: 15.556559135120647 },
        { lat: 38.190350000603054, lng: 15.555192511912566 },
        { lat: 38.19196730292117, lng: 15.552027007138093 }
    ]

    const zoneE = new google.maps.Polygon({
        paths: zoneECoords,
        strokeColor: "#F0E68C",
        strokeOpacity: 0,
        strokeWeight: 2,
        fillColor: "#F0E68C",
        fillOpacity: 0,
    });

    zoneA.setMap(map);
    zoneB.setMap(map);
    zoneC.setMap(map);
    zoneD.setMap(map);
    zoneE.setMap(map);
    parkingarea.setMap(map);

    // Aggiungi listener per zona A
    google.maps.event.addListener(zoneA, 'click', function () {
        var sel_zone = 'A';

        show_parks(sel_zone);
    });

    // Aggiungi listener per zona B
    google.maps.event.addListener(zoneB, 'click', function () {
        var sel_zone = 'B';

        show_parks(sel_zone);
    });

    // Aggiungi listener per zona C
    google.maps.event.addListener(zoneC, 'click', function () {
        var sel_zone = 'C';

        show_parks(sel_zone);
    });

    // Aggiungi listener per zona D
    google.maps.event.addListener(zoneD, 'click', function () {
        var sel_zone = 'D';

        show_parks(sel_zone);
    });

    // Aggiungi listener per zona E
    google.maps.event.addListener(zoneE, 'click', function () {
        var sel_zone = 'E';

        show_parks(sel_zone);
    });

}

window.initMap = initMap;