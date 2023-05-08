function show_logs() {
    $.ajax({
        url: "../../db/get_v_logs.php",
        type: "POST",
        success: function (data) {
            $("#tabella-logs").html(data);

            $("#table-wrapper").show();

            $("#table-wrapper").scrollTop(0);
        },
        error: function () {
            alert('Si è verificato un errore durante la visualizzazione dei logs.');
        }
    });
}

$(document).ready(function () {
    show_logs();
});