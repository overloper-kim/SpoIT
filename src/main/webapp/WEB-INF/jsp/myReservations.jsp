<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 예매 내역</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="myReservations.css">
    <style>
        .reservations-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 50px 0px;
        }
    </style>
</head>
<body>
    <div class="reservations-container">
        <h1 class="reservations-title">나의 예매 내역</h1>
        <c:if test="${not empty reservList}">
            <table class="reservations-table" border="1" style="width:70%;text-align:center;">
                <thead>
                    <tr>
                        <th>예매번호</th>
                        <th>경기ID</th>
                        <th>좌석번호</th>
                        <th>예매일시</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${reservList}">
                        <tr>
                            <td>${r.uReservId}</td>
                            <td>${r.gameId}</td>
                            <td>${r.seatNumber}</td>
                            <td><fmt:formatDate value="${r.reservDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${r.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty reservList}">
            <p>예매 내역이 없습니다.</p>
        </c:if>
        <br/>
        <a href="/" class="cancel-btn">메인으로</a>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html> 