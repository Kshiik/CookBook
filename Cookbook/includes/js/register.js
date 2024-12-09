document.getElementById('registration-form').addEventListener('submit', async function (e) {
    e.preventDefault();

    const login = document.getElementById('login-input').value;
    const email = document.getElementById('email-input').value;
    const password = document.getElementById('password-input').value;

    try {
    const response = await fetch('includes/functions/register.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ login, email, password })
    });

    const result = await response.json();

    if (result.status === 'success') {
        alert(result.message);
        window.location.href = 'auth.html';
    } else {
        alert(result.message);
    }
} catch (error) {
    console.error('Error:', error);
    alert('An error occurred. Check console for details.');
}
});