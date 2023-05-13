function show_parks(zona) {
    // Invia una richiesta AJAX per ottenere i parcheggi della zona dal database
    $.ajax({
        url: "../../db/get/get_slots.php",
        type: "GET",
        data: {
            zona: zona
        },
        success: function (data) {
            // Aggiungi le righe della tabella con i dati dei parcheggi ottenuti dal database
            $("#tabella-parcheggi").html(data);

            // Visualizza la tabella
            $("#table-wrapper").show();

            //Scrolla all'inizio della tabella
            $("#table-wrapper").scrollTop(0);

            //Nascondi testo form
            $("#up-text").text('Zona: '+ zona);
            $("#up-text").css("font-weight", "600");
        },
        error: function () {
            alert('Si è verificato un errore durante la visualizzazione dei posti.');
        }
    });
}

function view_log(zona) {
    $.ajax({
        url: "../../db/upload/add_log.php",
        type: 'POST',
        data: { action: 'view', zona: zona },
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

function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 17,
        center: { lat: 38.185230466362576, lng: 15.554387438776148 },
    });
    // Define the LatLng coordinates for the polygon's path.
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
        strokeOpacity: 0.7,
        strokeWeight: 2,
        fillColor: "#808080",
        fillOpacity: 0.35,
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
        strokeOpacity: 0.7,
        strokeWeight: 2,
        fillColor: "#B0C4DE",
        fillOpacity: 0.35,
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
        strokeOpacity: 0.7,
        strokeWeight: 2,
        fillColor: "#D8BFD8",
        fillOpacity: 0.35,
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
        strokeOpacity: 0.7,
        strokeWeight: 2,
        fillColor: "#D5FFD5",
        fillOpacity: 0.35,
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
        strokeOpacity: 0.7,
        strokeWeight: 2,
        fillColor: "#F0E68C",
        fillOpacity: 0.35,
    });

    zoneA.setMap(map);
    zoneB.setMap(map);
    zoneC.setMap(map);
    zoneD.setMap(map);
    zoneE.setMap(map);

    // Aggiungi listener per zona A
    google.maps.event.addListener(zoneA, 'click', function () {
        var sel_zone = 'A';

        show_parks(sel_zone);
        view_log(sel_zone);
    });

    // Aggiungi listener per zona B
    google.maps.event.addListener(zoneB, 'click', function () {
        var sel_zone = 'B';

        show_parks(sel_zone);
        view_log(sel_zone);
    });

    // Aggiungi listener per zona C
    google.maps.event.addListener(zoneC, 'click', function () {
        var sel_zone = 'C';

        show_parks(sel_zone);
        view_log(sel_zone);
    });

    // Aggiungi listener per zona D
    google.maps.event.addListener(zoneD, 'click', function () {
        var sel_zone = 'D';

        show_parks(sel_zone);
        view_log(sel_zone);
    });

    // Aggiungi listener per zona E
    google.maps.event.addListener(zoneE, 'click', function () {
        var sel_zone = 'E';

        show_parks(sel_zone);
        view_log(sel_zone);
    });

}

window.initMap = initMap;
