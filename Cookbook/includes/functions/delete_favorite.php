<?php
// ini_set('log_errors', 1);
// ini_set('error_log', __DIR__ . '/error.log'); 
// error_reporting(E_ALL); 

session_start();
require_once '../connect/connect.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_SESSION['user'])) {
    $input = json_decode(file_get_contents('php://input'), true);

    if (isset($input['recipe_id'])) {
        $recipeId = (int)$input['recipe_id'];
        $userId = $_SESSION['user']['id_user'];

        // Удаляем рецепт из избранного
        $stmt = $pdo->prepare("DELETE FROM favorites WHERE user_id = :user_id AND recipe_id = :recipe_id");
        $stmt->execute(['user_id' => $userId, 'recipe_id' => $recipeId]);

        if ($stmt->rowCount() > 0) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'error' => 'Рецепт не найден или уже удалён']);
        }
    } else {
        echo json_encode(['success' => false, 'error' => 'ID рецепта отсутствует']);
    }
} else {
    echo json_encode(['success' => false, 'error' => 'Неверный запрос']);
}
?>