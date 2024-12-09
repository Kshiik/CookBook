<?php
header('Content-Type: application/json');

include_once '../connect/connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (!isset($data['login'], $data['email'], $data['password'])) {
        http_response_code(400); 
        echo json_encode(['status' => 'error']);
        exit;
    }

    $login = trim($data['login']);
    $email = trim($data['email']);
    $password = trim($data['password']);

    if (empty($login) || empty($email) || empty($password)) {
        http_response_code(400); 
        echo json_encode(['status' => 'error']);
        exit;
    }

    $stmt = $pdo->prepare("SELECT id_user FROM users WHERE email = :email OR login = :login");
    $stmt->execute(['email' => $email, 'login' => $login]);

    if ($stmt->rowCount() > 0) {
        http_response_code(409); 
        echo json_encode(['status' => 'error']);
        exit;
    }

    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    try {
        $stmt = $pdo->prepare("INSERT INTO users (login, email, password, role_id) VALUES (:login, :email, :password, 2)");
        $stmt->execute(['login' => $login, 'email' => $email, 'password' => $hashedPassword]);
        echo json_encode(['status' => 'success']);
        exit;
    } catch (PDOException $e) {
        http_response_code(500); 
        echo json_encode(['status' => 'error']);
        exit;
    }


} else {
    http_response_code(405); 
    echo json_encode(['status' => 'error']);
    exit;
}
?>