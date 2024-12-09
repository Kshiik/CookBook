document.addEventListener('DOMContentLoaded', () => {
    // Обработчик для кнопок удаления
    document.querySelectorAll('.delete-recipe').forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault(); // Предотвращаем переход по ссылке

            const recipeId = this.getAttribute('data-id'); // Получаем ID рецепта

            if (recipeId) {
                // Отправляем запрос на сервер
                fetch('includes/functions/delete_favorite.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ recipe_id: recipeId })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Удаляем элемент из DOM
                        const recipeElement = document.getElementById('recipe-' + recipeId);
                        if (recipeElement) {
                            recipeElement.remove();
                        }
                    } else {
                        console.error('Ошибка удаления рецепта:', data.error);
                    }
                })
                .catch(error => console.error('Ошибка запроса:', error));
            }
        });
    });
});