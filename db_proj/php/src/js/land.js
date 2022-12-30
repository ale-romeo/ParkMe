const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');

togglePassword.addEventListener("click", function () {
    this.classList.toggle("fa-eye-slash");
    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);
})