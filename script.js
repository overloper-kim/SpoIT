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
////////////////////////////////////////////////////////////////////////////////////////////
    // 카테고리 버튼 클릭 시 경기 정보 변경 기능
    const categoryButtons = document.querySelectorAll('.category-item a');
    const gameList = document.querySelector('.game-list');

    // 각 종목별 경기 데이터 예시 나중에 json으로 받아오면 될 듯??
    const gameData = {
        baseball: [
            {
                team1: {
                    name: 'KIA',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '한화',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_6/Hanwha(new)(1).png'
                },
                datetime: '2025.06.06 (금) 17:00',
                location: 'KIA 챔피언스필드',
                reserveTime: '2025.05.30 (금) 11:00 오픈예정'
            },
            {
                team1: {
                    name: '삼성',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: 'LG',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.08 (일) 14:00',
                location: '대구삼성라이온즈파크',
                reserveTime: '2025.06.01 (일) 11:00 오픈예정'
            },
            {
                team1: {
                    name: 'SSG',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '두산',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.10 (화) 18:30',
                location: '인천SSG랜더스필드',
                reserveTime: '2025.06.03 (화) 11:00 오픈예정'
            }
        ],
        soccer: [
            {
                team1: {
                    name: 'FC서울',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '전북현대',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.07 (토) 19:00',
                location: '서울월드컵경기장',
                reserveTime: '2025.05.31 (토) 11:00 오픈예정'
            },
            {
                team1: {
                    name: '울산현대',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '포항스틸러스',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.09 (월) 20:00',
                location: '울산문수축구경기장',
                reserveTime: '2025.06.02 (월) 11:00 오픈예정'
            },
            {
                team1: {
                    name: '수원삼성',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '인천유나이티드',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.11 (수) 19:30',
                location: '수원월드컵경기장',
                reserveTime: '2025.06.04 (수) 11:00 오픈예정'
            }
        ],
        basketball: [
            {
                team1: {
                    name: '서울SK',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '서울삼성',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.07 (토) 17:00',
                location: '잠실실내체육관',
                reserveTime: '2025.05.31 (토) 11:00 오픈예정'
            },
            {
                team1: {
                    name: '부산KCC',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '울산현대모비스',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.09 (월) 19:00',
                location: '부산사직체육관',
                reserveTime: '2025.06.02 (월) 11:00 오픈예정'
            },
            {
                team1: {
                    name: '원주DB',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                team2: {
                    name: '안양KGC',
                    image: 'http://image.toast.com/aaaaab/ticketlink/TKL_8/Baseball_kia(1).png'
                },
                datetime: '2025.06.11 (수) 19:30',
                location: '원주체육관',
                reserveTime: '2025.06.04 (수) 11:00 오픈예정'
            }
        ]
    };

    // 경기 정보 업데이트 함수
    function updateGameList(sport) {
        const games = gameData[sport];
        gameList.innerHTML = '';

        games.forEach(game => {
            const gameCard = document.createElement('li');
            gameCard.className = 'game-card';
            gameCard.innerHTML = `
                <div class="teams">
                    <img src="${game.team1.image}" alt="${game.team1.name}" />
                    <span>vs</span>
                    <img src="${game.team2.image}" alt="${game.team2.name}" />
                </div>
                <div class="info">
                    <p class="datetime">${game.datetime}</p>
                    <p class="location">${game.location}</p>
                </div>
                <div class="reservation">
                    <span class="reserve-time">${game.reserveTime}</span>
                </div>
            `;
            gameList.appendChild(gameCard);
        });
    }

    // 카테고리 버튼 클릭 이벤트
    categoryButtons.forEach(button => {
        button.addEventListener('click', (e) => {
            e.preventDefault();
            
            // 모든 버튼에서 active 클래스 제거
            categoryButtons.forEach(btn => btn.classList.remove('active'));
            
            // 클릭된 버튼에 active 클래스 추가
            button.classList.add('active');
            
            // 버튼 텍스트에 따라 경기 정보 업데이트
            const sport = button.textContent.trim();
            if (sport === '야구') {
                updateGameList('baseball');
            } else if (sport === '축구') {
                updateGameList('soccer');
            } else if (sport === '농구') {
                updateGameList('basketball');
            }
        });
    });

    // 페이지 로드 시 기본으로 야구 데이터 표시
    updateGameList('baseball');
});