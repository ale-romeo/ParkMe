$(document).ready(function () {
    $("#password").blur(function () {
        var password = $(this).val();
        $.ajax({
            url: '../db/check/ck_pass.php',
            type: 'POST',
            data: { password: password },
            success: function (response) {
                if (response == 'invalid') {
                    $("#passErr").html("La password è errata");
                    $("#password").val("");
                    $("#npassErr").html("");
                } else {
                    $("#passErr").html("");
                }
            },
            error: function () {
                alert('Errore durante il controllo della password.');
            }
        });
    });
});

$(document).ready(function () {
    $("#npass").blur(function () {
        var npass = $(this).val();
        $.ajax({
            url: '../db/check/pass_val.php',
            type: 'POST',
            data: { password: npass },
            success: function (response) {
                if (response == 'invalid') {
                    $("#npassErr").html("La password è troppo debole");
                    $("#npass").val("");
                    $("#passErr").html("");
                } else {
                    $("#npassErr").html("");
                }
            },
            error: function () {
                alert('Errore durante la verifica della nuova password.');
            }
        });
    });
});

$(document).ready(function () {
    $("#edit-pass").submit(function (event) {
        event.preventDefault();

        var cpass = $('#cpass').val();
        var npass = $('#npass').val();
        var opass = $("#password").val();
        if (opass != "") {
            if (npass != "") {
                if (npass == cpass) {
                    $.ajax({
                        type: 'POST',
                        url: '../db/upload/up_pass.php',
                        data: { password: npass },
                        success: function (response) {
                            alert('Password modificata');
                            window.location.href = '../logout_emp.php';
                        },
                        error: function () {
                            alert("Si è verificato un errore durante l'invio dei dati.");
                        }
                    });
                } else {
                    alert('Le password non corrispondono');
                }
            } else {
                alert("Inserire una nuova password.");
            }
        } else {
            alert('Inserire password attuale.');
        }
    });
});