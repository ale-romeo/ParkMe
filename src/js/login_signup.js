$(document).ready(function() {
  $("#eye1").on('click', function () {
    $(this).toggleClass("fa-eye fa-eye-slash");
    var type = $("#pass1").attr("type") === "password" ? "text" : "password";
    $("#pass1").attr("type", type);
  });

  $("#eye2").on('click', function () {
    $(this).toggleClass("fa-eye fa-eye-slash");
    var type = $("#pass2").attr("type") === "password" ? "text" : "password";
    $("#pass2").attr("type", type);
  });
});