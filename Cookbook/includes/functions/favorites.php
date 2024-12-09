<?php
require_once '../connect/connect.php';
session_start();

$response = ['success' => false, 'message' => 'Неизвестная ошибка'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $userId = $_SESSION['user']['id_user'] ?? null; // Используйте вашу логику для получения user_id

    if (!$userId) {
        $response['message'] = 'Пользователь не авторизован.';
        echo json_encode($response);
        exit;
    }

    $action = $data['action'] ?? null;
    $recipeId = $data['recipe_id'] ?? null;

    if (!$recipeId) {
        $response['message'] = 'Не указан ID рецепта.';
        echo json_encode($response);
        exit;
    }

    try {
        if ($action === 'add') {
            $stmt = $pdo->prepare("INSERT INTO favorites (user_id, recipe_id) VALUES (:user_id, :recipe_id)");
            $stmt->execute(['user_id' => $userId, 'recipe_id' => $recipeId]);
            $response['success'] = true;
            $response['message'] = 'Рецепт добавлен в избранное.';
        } elseif ($action === 'remove') {
            $stmt = $pdo->prepare("DELETE FROM favorites WHERE user_id = :user_id AND recipe_id = :recipe_id");
            $stmt->execute(['user_id' => $userId, 'recipe_id' => $recipeId]);
            $response['success'] = true;
            $response['message'] = 'Рецепт удалён из избранного.';
        } else {
            $response['message'] = 'Неверное действие.';
        }
    } catch (Exception $e) {
        $response['message'] = 'Ошибка: ' . $e->getMessage();
    }
}

echo json_encode($response);
?>