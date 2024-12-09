document.getElementById('authorization-form').addEventListener('submit', async (event) => {
    event.preventDefault();

    const login = document.getElementById('login-input').value;
    const password = document.getElementById('password-input').value;

    try {
        const response = await fetch('includes/functions/auth.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ login, password }),
        });

        const result = await response.json();

        if (result.status === 'success') {
            alert(result.message);
            window.location.href = 'profile.php'; 
        } else {
            alert(result.message);
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Ошибка при авторизации. Проверьте консоль для деталей.');
    }
});