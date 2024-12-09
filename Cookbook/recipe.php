<?php
require_once "includes/connect/connect.php";

if (isset($_GET['id'])) {
    $recipe_id = intval($_GET['id']);

    // Получаем данные о рецепте
    $stmt = $pdo->prepare("SELECT * FROM recipes WHERE id_recipe = ?");
    $stmt->execute([$recipe_id]);
    $recipe = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$recipe) {
        die("Рецепт не найден.");
    }

    // Получаем ингредиенты
    // $stmt = $pdo->prepare("
    //     SELECT i.ingredient
    //     FROM recipe_ingredients ri
    //     JOIN ingredients i ON ri.ingredient_id = i.id_ingredient
    //     WHERE ri.recipe_id = ?");
    // $stmt->execute([$recipe_id]);
    // $ingredients = $stmt->fetchAll(PDO::FETCH_COLUMN);

    $stmt = $pdo->prepare("
    SELECT ingredient, units  
    FROM recipe_ingredients
    WHERE recipe_id = ?");
    $stmt->execute([$recipe_id]);
    $ingredients = $stmt->fetchAll(PDO::FETCH_ASSOC);


    // Получаем шаги рецепта
    $stmt = $pdo->prepare("
        SELECT number_step, description_step, img_step 
        FROM recipe_steps 
        WHERE recipe_id = ?
        ORDER BY number_step ASC");
    $stmt->execute([$recipe_id]);
    $steps = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    die("ID рецепта не указан.");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/recipe.css">
    <title><?php echo $recipe['name_recipe']; ?></title>
</head>
<body>
    <?php require "header.html"?>
    <main id="main">
        <div id="recipe">
            <div id="recipe-content">
                <div id="img-recipe">
                    <div class="main-image">
                        <img src="<?php echo $recipe['img_recipe']; ?>" alt="<?php echo $recipe['name_recipe']; ?>">
                    </div>
                    <div class="other-images">
                        <!-- Дополнительные изображения можно добавить, если есть -->
                    </div>
                </div>
                <div id="recipe-name">
                    <div id="recipe-name__title">
                        <h1 class="title-h1"><?php echo $recipe['name_recipe']; ?></h1>
                    </div>
                    <div id="recipe-name__description">
                        <div class="description cooking-time">
                            <p>ВРЕМЯ ПРИГОТОВЛЕНИЯ</p>
                            <p class="value text-time"><?php echo $recipe['cooking_time']; ?> </p>
                        </div>
                        <div class="description count-portions">
                            <p>КОЛИЧЕСТВО ПОРЦИЙ</p>
                            <p class="value text-portions"><?php echo $recipe['servings']; ?> порции</p>
                        </div>
                        <div class="description calories">
                            <p>КИЛОКАЛОРИЙ НА ПОРЦИЮ</p> 
                            <p class="value  text-calories"><?php echo $recipe['calories']; ?> ккал</p>
                        </div>
                    </div>
                    <div id="recipe-name__ingredients">
                        <p>ИНГРЕДИЕНТЫ: </p>
                        <ul class="ingredients-items">
                            <?php foreach ($ingredients as $ingredient){ ?>
                                <li class="ingredient-item">
                                    <p> <?php echo htmlspecialchars ($ingredient['ingredient']); ?> </p>
                                    <p> <?php echo htmlspecialchars ($ingredient['units']); ?> </p>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="stages-of-cooking">
                <?php foreach ($steps as $step){ ?>
                    <div class="cooking-stage <?php echo $step['img_step'] ? '' : 'cooking-stage--no-image'; ?>">
                        <p class="number-step"><?php echo htmlspecialchars($step['number_step']); ?></p>
                        <img src="<?php echo $step['img_step']; ?>" alt="">
                        <p class="description-stage"><?php echo htmlspecialchars($step['description_step']); ?></p>
                        <p class="number-step left"><?php echo htmlspecialchars($step['number_step']); ?></p>
                    </div>
                <?php } ?>
            </div>
        </div>
    </main>
    <?php require "footer.html"?>
</body>
</html>