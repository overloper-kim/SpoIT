<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script src="/script.js" defer></script>
</head>
<body>
    <div class="logo-container">
        <img src="/img/SpoIT_logo.png" alt="SpoIT Logo">
    </div>
    <div id="logform">
        <% 
        String error = (String)request.getAttribute("error");
        if(error != null) { 
        %>
            <div style="color: red; margin-bottom: 10px;">
                <%= error %>
            </div>
        <% } %>
        <form action="/user/login" method="post">
            <label>ID</label><br>
            <input type="text" name="userID" required><br>
            <label>Password</label><br>
            <input type="password" name="userPassword" required><br>
            <hr>
            <button type="submit">로그인</button>
        </form>
        <div style="margin-top: 10px;">
            <a href="/user/signin">회원가입</a>
        </div>
        <div style="margin-top: 10px;">
            <a href="/user/delete">회원탈퇴</a>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html> 