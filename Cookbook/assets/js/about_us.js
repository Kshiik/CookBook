var velocity = 0.3;

function update() {
    var pos = window.scrollY;
    var bgImg = document.querySelector('.bg-img');
    if (bgImg) {
        var yPos = Math.round(-pos * velocity);
        bgImg.style.backgroundPosition = `-50% ${50 + yPos}px`;
    }
}

window.addEventListener('scroll', update);