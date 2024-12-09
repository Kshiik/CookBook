// вращение картинки 
window.onscroll = function () {
  scrollRotate();
};

function scrollRotate() {
  let image = document.getElementById("main-img");
  image.style.transform = "rotate(" + window.pageYOffset/-15 + "deg)";
}

//выделение категории пр наведении
const categoriesItems = document.querySelectorAll('.category-item');
const categoriesList = document.getElementById('categories-items');

categoriesItems.forEach(item => {
  item.addEventListener('mouseover', () => {
    categoriesItems.forEach(otherItem => {
      otherItem.style.opacity = otherItem === item ? 1 : 0.3;
    });
  });
});

categoriesList.addEventListener('mouseleave', () => {
  categoriesItems.forEach(item => {
    item.style.opacity = 1;
  });
});

// появление популярных блюд
function show() {
  const popularDishItems = document.querySelectorAll(".popular-dish-item");
  const windowHeight = window.innerHeight;

  popularDishItems.forEach((item) => {
      const elementTop = item.getBoundingClientRect().top;
      const offset = 150;

      if (elementTop < windowHeight - offset) {
          item.classList.add("active");
      } else {
          item.classList.remove("active");
      }
  });
}

window.addEventListener("scroll", show);
window.addEventListener("load", show);