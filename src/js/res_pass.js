$(document).ready(function () {
    $("#password").blur(function () {
        var password = $(this).val();
        $.ajax({
            url: '../db/ck_pass.php',
            type: 'POST',
            data: { password: password },
            success: function (response) {
                if (response == 'invalid') {
                    $("#passErr").html("La password è errata");
                    $("#password").val("");
                } 
                if (response == 'expired_emp') {
                    alert('Sessione scaduta.');
                    window.location.href('emp_log_pg.php');
                }
                if (response == 'expired_end') {
                    alert('Sessione scaduta.');
                    window.location.href('login_pg.php');
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
            url: '../db/pass_val.php',
            type: 'POST',
            data: { password: npass },
            success: function (response) {
                if (response == 'invalid') {
                    $("#npassErr").html("La password è troppo debole.");
                    $("#npass").val("");
                } 
                if (response == 'expired_emp') {
                    alert('Sessione scaduta.');
                    window.location.href('emp_log_pg.php');
                }
                if (response == 'expired_end') {
                    alert('Sessione scaduta.');
                    window.location.href('login_pg.php');
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

        if (npass != "") {
            if (npass == cpass) {
                $.ajax({
                    type: 'POST',
                    url: '../db/up_pass.php',
                    data: { password: password },
                    success: function (response) {
                        if (response == 'expired_emp') {
                            alert('Sessione scaduta');
                            window.location.href('emp_log_pg.php');
                        }
                        alert('Password modificata');
                        window.location.href('emp_log_pg.php');
                    },
                    error: function () {
                        alert("Si è verificato un errore durante l'invio dei dati.");
                    }
                });
            } else {
                alert('Le password non corrispondono');
            }
        }

        
    });
});