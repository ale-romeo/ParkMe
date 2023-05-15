$(document).ready(function () {
    $("#res_form").submit(function (event) {
        // Impedisci il comportamento predefinito del form
        event.preventDefault();
        // Ottieni i dati dal form
        var price = $("#res_price").val();

        // Invia i dati via ajax al file PHP per l'inserimento nel database
        $.ajax({
            type: "POST",
            url: "../../db/upload/edit-res.php",
            data: { price: price },
            success: function () {
                alert('Prezzo prenotazione cambiato!');
                show_res();
            },
            error: function () {
                alert("Si è verificato un errore durante l'invio dei dati.");
            }
        });
    });
});

function show_res() {
    $.ajax({
        url: "../../db/get/get_res.php",
        success: function (data) {
            $("#res_price").val(data);
        },
        error: function () {
            alert('Si è verificato un errore durante la visualizzazione dei posti.');
        }
    });
}

$(document).ready(function () {
    show_res();
});

function logout() {
    var confirmLogout = confirm("Sei sicuro di voler effettuare il logout?");
    if (confirmLogout) {
        window.location.href = "../../logout_emp.php";
    }
}
