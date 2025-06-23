<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>경기 목록</title>
    <link rel="stylesheet" href="/style.css" />
    <script src="/script.js" defer></script>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; }
        .header { background: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .header h1 { margin: 0; color: #333; }
        .nav { margin-top: 15px; }
        .nav a { margin-right: 15px; text-decoration: none; color: #007bff; }
        .nav a:hover { text-decoration: underline; }
        .game-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; }
        .game-card { background: white; border-radius: 8px; padding: 20px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); transition: transform 0.2s; }
        .game-card:hover { transform: translateY(-2px); box-shadow: 0 4px 8px rgba(0,0,0,0.15); }
        .teams { font-size: 18px; font-weight: bold; margin-bottom: 10px; color: #333; }
        .info { color: #666; margin-bottom: 8px; }
        .price { color: #e74c3c; font-weight: bold; font-size: 16px; }
        .btn { background: #007bff; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; display: inline-block; margin-top: 10px; }
        .btn:hover { background: #0056b3; }
        .error { color: red; background: #ffe6e6; padding: 10px; border-radius: 4px; margin-bottom: 20px; }
        .sport-filter { margin-bottom: 20px; }
        .sport-filter a { margin-right: 10px; padding: 8px 16px; text-decoration: none; background: #f8f9fa; color: #333; border-radius: 4px; }
        .sport-filter a.active { background: #007bff; color: white; }
    </style>
</head>
<body>
    <div class="container"> 
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <div class="sport-filter">
            <a href="/games" class="${empty sportType ? 'active' : ''}">전체</a>
            <a href="/games/sport?type=baseball" class="${sportType == 'baseball' ? 'active' : ''}">야구</a>
            <a href="/games/sport?type=soccer" class="${sportType == 'soccer' ? 'active' : ''}">축구</a>
            <a href="/games/sport?type=basketball" class="${sportType == 'basketball' ? 'active' : ''}">농구</a>
        </div>

        <div class="game-grid">
            <c:forEach var="game" items="${games}">
                <div class="game-card">
                    <div class="teams">${game.team1} vs ${game.team2}</div>
                    <div class="info">종목: ${game.sportType}</div>
                    <div class="info">경기장: ${game.stadium}</div>
                    <div class="info">경기일: <fmt:formatDate value="${game.matchDate}" pattern="yyyy-MM-dd HH:mm"/></div>
                    <div class="price">₩${game.price}원</div>
                    <a href="/games/${game.gameId}" class="btn">상세보기</a>
                </div>
            </c:forEach>
        </div>

        <c:if test="${empty games}">
            <div style="text-align: center; padding: 40px; color: #666;">
                등록된 경기가 없습니다.
            </div>
        </c:if>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html> 