<?php
// logout.php
session_start();
session_unset(); // Очистка всех переменных сессии
session_destroy(); // Завершение сессии
header("Location: ../../index.php"); // Перенаправление на главную страницу
exit;
?>