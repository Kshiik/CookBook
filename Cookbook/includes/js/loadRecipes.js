fetch("includes/functions/get_recipes.php")
    .then(response => response.json())
    .then(data => {
        const recipesList = document.getElementById("recipes-list");
        data.forEach(recipe => {
            const recipeItem = `
                <div class="recipe-item">
                    <a href="recipe.php?id=${recipe.id_recipe}" class="href-recipe-item">
                        <div class="recipe-image">
                            <img src="${recipe.img_recipe}" alt="${recipe.name_recipe}">
                        </div>
                        <div class="recipe-text">
                            <section class="recipe-text__title">
                                <p class="title-recipe">${recipe.name_recipe}</p>
                            </section>
                            <section class="recipe-text__description">
                                <section class="description-time">
                                    <p class="recipe-cooking-time">${recipe.cooking_time} мин</p>
                                </section>
                                <section class="description-portions-calories">
                                    <p class="recipe-cooking-time">${recipe.servings} порции / ${recipe.calories} ккал</p>
                                </section>
                            </section>
                        </div>
                    </a>
                </div>
            `;
            recipesList.innerHTML += recipeItem;
        });
    })
    .catch(error => console.error("Ошибка загрузки рецептов:", error));