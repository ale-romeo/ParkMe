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

let qrContentInput = document.getElementById("qr-content");
let qrGenerationForm = document.getElementById("qr-generation-form");
let qrCode;

function generateQrCode(qrContent) {
  return new qrCode("qr-code", {
    text: qrContent,
    width: 256,
    height: 256,
    colorDark: "#000000",
    colorLight: "#ffffff",
    correctLevel: qrCode.CorrectLevel.H,
  });
}

// Event listener for form submit event
qrGenerationForm.addEventListener("submit", function (event) {
  // Prevent form submission
  event.preventDefault();
  let qrContent = qrContentInput.value;
  if (qrCode == null) {
    // Generate code initially
    qrCode = generateQrCode(qrContent);
  } else {
    // If code already generated then make
    // again using same object
    qrCode.makeCode(qrContent);
  }
});