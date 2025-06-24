<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpoIT</title>
    <link rel="stylesheet" href="style.css" />
    <script src="script.js" defer></script>
</head>

<body>

    <!--배너-->
    <section class="banner">
        <div class="slide active">
            <img src="https://image.toast.com/aaaaab/ticketlink/TKL_2/PC_Main_1920x560_.jpg" alt="배너1" />
        </div>
        <div class="slide">
            <img src="https://image.toast.com/aaaaab/ticketlink/TKL_9/PC_Main_1920x560.jpg" alt="배너2" />
        </div>
        <div class="slide">
            <img src="https://image.toast.com/aaaaab/ticketlink/TKL_6/BigBanner_pc_seat.jpg" alt="배너3" />
        </div>
        <!--인디케이터-->
        <div class="banner-indicators">
            <button class="indicator active" data-slide="0"></button>
            <button class="indicator" data-slide="1"></button>
            <button class="indicator" data-slide="2"></button>
        </div>
        <div class="banner-indicator-number">1 / 3</div>
        <button class="banner-prev">◀</button>
        <button class="banner-next">▶</button>
    </section>

    <!--메인-->
    <main>
        <div class="content-container">
            <!--예매오픈 제목-->
            <div class="ticket-open-title">
                <h2>예매오픈</h2>
            </div>

            <!--카테고리-->
            <div class="category">
                <ul class="category-list">
                    <li class="category-item">
                        <a href="src\main\webapp\WEB-INF\jsp\gameList.jsp" class="active">야구</a>
                    </li>
                    <li class="category-item">
                        <a href="src\main\webapp\WEB-INF\jsp\gameList.jsp">축구</a>
                    </li>
                    <li class="category-item">
                        <a href="src\main\webapp\WEB-INF\jsp\gameList.jsp">농구</a>
                    </li>
                </ul>
            </div>

            <!--경기 정보-->
            <section class="ticket-open">
                <ul class="game-list">
                    <!-- script.js const gameData 에서 데이터 받아오기 -->
                </ul>
            </section>
        </div>
    </main>

    <div class="ad-banner">
        <a href="https://www.tukorea.ac.kr/tukorea/index.do"><img src="https://tketlink.dn.toastoven.net/tl/banner/250519_ad_stanley/250519_MiddleLineBanner_Stanley.png" alt="광고" /></a>  
    </div>
    <footer class="footer">
        한국공학대학교 양로원 팀<br>
        15073 경기도 시흥시 산기대학로 237 (정왕동) 한국공학대학교<br>
        TEL : 031-8041-1000
    </footer>
</body>

</html>