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
    google.maps.event.addListener(zoneA, 'click', function (event) {
        var sel_zone = 'A';
        $.get("../db/rec_parks.php", { zona: sel_zone }, function (data) {
            // Visualizza la tabella dei parcheggi nella formbg
            $("#form-container").html(data);
        });
    });

    // Aggiungi listener per zona B
    google.maps.event.addListener(zoneB, 'click', function (event) {
        var sel_zone = 'B';
        $.get("../db/rec_parks.php", { zona: sel_zone }, function (data) {
            // Visualizza la tabella dei parcheggi nella formbg
            $("#form-container").html(data);
        });
    });

    // Aggiungi listener per zona C
    google.maps.event.addListener(zoneC, 'click', function (event) {
        var sel_zone = 'C';
        $.get("../db/rec_parks.php", { zona: sel_zone }, function (data) {
            // Visualizza la tabella dei parcheggi nella formbg
            $("#form-container").html(data);
        });
    });

    // Aggiungi listener per zona D
    google.maps.event.addListener(zoneD, 'click', function (event) {
        var sel_zone = 'D';
        $.get("../db/rec_parks.php", { zona: sel_zone }, function (data) {
            // Visualizza la tabella dei parcheggi nella formbg
            $("#form-container").html(data);
        });
    });

    // Aggiungi listener per zona E
    google.maps.event.addListener(zoneE, 'click', function (event) {
        var sel_zone = 'E';
        $.get("../db/rec_parks.php", { zona: sel_zone }, function (data) {
            // Visualizza la tabella dei parcheggi nella formbg
            $("#form-container").html(data);
        });
    });

}

window.initMap = initMap;
