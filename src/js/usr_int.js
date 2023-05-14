$(document).on("click", "#btn-pay", function () {
    // Ottieni il posto selezionato
    var posto = $("#get-posto").text().replace("Stai per iniziare la sosta nel posto ", "");
    var tar = $("#tar_sel option:selected").val();
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
    var zona = posto.charAt(0);
    var durata = parseInt(minuti) + (parseInt(ore) * 60) + (parseInt(giorni) * 1440);

    if (durata < 5) {
        alert('Inserisci una durata valida');
        return;
    } else if (durata >= 5) {
        // Esegui una richiesta AJAX per aggiornare il record del posto nel database
        $.ajax({
            type: "POST",
            url: "db/upload/parking.php",
            data: { posto: posto, tar: tar, durata: durata },
            success: function () {
                alert('Pagamento effettato con successo!');
                // Chiudi il modal e aggiorna la tabella dei posti
                $("#parknow").modal("hide");
                update_parks();
                show_parks(zona);
            },
            error: function () {
                alert('Si è verificato un errore durante l\'assegnazione del posto.');
            }
        });
    }
});

$(document).ready(function () {
    $(document).on("click", "#park_now_btn", function (e) {
        e.preventDefault();

        if ($("#park_slot_sel option:selected").val() == undefined) {
            alert('Seleziona un parcheggio valido');
        } else if ($("#park_slot_sel option:selected").text().slice(-1) == 'O') {
            alert('Questo parcheggio è già occupato');
        } else if ($("#park_slot_sel option:selected").val() != "") {
            // Ottieni il posto selezionato
            var posto = $("#park_slot_sel option:selected").val();

            var modalContent = '';
            modalContent += '<div class="modal-header">';
            modalContent += '<h5 class="modal-title" id="get-posto">Stai per iniziare la sosta nel posto ' + posto + '</h5>';
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
            modalContent += '<input type="number" name="time" id="durata_dd" placeholder="g" min="1" step="1">';
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

function show_parks(zona) {
    $.ajax({
        url: "db/get/get_slots.php",
        type: "GET",
        data: { zona: zona },
        success: function (data) {
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
        error: function () {
            alert('Errore durante l\'aggiornamento dei posti.');
        }
    });
}

$(document).ready(function () {
    $.ajax({
        url: "db/get/get_park.php",
        success: function (r) {
            alert(r);
            if (r != '"free"') {
                var modalContent = '';
                    modalContent += '<div class="park-box-inner">';
                    modalContent += '<span class="wtd" id="up-text" style="font-weight: 400;">Ciao';
                    modalContent += '<strong style="color: #376ba7;"><?php echo $username ?></strong>,';
                    modalContent += '<br>Attualmente stai sostando nel posto ' + r.id + '</span>';
                    modalContent += '<form id="parked-form">';
                    modalContent += '<div class="row form-parked-group">';
                    modalContent += '<div class="col-md-6">';
                    modalContent += '<label for="rem_time">Tempo rimanente:</label>';
                    modalContent += '</div>';
                    modalContent += '<div class="col-md-6">';
                    modalContent += '<input type="number" name="rem_time" id="durata_dd" placeholder="g" min="1" step="1">';
                    modalContent += '<input type="number" name="rem_time" id="durata_hh" placeholder="o" min="1" max="23" step="1">';
                    modalContent += '<input type="number" name="rem_time" id="durata_min" placeholder="m" min="1" max="59" step="1"><br>';
                    modalContent += '</div>';
                    modalContent += '<div class="col-md-12 btn-cont">';
                    modalContent += '<button type="button" class="btn btn-primary" id="btn-aggiorna-sosta" style="margin-right: 5px;">Aggiorna</button>';
                    modalContent += '<button type="button" class="btn btn-secondary" id="btn-termina-sosta">Termina sosta</button>';
                    modalContent += '</div>';
                    modalContent += '</form>';
                    modalContent += '</div>';

                // Inserisce il contenuto nel modal e mostra il modal
                
                $('.park-box-inner').html(modalContent);
                $("#durata_min").val(r[3]);
                $("#durata_hh").val(r[2]);
                $("#durata_dd").val(r[1]);
            }
        },
        error: function () {
            alert('Errore durante il caricamento dell\'istanza di parcheggio');
        }
    });
});

$(document).ready(function () {
    update_parks();
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