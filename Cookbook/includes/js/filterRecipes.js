document.addEventListener("DOMContentLoaded", () => {
    const btnSearch = document.getElementById("btn-search");
    const btnSelection = document.getElementById("selection");
    const btnCancelSelection = document.getElementById("cancel-selection");
    const recipesList = document.getElementById("recipes-list");
    const categoryItems = document.querySelectorAll(".categories-item");
    const cookingMethodSelect = document.getElementById("cookin-method-select");
    const textIngredient = document.getElementById("text-ingredient");
    const sortButtons = document.querySelectorAll(".sort-button");
    let selectedCategory = null;
    let currentSort = { field: "relevance", direction: "ASC" }; // Начальные значения сортировки

    // Обработчик для категорий
    categoryItems.forEach(item => {
        item.addEventListener("click", (event) => {
            event.preventDefault();
            selectedCategory = event.target.innerText;
            categoryItems.forEach(el => el.classList.remove("active")); // Удаляем активный класс
            event.target.classList.add("active"); 
        });
    });
    
    function loadRecipes(params = {}) {
        fetch("includes/functions/filter_recipes.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(params),
        })
            .then((response) => response.text())
            .then((html) => {
                recipesList.innerHTML = html;
            })
            .catch((error) => console.error("Ошибка загрузки рецептов:", error));
    }

    function getFilterParams() {
        const searchQuery = document.getElementById("text-search").value.trim();
        const cookingMethod = cookingMethodSelect.value;
        const cookingIngredient = textIngredient.value.trim();

        return {
            search: searchQuery,
            category: selectedCategory,
            method: cookingMethod !== "cookingmethod" ? cookingMethod : null,
            ingredient: cookingIngredient !== "" ? cookingIngredient : null,
            order_by: currentSort.field,
            sort_direction: currentSort.direction,
        };
    }

    sortButtons.forEach((button) => {
        button.addEventListener("click", () => {
            const sortField = button.getAttribute("data-sort");

            // Если нажимается та же кнопка, меняем направление сортировки
            if (currentSort.field === sortField) {
                currentSort.direction = currentSort.direction === "ASC" ? "DESC" : "ASC";
            } else {
                currentSort.field = sortField;
                currentSort.direction = "ASC";
            }

            // Обновляем активный стиль для кнопки
            sortButtons.forEach((btn) => btn.classList.remove("active"));
            button.classList.add("active");

            // Загружаем рецепты с новым параметром сортировки
            loadRecipes(getFilterParams());
        });
    });

    btnSearch.addEventListener("click", () => {
        loadRecipes(getFilterParams());
    });

    btnSelection.addEventListener("click", () => {
        loadRecipes(getFilterParams());
    });

    btnCancelSelection.addEventListener("click", () => {
        cookingMethodSelect.value = "cookingmethod"; 
        textIngredient.value = ""; 
        selectedCategory = null; 
        
        categoryItems.forEach(item => item.classList.remove("selected-category"));
        
        // Сбрасываем сортировку
        loadRecipes({
            order_by: 'relevance', // Возвращаем сортировку по умолчанию
            sort_direction: 'ASC' // По возрастанию
        });
    });
});
