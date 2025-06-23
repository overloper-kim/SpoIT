<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css" />
<header class="header">
    <div class="header-inner">
        <!-- 로고 영역 -->
        <h1 class="logo">
            <a href="/">SpoIT</a> <!--나중에 로고 만들어서 이미지로 교체해야징 까먹지않기-->
        </h1>

        <!-- 메인 메뉴 영역 -->
        <nav class="main-menu">
            <ul>
                <li><a href="#" class="active">홈</a></li>
                <li class="has-submenu">
                    <a href="#" class="sports-menu" data-sport="baseball">야구</a>
                    <ul class="sub-menu">
                        <li><a href="team.html?team=samsung">삼성</a></li>
                        <li><a href="team.html?team=ssg">SSG</a></li>
                        <li><a href="team.html?team=hanwha">한화</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="sports-menu" data-sport="soccer">축구</a>
                    <ul class="sub-menu">
                        <li><a href="team.html?team=seoul">서울</a></li>
                        <li><a href="team.html?team=jeonbuk">전북</a></li>
                        <li><a href="team.html?team=ulsan">울산</a></li>
                    </ul>
                </li>
                <li class="has-submenu">
                    <a href="#" class="sports-menu" data-sport="basketball">농구</a>
                    <ul class="sub-menu">
                        <li><a href="team.html?team=sk">SK</a></li>
                        <li><a href="team.html?team=lg">LG</a></li>
                        <li><a href="team.html?team=sono">소노</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- 오른쪽 영역 (로그인) -->
        <div class="header-right">
            <!-- 로그인 영역 -->
            <div class="login-area">
                <a href="/user/login" class="login-btn">로그인</a>
                <a href="/user/signin" class="join-btn">회원가입</a>
            </div>
        </div>
    </div>
</header>