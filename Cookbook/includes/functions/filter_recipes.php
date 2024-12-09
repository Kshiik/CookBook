<?php
require_once "../connect/connect.php";

$data = json_decode(file_get_contents("php://input"), true);

$search = $data['search'] ?? null;
$category = $data['category'] ?? null;
$cookingMethod = $data['method'] ?? null;
$ingredient = $data['ingredient'] ?? null;

$query = "SELECT DISTINCT r.* FROM recipes r
    LEFT JOIN recipe_categories rc ON r.id_recipe = rc.recipe_id
    LEFT JOIN categories c ON rc.category_id = c.id_category
    LEFT JOIN recipe_cooking_methods rcm ON r.id_recipe = rcm.recipe_id
    LEFT JOIN cooking_method cm ON rcm.cooking_method_id = cm.id_cooking_method
    LEFT JOIN recipe_ingredients i ON r.id_recipe = i.recipe_id
    WHERE 1=1";

$params = [];

// Фильтрация по категории
if ($category) {
    $query .= " AND c.category = ?";
    $params[] = $category;
}

// Фильтрация по способу приготовления
if ($cookingMethod) {
    $query .= " AND cm.method = ?";
    $params[] = $cookingMethod;
}

// Фильтрация по ингредиенту
if ($ingredient) {
    $query .= " AND i.ingredient LIKE ?";
    $params[] = $ingredient;
}

// Поиск по названию рецепта
if ($search) {
    $query .= " AND r.name_recipe LIKE ?";
    $params[] = "%" . $search . "%";
}

$orderBy = $data['order_by'] ?? 'relevance'; // Устанавливаем "relevance" как ключ по умолчанию
$sortDirection = strtoupper($data['sort_direction'] ?? 'ASC'); // По умолчанию сортировка по возрастанию

$orderByMap = [
    'relevance' => 'r.id_recipe',
    'time' => 'r.cooking_time_minutes',
    'calories' => 'r.calories',
    'servings' => 'r.servings',
];

if (!array_key_exists($orderBy, $orderByMap)) {
    $orderBy = 'relevance'; // Убедимся, что ключ существует в $orderByMap
}
if (!in_array($sortDirection, ['ASC', 'DESC'])) {
    $sortDirection = 'ASC'; // Убедимся, что направление корректное
}

$query .= " ORDER BY " . $orderByMap[$orderBy] . " " . $sortDirection;

// Выполнение запроса
$stmt = $pdo->prepare($query);
$stmt->execute($params); 
$recipes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Генерация HTML
foreach ($recipes as $recipe) {
    echo '<div class="recipe-item">
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

// Если рецептов нет, выводим сообщение
if (empty($recipes)) {
    echo '<p>Рецепты не найдены</p>';
}
?>