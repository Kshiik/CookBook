<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/recipes.css">
    <script src="assets/js/recipes.js"></script>
    <title>Рецепты</title>
</head>
<body>
    <?php require "header.html"?>
    <main id="main">
        <div id="recipes">
            <h1 class="title-h1">Рецепты</h1>
            <!-- поиск и фильтрация -->
            <div id="container-search">
                <ul id="container-search__categories-items">
                    <li class="container-search__categories-item">
                        <a href="" class="categories-item" onclick="changeColor(event)">ЗАВТРАК</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">ОБЕД</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">УЖИН</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">ЗАКУСКИ</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">ВЫПЕЧКА</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">САЛАТЫ</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">СУПЫ</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">ДЕСЕРТЫ</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">НАПИТКИ</a>
                    </li>
                    <li class="container-search__categories-item">
                        <a href="#" class="categories-item" onclick="changeColor(event)">ЗАГОТОВКИ</a>
                    </li>
                </ul>
                <div id="container-search__filter">
                    <div id="container-search__filter-sort">
                        <select name="cooking-method" id="cookin-method-select">
                            <option value="cookingmethod">СПОСОБ ПРИГОТОВЛЕНИЯ</option>
                            <option value="fry">ЖАРИТЬ</option>
                            <option value="boil">ВАРИТЬ</option>
                            <option value="extinguish">ТУШИТЬ</option>
                            <option value="bake">ЗАПЕКАТЬ</option>
                            <option value="withoutcooking">БЕЗ ПРИГОТОВЛЕНИЯ НА ПЛИТЕ</option>
                        </select>
                    </div>
                    <!-- <div id="container-search__filter-ingredients">
                        <select name="ingredients" id="ingredients-select">
                            <option value="ingredient">ПОПУЛЯРНЫЕ ИНГРЕДИЕНТЫ</option>
                            <option value="meat">МЯСО</option>
                            <option value="fish">РЫБА</option>
                            <option value="chiken">ПТИЦА</option>
                            <option value="eggs">ЯЙЦА</option>
                            <option value="cheese">СЫР</option>
                            <option value="milk">МОЛОКО</option>
                            <option value="curd">ТВОРОГ</option>
                            <option value="tomato">ПОМИДОРЫ</option>
                            <option value="potato">КАРТОФЕЛЬ</option>
                            <option value="mushrooms">ГРИБЫ</option>
                        </select>
                    </div> -->
                    <form action="" method="post" id="form-selection">
                        <input type="text" placeholder="ВКЛЮЧИТЬ ИНГРЕДИЕНТ" name="text-include-ingredient" id="text-include-ingredient">
                        <input type="text" placeholder="ИСКЛЮЧИТЬ ИНГРЕДИЕНТ" name="text-exclude-ingredient" id="text-exclude-ingredient">
                        <input type="button" value="ПОДБОР" name="selection" id="selection">
                    </form>
                </div>
                    <form action="" id="search">
                        <input type="text" placeholder="ПОИСК" name="text-search" id="text-search">
                        <input type="button" value="ПОИСК" id="btn-search">
                    </form>
                <ul id="container-search__sort-items">
                    <li class="sort-item">
                        <a href="#">ПО ПОПУЛЯРНОСТИ</a>
                    </li>
                    <li class="sort-item">
                        <a href="#">ПО ВРЕМЕНИ ПРИГОТОВЛЕНИЯ</a>
                    </li>
                    <li class="sort-item">
                        <a href="#">ПО КАЛОРИЙНОСТИ</a>
                    </li>
                    <!-- <li class="sort-item">
                        <a href="#">ДАТЕ ДОБАВЛЕНИЕ</a>
                    </li> -->
                </ul>
            </div>
            <!-- list c рецептами -->
            <div id="recipes-list">
                
            </div>
        </div>
    </main>
    <?php require "footer.html"?>
    <script src="includes/js/loadRecipes.js"></script>
</body>
</html>