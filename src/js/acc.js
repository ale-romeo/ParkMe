$(document).ready(function () {
    $("#priv_email").blur(function () {
        var priv_email = $(this).val();
        $.ajax({
            url: '../db/eml_val.php',
            type: 'POST',
            data: { priv_email: priv_email },
            success: function (response) {
                if (response == 'invalid') {
                    $("#emlErr").html("Email non valida");
                    $("#priv_email").val("");
                } else {
                    $("#emlErr").html("");
                }
            }
        });
    });
});

$(document).ready(function () {
    $("#username").blur(function () {
        var username = $(this).val();
        var email = $("#email").val();
        $.ajax({
            url: '../db/ck_usr.php',
            type: 'POST',
            data: { username: username, email: email },
            success: function (response) {
                if (response == 'exists') {
                    $("#usrErr").html("Nome utente già esistente");
                    $("#username").val("");
                } else {
                    $("#usrErr").html("");
                }
            }
        });
    });
});

function show_det() {
    $.ajax({
        url: "../db/get_acc.php",
        dataType: 'json',
        success: function (data) {
            $('#username').val(data.username);
            $('#email').val(data.email);
            $('#name').val(data.name);
            $('#bdate').val(data.birth_date);
            $('#surname').val(data.surname);
            $('#phone').val(data.phone);
            if (data.gender == 'M') {
                $('#gender').val('male');
            }
            if (data.gender == 'F') {
                $('#gender').val('female');
            }
            if (data.gender == 'O') {
                $('#gender').val('other');
            }
            $('#priv_email').val(data.priv_email_employee);
        },
        error: function() {
            alert("Errore durante il caricamento dell'account.");
        }
    });
}

$(document).ready(function () {
    show_det();
});

$(document).ready(function () {
    $("#edit-acc").submit(function (event) {
        event.preventDefault();

        var username = $("#username").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var bdate = $("#bdate").val();
        var gender = $("#gender option:selected").val();
        var priv_email = $("#priv_email").val();

        $.ajax({
            type: 'POST',
            url: '../db/up_acc.php',
            data: { username: username, email: email, phone: phone, gender: gender, bdate: bdate, priv_email: priv_email },
            success: function () {
                $("#emlErr").html("");
                $("#usrErr").html("");
                show_det();
            },
            error: function () {
                alert("Si è verificato un errore durante l'invio dei dati.");
            }
        });
    });
});
