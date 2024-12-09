<?php
session_start();

require_once 'includes/connect/connect.php'; 

if (!isset($_SESSION['user'])) {
    header("Location: reg.html"); 
    exit;
}

$id_user = $_SESSION['user']['id_user']; 
$stmt = $pdo->prepare("SELECT login, email, first_name, last_name FROM users WHERE id_user = :id_user");
$stmt->execute(['id_user' => $id_user]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);
// print_r($_SESSION['user']['id_user']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/profile.css">
    <title>Профиль</title>
</head>
<body>
    <?php require "header.html"?>
    <main id="main">
        <div id="profile">
            <div id="title-container">
                <div>
                <h1 class="title-h1">ПРОФИЛЬ</h1>
                </div>
                <div id="arrows">
                    <p id="arrow2">◄</p>
                    <p id="arrow1">►</p>
                </div>
            </div>

            <!-- профиль -->
            <?php if (isset($id_user)){ ?>
            <div id="profile-container">
                <div id="user-save-recipes">
                    <div id="user-save-recipes-1">
                        <h2 class="title-h2">Ваши сохраненные рецепты</h2>
                        <ul id="save-recipes">
                            <?php
                            $stmt = $pdo->prepare("SELECT rf.id_recipe, rf.name_recipe, rf.img_recipe 
                                                    FROM recipes rf
                                                    JOIN favorites f ON rf.id_recipe = f.recipe_id
                                                    WHERE f.user_id = :user_id");
                            $stmt->execute(['user_id' => $id_user]);
                            $favorites = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            foreach ($favorites as $favorite) { 
                                echo '<li class="save-recipe">
                                    <a href="recipe.php?id=' . htmlspecialchars($favorite['id_recipe']) . '">
                                        <img src="' . htmlspecialchars($favorite['img_recipe']) . '" alt="' . htmlspecialchars($favorite['name_recipe']) . '" class="img-save-recipe">
                                        <p class="title-save-recipe">' . htmlspecialchars($favorite['name_recipe']) . '</p>
                                    </a>
                                    <section class="img-delete">
                                        <button type="button" class="delete-recipe" aria-label="Удалить рецепт" data-id="' . htmlspecialchars($favorite['id_recipe']) . '">
                                            <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 72 72" width="128px" height="128px"><path d="M 32.5 9 C 28.364 9 25 12.364 25 16.5 L 25 18 L 17 18 C 14.791 18 13 19.791 13 22 C 13 24.209 14.791 26 17 26 L 17.232422 26 L 18.671875 51.916016 C 18.923875 56.449016 22.67875 60 27.21875 60 L 44.78125 60 C 49.32125 60 53.076125 56.449016 53.328125 51.916016 L 54.767578 26 L 55 26 C 57.209 26 59 24.209 59 22 C 59 19.791 57.209 18 55 18 L 47 18 L 47 16.5 C 47 12.364 43.636 9 39.5 9 L 32.5 9 z M 32.5 16 L 39.5 16 C 39.775 16 40 16.224 40 16.5 L 40 18 L 32 18 L 32 16.5 C 32 16.224 32.225 16 32.5 16 z M 36 28 C 37.104 28 38 28.896 38 30 L 38 47.923828 C 38 49.028828 37.104 49.923828 36 49.923828 C 34.896 49.923828 34 49.027828 34 47.923828 L 34 30 C 34 28.896 34.896 28 36 28 z M 27.392578 28.001953 C 28.459578 27.979953 29.421937 28.827641 29.460938 29.931641 L 30.085938 47.931641 C 30.123938 49.035641 29.258297 49.959047 28.154297 49.998047 C 28.131297 49.999047 28.108937 50 28.085938 50 C 27.012938 50 26.125891 49.148359 26.087891 48.068359 L 25.462891 30.068359 C 25.424891 28.964359 26.288578 28.040953 27.392578 28.001953 z M 44.607422 28.001953 C 45.711422 28.039953 46.575109 28.964359 46.537109 30.068359 L 45.912109 48.068359 C 45.874109 49.148359 44.986063 50 43.914062 50 C 43.891062 50 43.868703 49.999047 43.845703 49.998047 C 42.741703 49.960047 41.876063 49.035641 41.914062 47.931641 L 42.539062 29.931641 C 42.577062 28.827641 43.518422 27.979953 44.607422 28.001953 z"/></svg>
                                        </button>
                                        <!-- <span class="tooltiptext">УДАЛИТЬ</span> -->
                                    </section>
                                </li>';
                            } 
                            ?>
                        </ul>
                    </div>
                </div>
                <div id="user-data-container">
                    <div id="user-data-container-1">
                        <h2 class="title-h2">Ваши данные</h2>
                        <div>
                            <div id="user-data">
                                <section class="user-data__login">
                                    <p>Логин: </p>
                                    <p> <?= htmlspecialchars($user['login']) ?> </p>
                                </section>
                                <section class="user-data__email">
                                    <p>Email: </p>
                                    <p> <?= htmlspecialchars($user['email']) ?> </p>
                                </section>
                                <section class="user-data__first-name">
                                    <p>Имя: </p>
                                   <p> <?= isset($user['first_name']) && $user['first_name'] !== null ? htmlspecialchars($user['first_name']) : "-" ?> </p>
                                </section>
                                <section class="user-data__first-name">
                                    <p>Фамилия: </p>
                                    <p> <?= isset($user['last_name']) && $user['last_name'] !== null ? htmlspecialchars($user['last_name']) : "-" ?> </p>
                                </section>
                            </div>
                            <div id="btn-container">
                                <button type="button" class="style-button" onclick="window.editWindow.showModal()">РЕДАКТИРОВАТЬ</button>
                                <button type="button" class="style-button" id="exit-btn" onclick="window.exitWindow.showModal()">ВЫЙТИ</button>
                            </div>
                            <div id="modil-windows">
                                <dialog id="editWindow">
                                    <p id="title-form">РЕДАКТИРОВАТЬ ПРОФИЛЬ</p>
                                    <form action="" method="post" id="edit-form">
                                        <input type="text" placeholder="ЛОГИН" name="edit-login" id="edit-login">
                                        <input type="text" placeholder="ИМЯ" name="edit-firstname" id="edit-firstname">
                                        <input type="text" placeholder="ФАМИЛИЯ" name="edit-lastname" id="edit-lastname">
                                        <input type="button" value="РЕДАКТИРОВАТЬ" name="edit" id="edit-btn" class="style-button">
                                        <button type="button" onclick="document.getElementById('editWindow').close()" id="cancel-btn" class="style-button">ОТМЕНА</button>
                                    </form>
                                </dialog>
                                <dialog id="exitWindow">
                                    <p id="title-form">ВЫ ДЕЙСТВИТЕЛЬНО ХОТИТЕ ВЫЙТИ?</p>
                                    <form action="includes/functions/logout.php" method="post" id="exit-form">
                                        <input type="submit" value="ВЫЙТИ" name="exit" id="exit-btn" class="style-button">
                                        <button type="button" onclick="document.getElementById('exitWindow').close()" id="cancel-btn" class="style-button">ОТМЕНА</button>
                                    </form>
                                </dialog>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- окно вход/регистрации -->
            <?php } else{ ?>
            <div id="auth-container">
                <div id="container">
                    <p>Вы еще не вошли</p>
                    <a href="auth.html" id="buttom-auth" class="style-button">ВХОД/РЕГИСТРАЦИЯ</a>
                </div>
            </div>
            <?php } ?>
            
        </div>
    </main>
    <?php require "footer.html"?>
    <script src="assets/js/profile.js"></script>
    <script src="includes/js/editProfile.js"></script>
    <script src="includes/js/deleteFavorite.js"></script>
</body>
</html>