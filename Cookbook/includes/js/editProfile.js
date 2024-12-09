document.addEventListener('DOMContentLoaded', () => {
    const editBtn = document.getElementById('edit-btn');
    const form = document.getElementById('edit-form');

    editBtn.addEventListener('click', async () => {
        const login = document.getElementById('edit-login').value.trim();
        const firstName = document.getElementById('edit-firstname').value.trim();
        const lastName = document.getElementById('edit-lastname').value.trim();

        // Сохраняем только измененные поля
        const updatedFields = {};
        if (login) updatedFields.login = login;
        if (firstName) updatedFields.first_name = firstName;
        if (lastName) updatedFields.last_name = lastName;

        if (Object.keys(updatedFields).length === 0) {
            alert('Заполните хотя бы одно поле для изменения.');
            return;
        }

        const response = await fetch('includes/functions/update_user.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(updatedFields),
        });

        const result = await response.json();

        if (result.status === 'success') {
            alert(result.message);
            window.location.reload();
        } else {
            alert(result.message);
        }
    });
});