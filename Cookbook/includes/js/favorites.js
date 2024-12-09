document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.recipe-item').forEach(item => {
        const heartLines = item.querySelector('.svg-heart-lines');
        const heartFill = item.querySelector('.svg-heart-fill');
        const recipeId = item.getAttribute('data-recipe-id'); // Убедитесь, что в HTML добавлен `data-recipe-id`

        // Добавить в избранное
        heartLines.addEventListener('click', () => {
            fetch('includes/functions/favorites.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ action: 'add', recipe_id: recipeId })
            })
                .then(response => response.json())
                .then(data => {
                    if (!data.success) {
                        alert(data.message || 'Не удалось добавить рецепт в избранное.');
                    }
                });
        });

        // Удалить из избранного
        heartFill.addEventListener('click', () => {
            fetch('includes/functions/favorites.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ action: 'remove', recipe_id: recipeId })
            })
                .then(response => response.json())
                .then(data => {
                    if (!data.success) {
                        alert(data.message || 'Не удалось удалить рецепт из избранного.');
                    }
                });
        });
    });
});