// Получаем элементы
const arrow1 = document.getElementById('arrow2');
const arrow2 = document.getElementById('arrow1');
const userDataContainer = document.getElementById('user-data-container');
const userSaveRecipes = document.getElementById('user-save-recipes');

// Функция для перемещения блоков при нажатии на стрелку
arrow1.addEventListener('click', () => {
    // Перемещаем блок с рецептами влево (при открытии личных данных)
    userSaveRecipes.style.transform = 'translateX(0)';
    // Перемещаем блок с личными данными вправо
    userDataContainer.style.transform = 'translateX(100%)';
});

arrow2.addEventListener('click', () => {
    // Перемещаем блок с рецептами вправо (при открытии данных пользователя)
    userSaveRecipes.style.transform = 'translateX(-100%)';
    // Перемещаем блок с личными данными влево
    userDataContainer.style.transform = 'translateX(0)';
});