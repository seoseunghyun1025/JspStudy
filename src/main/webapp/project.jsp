<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="<%=cp%>/css/project.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img src="<%=cp%>/img/back.png"></a>
    </header>
   
    <form action="login.do" method="post">
        <input type="text" name="ID" placeholder="아이디"><br>
        <input type="password" name="passwd" placeholder="비밀번호"><br>
        <input type="reset" value="정정">
        <input type="submit" value="로그인">  
        <div id="link-group">
		<a href="signUp.jsp">회원가입</a>    
    </div>  
    </form>
   <br>
   <br>
   <br>
   <br><br>
    <jsp:include page="app/footer.jsp"/>
</body>
</html>