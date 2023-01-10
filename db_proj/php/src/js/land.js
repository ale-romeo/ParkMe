const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');

togglePassword.addEventListener("click", function () {
    this.classList.toggle("fa-eye-slash");
    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);
})

function getTicket() {
    $.ajax({
      url: 'guest.php',
      type: 'POST',
      data: {Park: true},
      success: function(response) {
        // Update the page with the response from the PHP script
        alert(response);
      }
    });
}