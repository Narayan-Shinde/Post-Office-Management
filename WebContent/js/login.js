// JavaScript for toggling password visibility by clicking the icon
document.addEventListener('DOMContentLoaded', () => {
    const togglePasswordIcon = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('txtpass');
    const icon = togglePasswordIcon.querySelector('ion-icon');

    togglePasswordIcon.addEventListener('click', () => {
        const isPassword = passwordInput.type === 'password';
        passwordInput.type = isPassword ? 'text' : 'password';

        // Change the icon accordingly
        icon.setAttribute('name', isPassword ? 'lock-open' : 'lock-closed');
    });
});
