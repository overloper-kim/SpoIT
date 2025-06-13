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

// 서브메뉴 기능
document.addEventListener('DOMContentLoaded', function() {
    const sportsMenus = document.querySelectorAll('.sports-menu');
    
    sportsMenus.forEach(menu => {
        menu.addEventListener('click', function(e) {
            e.preventDefault();
            
            // 다른 모든 서브메뉴 닫기
            document.querySelectorAll('.sub-menu.active').forEach(submenu => {
                if (submenu !== this.nextElementSibling) {
                    submenu.classList.remove('active');
                }
            });
            
            // 클릭한 메뉴의 서브메뉴 토글
            const submenu = this.nextElementSibling;
            submenu.classList.toggle('active');
            
            // 메뉴 활성화 상태 토글
            this.classList.toggle('active');
        });
    });
    
    // 서브메뉴 외부 클릭 시 닫기
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.has-submenu')) {
            document.querySelectorAll('.sub-menu.active').forEach(submenu => {
                submenu.classList.remove('active');
            });
            document.querySelectorAll('.sports-menu.active').forEach(menu => {
                menu.classList.remove('active');
            });
        }
    });
}); 