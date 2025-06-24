<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>경기 상세</title>
    <link rel="stylesheet" href="/style.css" />
    <script src="/script.js" defer></script>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { background: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .header h1 { margin: 0; color: #333; }
        .nav { margin-top: 15px; }
        .nav a { margin-right: 15px; text-decoration: none; color: #007bff; }
        .nav a:hover { text-decoration: underline; }
        .game-detail { background: white; border-radius: 8px; padding: 30px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .teams { font-size: 24px; font-weight: bold; margin-bottom: 20px; color: #333; text-align: center; }
        .info-row { display: flex; margin-bottom: 15px; border-bottom: 1px solid #eee; padding-bottom: 10px; }
        .info-label { width: 120px; font-weight: bold; color: #666; }
        .info-value { flex: 1; color: #333; }
        .price { color: #e74c3c; font-weight: bold; font-size: 20px; }
        .btn { background: #007bff; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; display: inline-block; margin-top: 20px; }
        .btn:hover { background: #0056b3; }
        .btn.danger { background: #dc3545; }
        .btn.danger:hover { background: #c82333; }
        .actions { text-align: center; margin-top: 30px; }
        .error { color: red; background: #ffe6e6; padding: 10px; border-radius: 4px; margin-bottom: 20px; }
        .seat-container {
            max-width: 400px;
            margin: 40px auto;
            padding: 24px 32px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            text-align: center;
        }
        .seat-map {
            margin: 24px 0;
        }
        .seat-row {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }
        .seat {
            display: inline-block;
            margin: 0 8px;
            padding: 0;
            font-size: 16px;
            cursor: pointer;
            position: relative;
        }
        .seat input[type="radio"] {
            display: none;
        }
        .seat input[type="radio"] + span,
        .seat input[type="radio"] + label {
            pointer-events: none;
        }
        .seat input[type="radio"]:checked + span,
        .seat input[type="radio"]:checked + label {
            font-weight: bold;
            color: #fff;
            background: #007bff;
            border-radius: 6px;
        }
        .seat label, .seat {
            background: #f2f2f2;
            border-radius: 6px;
            padding: 10px 16px;
            margin: 0 4px;
            transition: background 0.2s, color 0.2s;
            border: 1px solid #ddd;
        }
        .seat input[type="radio"]:checked + label, .seat input[type="radio"]:checked + span {
            background: #007bff;
            color: #fff;
            border: 1.5px solid #0056b3;
        }
        .reserve-btn {
            margin-top: 20px;
            padding: 10px 32px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.2s;
        }
        .reserve-btn:hover {
            background: #0056b3;
        } 
    </style>
</head>
<body>
    <div class="container">
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <div class="game-detail">
            <div class="teams">${game.team1} vs ${game.team2}</div>
            
            <div class="info-row">
                <div class="info-label">종목:</div>
                <div class="info-value">${game.sportType}</div>
            </div>
            
            <div class="info-row">
                <div class="info-label">경기장:</div>
                <div class="info-value">${game.stadium}</div>
            </div>
            
            <div class="info-row">
                <div class="info-label">경기일:</div>
                <div class="info-value"><fmt:formatDate value="${game.matchDate}" pattern="yyyy년 MM월 dd일 HH:mm"/></div>
            </div>
            
            <div class="info-row">
                <div class="info-label">티켓 가격:</div>
                <div class="info-value price">₩${game.price}원</div>
            </div>

            <div class="seat-map">
                <!-- 5x5 좌석 배치 예시 -->
                <div class="seat-row">
                    <label class="seat"><input type="radio" name="seat" value="A1">A1</label>
                    <label class="seat"><input type="radio" name="seat" value="A2">A2</label>
                    <label class="seat"><input type="radio" name="seat" value="A3">A3</label>
                    <label class="seat"><input type="radio" name="seat" value="A4">A4</label>
                    <label class="seat"><input type="radio" name="seat" value="A5">A5</label>
                </div>
                <div class="seat-row">
                    <label class="seat"><input type="radio" name="seat" value="B1">B1</label>
                    <label class="seat"><input type="radio" name="seat" value="B2">B2</label>
                    <label class="seat"><input type="radio" name="seat" value="B3">B3</label>
                    <label class="seat"><input type="radio" name="seat" value="B4">B4</label>
                    <label class="seat"><input type="radio" name="seat" value="B5">B5</label>
                </div>
                <div class="seat-row">
                    <label class="seat"><input type="radio" name="seat" value="C1">C1</label>
                    <label class="seat"><input type="radio" name="seat" value="C2">C2</label>
                    <label class="seat"><input type="radio" name="seat" value="C3">C3</label>
                    <label class="seat"><input type="radio" name="seat" value="C4">C4</label>
                    <label class="seat"><input type="radio" name="seat" value="C5">C5</label>
                </div>
                <div class="seat-row">
                    <label class="seat"><input type="radio" name="seat" value="D1">D1</label>
                    <label class="seat"><input type="radio" name="seat" value="D2">D2</label>
                    <label class="seat"><input type="radio" name="seat" value="D3">D3</label>
                    <label class="seat"><input type="radio" name="seat" value="D4">D4</label>
                    <label class="seat"><input type="radio" name="seat" value="D5">D5</label>
                </div>
                <div class="seat-row">
                    <label class="seat"><input type="radio" name="seat" value="E1">E1</label>
                    <label class="seat"><input type="radio" name="seat" value="E2">E2</label>
                    <label class="seat"><input type="radio" name="seat" value="E3">E3</label>
                    <label class="seat"><input type="radio" name="seat" value="E4">E4</label>
                    <label class="seat"><input type="radio" name="seat" value="E5">E5</label>
                </div>
            </div>
            
            <div class="actions">
                <c:if test="${empty sessionScope.user}">
                    <a href="/user/login" class="btn">로그인 후 예매하기</a>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <form method="post" action="/reservations/${game.gameId}">
                        <button type="submit" class="btn">예매하기</button>
                    </form>
                </c:if>
                <a href="/games" class="btn danger">목록으로 돌아가기</a>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html> 