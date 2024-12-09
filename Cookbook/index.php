<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Кулинарная книга</title>
</head>
<body>
    <?php require "header.html"?>
    <main id="main">
        <div id="main-block">
            <div id="main-block-container">
                <div id="title-text">
                    <div id="title-name">
                        <h1 class="title-h1">Вкусные Рецепты на Каждый День</h1>
                    </div>
                    <div id="discription">
                        <p class="text">
                            Добро пожаловать на сайт "Кулинарная Книга" — ваш гид в мир простых и вкусных рецептов! Здесь собраны лучшие рецепты со всего мира, которые легко приготовить дома.
                        </p>
                    </div>
                </div>
                <div id="search">
                    <div id="search-container">
                        <form id="search-form" action="" method="post">
                            <input type="search" id="input-search" placeholder="ПОИСК...">
                            <button type="button" id="btn-search">
                                <img src="assets/img/icon/icon-search.png" alt="search">
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="container1-main-img">
                <div id="container-main-img">
                    <img id="main-img" src="assets/img/background/dish.png" alt="">
                </div>
            </div>
        <div id="ideas-for">
            <div class="title">
                <h2 class="title-h2">ХОЧУ ПРИГОТОВИТЬ</h2>
            </div>
            <div id="categories">
                <ul id="categories-items">
                    <!-- <li class="category-item">
                        <a href="recipes.php?category=ЗАВТРАК">
                            <img class="img-category" src="assets/img/categories/Breakfast.svg" alt="завтрак">
                            <p class="name-category">ЗАВТРАК</p>
                        </a>
                    </li>
                    <li class="category-item">
                        <a href="recipes.php?category=ОБЕД">
                            <img class="img-category" src="assets/img/categories/Lunch.svg" alt="обед">
                            <p class="name-category">ОБЕД</p>
                        </a>
                    </li> -->
                    <li class="category-item">
                        <a href="recipes.php?category=ЗАВТРАК">
                            <img class="img-category" src="assets/img/categories/Breakfast.svg" alt="завтрак">
                            <p class="name-category">ЗАВТРАК</p>
                        </a>
                    </li>
                    <li class="category-item">
                        <a href="recipes.php?category=ОБЕД">
                            <img class="img-category" src="assets/img/categories/Lunch.svg" alt="обед">
                            <p class="name-category">ОБЕД</p>
                        </a>
                    </li>
                    <li class="category-item">
                        <a href="recipes.php?category=УЖИН">
                            <img class="img-category" src="assets/img/categories/Meal.svg" alt="ужин">
                            <p class="name-category">УЖИН</p>
                        </a>
                    </li>
                    <li class="category-item">
                        <a href="recipes.php?category=ДЕСЕРТЫ">
                            <img class="img-category" src="assets/img/categories/Dessert.svg" alt="десерт">
                            <p class="name-category">ДЕСЕРТ</p>
                        </a>
                    </li>
                    <li class="category-item">
                        <a href="recipes.php?category=НАПИТКИ">
                            <img class="img-category" src="assets/img/categories/Beverages.svg" alt="напиток">
                            <p class="name-category">НАПИТОК</p>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
        <div id="popular">
            <div class="title">
                <h2 class="title-h2">ПОПУЛЯРНОЕ</h2>
            </div>
            <div id="popular-dish">
                <ul id="popular-dish-items">
                    <li class="popular-dish-item">
                        <a href="">
                            <img class="img-dish" src="assets/img/vkusnayshka.jpg" alt="">
                            <p class="name-dish">fjhsf uoygefilfh jkfwef</p>
                        </a>
                    </li>
                    <li class="popular-dish-item">
                        <a href="">
                            <img class="img-dish" src="assets/img/vkusnayshka.jpg" alt="">
                            <p class="name-dish">fjhsf uoygefilfh jkfwef</p>
                        </a>
                    </li>
                    <li class="popular-dish-item">
                        <a href="">
                            <img class="img-dish" src="assets/img/vkusnayshka.jpg" alt="">
                            <p class="name-dish">fjhsf uoygefilfh jkfwef</p>
                        </a>
                    </li>
                </ul>
                <div class="btn-more">
                    <a class="style-button" href="recipes.php">ЕЩЁ</a>
                </div>
            </div>
        </div>
        <div id="information">
            <div id="text_information">
                <p class="text">
                    Ищите вдохновение по категориям, создавайте свои подборки любимых блюд, сохраняйте рецепты в избранное и делитесь своими кулинарными шедеврами с друзьями. Вкусное питание — это просто!
                </p>
            </div>
            <div id="container_solor"></div>
        </div>
        <div id="advices">
            <div class="title">
                <h2 class="title-h2">СОВЕТЫ</h2>
            </div>
            <ul id="advices-items">
                <li class="advices-item">
                    <a href="">
                        <img class="advices-item-img" src="assets/img/chel-gotovit-v-krutoi-scovorodke.png" alt="">
                        <p class="advices-item-text">Oшоауцшгатщхьш змхзкпзъщлуа  е гщшоаьу к,аку  щу сьу оацуьа ау ц кпоь кп ф,ауо шгатт  щшокп.</p>
                    </a>
                </li>
                <li class="advices-item">
                    <a href="">
                        <img class="advices-item-img" src="assets/img/vegetables.png" alt="">
                        <p class="advices-item-text"> E гщшоаьу к,аку  щу сьу оацуьа ау ц кпоь кп ф,ауо шгатт  щшокп.</p>
                    </a>
                </li>
                <li class="advices-item">
                    <a href="">
                        <img class="advices-item-img" src="assets/img/chef-cutting-greens.png" alt="">
                        <p class="advices-item-text">Ушаркпшкпштпм цпщшкопт уак муюакулпоп, ушао кплх кп</p>
                    </a>
                </li>
            </ul>
        </div>
    </main>
    <?php require "footer.html"?>
</body>
<script src="assets/js/main.js"></script>
</html>