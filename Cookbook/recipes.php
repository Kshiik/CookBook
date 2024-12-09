<?php
require_once 'includes/connect/connect.php';
session_start();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/recipes.css">
    <title>Рецепты</title>
</head>
<body>
    <?php require "header.html"; ?>
    <main id="main">
        <div id="recipes">
            <h1 class="title-h1">Рецепты</h1>
            <!-- Поиск и фильтрация -->
            <div id="container-search">
                <ul id="container-search__categories-items">
                    <?php
                    $stmt = $pdo->query("SELECT category FROM categories");
                    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    foreach ($categories as $category) {
                        echo '<li class="container-search__categories-item">
                                <a href="recipes.php?category=' . urlencode($category['category']) . '" class="categories-item" onclick="changeColor(event)">' . htmlspecialchars($category['category']) . '</a>
                                </li>';
                    }
                    ?>
                </ul>
                <div id="container-search__filter">
                    <div id="aaa">
                        <div id="container-search__filter-sort">
                            <select name="cooking-method" id="cookin-method-select">
                            <option value="cookingmethod">СПОСОБ ПРИГОТОВЛЕНИЯ</option>
                                <?php
                                $stmt = $pdo->query("SELECT method FROM cooking_method");
                                $methods = $stmt->fetchAll(PDO::FETCH_ASSOC);

                                foreach ($methods as $method) {
                                    echo '<option value="' . htmlspecialchars($method['method']) . '">' . htmlspecialchars($method['method']) . '</option>';
                                }

                                ?>
                            </select>
                        </div>
                        <div id="container-search__filter-ingredients">
                            <input type="text" placeholder="ВВЕДИТЕ ИНГРЕДИЕНТ" name="text-ingredient" id="text-ingredient">
                        </div>
                    </div>
                    <form action="" method="post" id="form-selection">
                        <input type="button" value="ПОДБОР" name="selection" id="selection">
                        <input type="button" value="ОТМЕНИТЬ" name="cancel-selection" id="cancel-selection">
                    </form>
                </div>
                <form action="" id="search">
                    <input type="text" placeholder="НАПИШИТЕ НАЗВАНИЕ РЕЦЕПТА" name="text-search" id="text-search">
                    <input type="button" value="ПОИСК" id="btn-search">
                </form>
                <ul id="container-search__sort-items">
                    <li class="sort-item">
                        <button data-sort="relevance" class="sort-button">ПО РЕЛЕВАНТНОСТИ <span class="sort-icon">▼</span></button>
                    </li>
                    <li class="sort-item">
                        <button data-sort="time" class="sort-button">ПО ВРЕМЕНИ ПРИГОТОВЛЕНИЯ <span class="sort-icon">▼</span></button>
                    </li>
                    <li class="sort-item">
                        <button data-sort="calories" class="sort-button">ПО КАЛОРИЙНОСТИ <span class="sort-icon">▼</span></button>
                    </li>
                    <li class="sort-item">
                        <button data-sort="servings" class="sort-button">ПО ПОРЦИЯМ <span class="sort-icon">▼</span></button> 
                    </li>
                </ul>
            </div>

            <!-- Список с рецептами -->
            <div id="recipes-list">
                <?php
                $category = $_GET['category'] ?? null;

                $query = "SELECT recipes.* FROM recipes";

                if ($category) {
                    $query .= "
                    JOIN recipe_categories ON recipes.id_recipe = recipe_categories.recipe_id
                    JOIN categories ON recipe_categories.category_id = categories.id_category
                    WHERE categories.category = :category";
                }

                $stmt = $pdo->prepare($query);
                
                if ($category) {
                    $stmt->bindParam(':category', $category, PDO::PARAM_STR);
                }

                $stmt->execute(); 
                $recipes = $stmt->fetchAll(PDO::FETCH_ASSOC);

                foreach ($recipes as $recipe) {
                    echo '<div class="recipe-item" data-recipe-id="' . htmlspecialchars($recipe['id_recipe']) . '">
                            <a href="recipe.php?id=' . htmlspecialchars($recipe['id_recipe']) . '" class="href-recipe-item">
                                <div class="recipe-image">
                                    <img src="' . htmlspecialchars($recipe['img_recipe']) . '" alt="' . htmlspecialchars($recipe['name_recipe']) . '">
                                </div>
                                <div class="recipe-text">
                                    <section class="recipe-text__title">
                                        <p class="title-recipe">' . htmlspecialchars($recipe['name_recipe']) . '</p>
                                    </section>
                                    <section class="recipe-text__description">
                                        <section class="description-time">
                                            <p class="recipe-cooking-time">' . htmlspecialchars($recipe['cooking_time']) . '</p>
                                        </section>
                                        <section class="description-portions-calories">
                                            <p>' . htmlspecialchars($recipe['servings']) . ' порции / ' . htmlspecialchars($recipe['calories']) . ' ккал</p>
                                        </section>
                                    </section>
                                </div>
                            </a>
                            <div class="hearts">
                                <button class="svg-heart-lines">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8l0-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5l0 3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20-.1-.1s0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5l0 3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2l0-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/></svg>
                                </button>
                                <button class="svg-heart-fill" style="display: none;">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
                                </button>
                            </div>
                        </div>';
                    }
                ?>
            </div>
        </div>
    </main>
    <?php require "footer.html"; ?>
    <script src="assets/js/recipes.js"></script>
    <script src="includes/js/filterRecipes.js" defer></script>
    <!-- <script src="includes/js/sortRecipes.js"></script> -->
    <script src="includes/js/favorites.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const urlParams = new URLSearchParams(window.location.search);
        const selectedCategory = urlParams.get('category'); // Получаем категорию из URL

        if (selectedCategory) {
            const categoryLinks = document.querySelectorAll('.categories-item');
    
            categoryLinks.forEach(link => {
                // Сравниваем текст ссылки с выбранной категорией
                if (link.textContent.trim() === selectedCategory) {
                    link.style.background = "#b7c3c7";
                    link.style.color = "#fff";
                } else {
                    link.style.background = "#fff";
                    link.style.color = "#4d636a";
                }
            });
        }
    });
    </script>
</body>
</html>