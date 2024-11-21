<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<%
String 아이디 = (String)session.getAttribute("아이디");
%>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    if(localStorage.getItem('키')){
    var lastData = localStorage.getItem('키')
   }
    </script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/signUp.css">
</head>

<body>
<header style="position: relative;">
   <img src="img/home.png" alt="Home" onclick="location.href='index.jsp';" width="100px" height="100px" style="position: absolute; bottom: 220px;">
</header>

<%if (아이디 != null){ %>
    <form action="Create.do" method="post">
        <input type="text" name="ID" id="idInput" value="<%=아이디 %>" placeholder="아이디">
        <button type="button"onclick="openDuplicateWindow()">중복 확인</button><br>
        <input type="password" name="passwd" placeholder="비밀번호"><br>
        <input type="password" name="passwdChecked" placeholder="비밀번호 확인"><br>
        <input type="text" name="email" placeholder="이메일"><br>
        <input type="text" name="name" placeholder="이름"><br>
        <input type="text" name="cnumber" placeholder="전화번호"><br>
        <input type="text" name="account" placeholder="계좌번호"><br>
        <button type="submit">회원가입</button>
        <a class="login" href="project.jsp">로그인</a> <!-- 수정: 회원가입 폼 안에 로그인 링크 추가 -->
    </form>
    <script>
        function openDuplicateWindow() {
            window.open('Duplicate.jsp', '중복 확인', 'width=400,height=300');
        }
    </script>
    <%}else{ %>
     <form action="Create.do" method="post">
        <input type="text" name="ID" id="idInput" placeholder="아이디">
        <button type="button"onclick="openDuplicateWindow()">중복 확인</button><br>
        <input type="password" name="passwd" placeholder="비밀번호"><br>
        <input type="password" name="passwdChecked" placeholder="비밀번호 확인"><br>
        <input type="text" name="email" placeholder="이메일"><br>
        <input type="text" name="name" placeholder="이름"><br>
        <input type="text" name="cnumber" placeholder="전화번호"><br>
        <input type="text" name="account" placeholder="계좌번호"><br>
        <button type="submit">회원가입</button>
        <a class="login" href="project.jsp">로그인</a> <!-- 수정: 회원가입 폼 안에 로그인 링크 추가 -->
    </form>
    <script>
        function openDuplicateWindow() {
            window.open('Duplicate.jsp', '중복 확인', 'width=400,height=300');
        }
    </script>
    <%} %>
</body>
</html>