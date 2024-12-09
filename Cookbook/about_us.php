<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/about_us.css">
    <script src="assets/js/about_us.js"></script>
    <title>О нас</title>
</head>
<body>
    <?php require "header.html"?>
    <main id="main">
        <div id="about_us">
            <h1 class="title-h1">О НАС</h1>
            <div id="content" class="bg-img">
                <p id="first-text">
                    Добро пожаловать на сайт "Кулинарная Книга" — ваш гид в мир простых и вкусных рецептов! Здесь вы найдете кулинарные идеи на каждый день: от быстрых завтраков и сытных обедов до изысканных ужинов и десертов. Мы собрали для вас лучшие рецепты со всего мира, которые легко приготовить дома.
                </p>
                <p id="second-text">
                    Ищите вдохновение по категориям, создавайте свои подборки любимых блюд, сохраняйте рецепты в избранное и делитесь своими кулинарными шедеврами с друзьями. Вкусное питание — это просто!
                </p>
            </div>
            <div id="img-slide">
                <div>
                    <img src="assets/img/hamburgeeeer.jpg" alt="">
                    <img src="assets/img/jarkoe.png" alt="">
                    <img src="assets/img/povar-kukaet.png" alt="">
                    <img src="assets/img/lemonade-drink.jpg" alt="">
                    <img src="assets/img/hamburgeeeer.jpg" alt="">
                    <img src="assets/img/jarkoe.png" alt="">
                    <img src="assets/img/povar-kukaet.png" alt="">
                    <img src="assets/img/lemonade-drink.jpg" alt="">
                </div>
            </div>
            <div class="btn-show-more">
                <a class="style-button" href="recipes.php">ПОСМОТРЕТЬ РЕЦЕПТЫ</a>
            </div>
        </div>
    </main>
    <?php require "footer.html"?>
</body>
</html>