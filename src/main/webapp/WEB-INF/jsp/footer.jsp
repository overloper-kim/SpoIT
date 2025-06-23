<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
    <div class="footer-menu">
        <ul>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <li><a href="/user/logout">로그아웃</a></li>
                    <li><a href="/user/myReservations">마이페이지</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/user/login">로그인</a></li>
                    <li><a href="/user/signin">회원가입</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    한국공학대학교 양로원 팀<br>
    15073 경기도 시흥시 산기대학로 237 (정왕동) 한국공학대학교<br>
    TEL : 031-8041-1000
</footer> 