$("#back-btn").hide();

$(document).ready(function(){
  $("#signup-btn").click(function(){
    $("#btn-group").hide();
    $("#back-btn").show();
    $("#registration-form").removeClass("hidden").addClass("visible");
    $("#login-form").addClass("hidden").removeClass("visible");
  });
  $("#login-btn").click(function(){
    $("#btn-group").hide();
    $("#back-btn").removeClass("hidden").addClass("visible");
    $("#login-form").removeClass("hidden").addClass("visible");
    $("#registration-form").addClass("hidden").removeClass("visible");
  });
  $('#back-btn').click(function() {
    $("#registration-form").addClass("hidden").removeClass("visible");
    $("#login-form").addClass("hidden").removeClass("visible");
    $('#btn-group').show();
  });
});