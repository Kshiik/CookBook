<?php
session_start();

header('Content-Type: application/json'); 

require_once '../connect/connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['login'], $data['password'])) {
        $login = $data['login'];
        $password = $data['password'];

        try {
            $stmt = $pdo->prepare("SELECT * FROM users WHERE login = :login");
            $stmt->execute([':login' => $login]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['password'])) {
                $_SESSION['user'] = [
                    'id_user' => $user['id_user'],
                    'login' => $user['login'],
                    'email' => $user['email'],
                ];
                echo json_encode(['status' => 'success', 'message' => 'Вы успешно вошли!']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Неверный логин или пароль']);
            }
        } catch (PDOException $e) {
            echo json_encode(['status' => 'error', 'message' => 'Ошибка базы данных: ' . $e->getMessage()]);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Отсутствуют данные для входа']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Неверный метод запроса']);
}
?>