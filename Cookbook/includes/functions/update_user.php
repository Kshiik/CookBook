<?php
require_once '../connect/connect.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($_SESSION['user']['id_user'])) {
        $id = $_SESSION['user']['id_user'];
        $fields = [];
        $params = ['id_user' => $id];

        // Добавляем только те поля, которые пришли
        if (!empty($data['login'])) {
            $fields[] = "login = :login";
            $params['login'] = trim($data['login']);
        }
        if (!empty($data['first_name'])) {
            $fields[] = "first_name = :first_name";
            $params['first_name'] = trim($data['first_name']);
        }
        if (!empty($data['last_name'])) {
            $fields[] = "last_name = :last_name";
            $params['last_name'] = trim($data['last_name']);
        }

        if (!empty($fields)) {
            $query = "UPDATE users SET " . implode(", ", $fields) . " WHERE id_user = :id_user";
            $stmt = $pdo->prepare($query);

            if ($stmt->execute($params)) {
                echo json_encode(['status' => 'success', 'message' => 'Профиль успешно обновлен']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Ошибка обновления профиля']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Нет данных для обновления']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Вы не авторизованы']);
    }
}
?>