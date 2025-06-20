// 배너 슬라이드 기능
document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.slide');
    const indicators = document.querySelectorAll('.indicator');
    const prevBtn = document.querySelector('.banner-prev');
    const nextBtn = document.querySelector('.banner-next');
    const indicatorNumber = document.querySelector('.banner-indicator-number');
    let currentSlide = 0;
    let slideInterval;

    // 슬라이드 전환 함수
    function goToSlide(n) {
        slides[currentSlide].classList.remove('active');
        indicators[currentSlide].classList.remove('active');
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
        indicators[currentSlide].classList.add('active');
        indicatorNumber.textContent = `${currentSlide + 1} / ${slides.length}`;
    }

    // 다음 슬라이드로 이동
    function nextSlide() {
        goToSlide(currentSlide + 1);
    }

    // 이전 슬라이드로 이동
    function prevSlide() {
        goToSlide(currentSlide - 1);
    }

    // 자동 슬라이드 시작
    function startSlideInterval() {
        clearInterval(slideInterval);
        slideInterval = setInterval(nextSlide, 5000); // 5초마다 슬라이드 전환
    }

    // 자동 슬라이드 정지
    function stopSlideInterval() {
        clearInterval(slideInterval);
    }

    // 이벤트 리스너 설정
    prevBtn.addEventListener('click', () => {
        stopSlideInterval();
        prevSlide();
        startSlideInterval();
    });

    nextBtn.addEventListener('click', () => {
        stopSlideInterval();
        nextSlide();
        startSlideInterval();
    });

    indicators.forEach((indicator, index) => {
        indicator.addEventListener('click', () => {
            stopSlideInterval();
            goToSlide(index);
            startSlideInterval();
        });
    });

    // 마우스가 배너 위에 있을 때 자동 슬라이드 정지
    const banner = document.querySelector('.banner');
    banner.addEventListener('mouseenter', stopSlideInterval);
    banner.addEventListener('mouseleave', startSlideInterval);

    // 자동 슬라이드 시작
    startSlideInterval();
});