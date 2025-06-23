<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script src="/js/deleteUser.js"></script>
    <script src="/script.js" defer></script>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        form { max-width: 400px; }
        input { width: 100%; padding: 8px; margin: 5px 0; }
        button { background: #ff4444; color: white; padding: 10px 20px; border: none; cursor: pointer; }
        .error { color: red; }
    </style>
</head>
<body>
    <h2>회원 탈퇴</h2>
    <form action="/user/delete" method="post">
        <input type="text" name="userID" placeholder="아이디 입력" required>
        <input type="password" name="password" placeholder="비밀번호 입력" required>
        <button type="submit">회원탈퇴</button>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
    </form>
    <p><a href="/">홈으로 돌아가기</a></p>
    <%@ include file="footer.jsp" %>
</body>
</html>