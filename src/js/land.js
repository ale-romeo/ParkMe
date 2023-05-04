$(document).ready(function() {
  $(".reveal").on('click', function () {
    var pwdField = $("#pass");
    var pwdFieldType = pwdField.attr('type');
    if (pwdFieldType === 'password') {
      pwdField.attr('type', 'text');
      $(this).html('<i class="fa fa-eye-slash"></i>');
    } else {
      pwdField.attr('type', 'password');
      $(this).html('<i class="fa fa-eye"></i>');
    }
  });
});

$(document).ready(function() {
  $(".reveal1").on('click', function () {
    var pwdField = $("#pass1");
    var pwdFieldType = pwdField.attr('type');
    if (pwdFieldType === 'password') {
      pwdField.attr('type', 'text');
      $(this).html('<i class="fa fa-eye-slash"></i>');
    } else {
      pwdField.attr('type', 'password');
      $(this).html('<i class="fa fa-eye"></i>');
    }
  });
});

function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 17,
    center: { lat: 38.185230466362576, lng: 15.554387438776148 },
  });
  // Define the LatLng coordinates for the polygon's path.
  const polygonCoords = [
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
  // Construct the polygon.
  const parkingarea = new google.maps.Polygon({
    paths: polygonCoords,
    strokeColor: "#5469d4",
    strokeOpacity: 0.7,
    strokeWeight: 2,
    fillColor: "#5469d4",
    fillOpacity: 0.35,
  });

  parkingarea.setMap(map);

  const input = document.getElementById("address-input");
  const autocomplete = new google.maps.places.Autocomplete(input, {
    componentRestrictions: { country: ["it"] },
    types: ["address"],
    strictBounds: true
  });
  autocomplete.addListener('place_changed', function () {
    var place = autocomplete.getPlace();
    if (place.geometry && place.geometry.location) {
      map.setCenter(place.geometry.location);
      map.setZoom(17); // Imposta lo zoom della mappa a 16
    }
  });

  const geocoder = new google.maps.Geocoder();
  const infowindow = new google.maps.InfoWindow();

  map.addListener("click", (event) => {
    // Ottieni le coordinate del punto cliccato sulla mappa
    const latlng = event.latLng;

    // Utilizza il geocoder per ottenere l'indirizzo corrispondente alle coordinate
    geocoder.geocode({ location: latlng }, (results, status) => {
      if (status === "OK") {
        if (results[0]) {
          // Mostra l'indirizzo nell'infowindow
          infowindow.setContent(results[0].formatted_address);
          infowindow.setPosition(latlng);
          infowindow.open(map);

          // Compila il campo "Indirizzo" con l'indirizzo trovato
          document.getElementById("address-input").value = results[0].formatted_address;
        }
      }
    });
  });
}

window.initMap = initMap;