// выбор категории
let lastClicked = null;

function changeColor(event) {
    event.preventDefault(); 
    const target = event.target;

    if (lastClicked && lastClicked !== target) {
        lastClicked.style.background = "#fff";
        lastClicked.style.color = "#4d636a";
    }

    if (lastClicked === target) {
        target.style.background = "#fff";
        target.style.color = "#4d636a";
        lastClicked = null; 
    } else {
        target.style.background = "#b7c3c7";
        target.style.color = "#fff";
        lastClicked = target;
    }
}

// изменение цвета при выборе способа сортировки 
const sortItems = document.querySelectorAll('#container-search__sort-items li');
let currentlySelectedButton = null; 

function highlightSelected(selectedButton) {
  
  sortItems.forEach(item => {
    const button = item.querySelector('button');
    if (button !== selectedButton) {
      button.style.color = '#9aa5a8';
      const icon = button.querySelector('.sort-icon');
      icon.classList.remove('sort-icon-reversed');
    }
  });

  selectedButton.style.color = '#000';
  const icon = selectedButton.querySelector('.sort-icon');

  if (selectedButton === currentlySelectedButton) {
    icon.classList.toggle('sort-icon-reversed');
  } else {
    icon.classList.remove('sort-icon-reversed');
    currentlySelectedButton = selectedButton; 
  }
}

sortItems.forEach(item => {
  const button = item.querySelector('button');
  button.addEventListener('click', () => highlightSelected(button));
});

highlightSelected(sortItems[0].querySelector('button'));

// сброс сортировки на "подбор" и "отменить"
const selectionButton = document.getElementById('selection');
const cancelSelectionButton = document.getElementById('cancel-selection');
const firstSortItem = sortItems[0].querySelector('button');


selectionButton.addEventListener('click', () => {
  highlightSelected(firstSortItem);
});

cancelSelectionButton.addEventListener('click', () => {
  sortItems.forEach(item => {
    const button = item.querySelector('button');
    button.style.color = '#9aa5a8';
    const icon = button.querySelector('.sort-icon');
    icon.classList.remove('sort-icon-reversed');
  });
  currentlySelectedButton = null;
  highlightSelected(firstSortItem); 
});

// добавление в избранное
const heartsContainers = document.querySelectorAll('.hearts');

heartsContainers.forEach(container => {
  container.addEventListener('click', (event) => {
    const button = event.target.closest('button'); 

    if (button) { 
      const heartLines = container.querySelector('.svg-heart-lines');
      const heartFill = container.querySelector('.svg-heart-fill');

      heartLines.style.display = heartLines.style.display === 'none' ? 'block' : 'none';
      heartFill.style.display = heartFill.style.display === 'none' ? 'block' : 'none';
    }
  });
});