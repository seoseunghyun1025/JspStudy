<%@page import="com.java.bean.RegisterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>

<%
   ArrayList<RegisterDTO> alist = (ArrayList<RegisterDTO>)session.getAttribute("profile");
%>
<% String cp = request.getContextPath();
	String id = (String)session.getAttribute("id");
	request.setCharacterEncoding("utf-8");
%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/Profile.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보</title>
</head>
<body>
<jsp:include page="app/header.jsp"/>
<%
   if (alist != null && !alist.isEmpty()) {
       RegisterDTO mb = (RegisterDTO)alist.get(0);
       String email = mb.getEmail();
       String name = mb.getName();
       String number = mb.getNumber();
       if(email == null || name == null || number == null){
    	   email = ""; name = ""; number = "";
       }
%>
<div id="Profile_table">
<div id="Profile_main">
<table border="1" >
   <tr>
      <td>아이디</td> 
      <td><%=mb.getMemberid()%></td>
   </tr>
   	  <tr>
      <td>이메일</td>
      <td><%=email%></td>
   	  </tr>
   	  <tr>
      <td>이름</td>
       <td><%=name%></td>
      </tr>
      <tr>
      <td>전화번호</td>
      <td><%=number%></td>
      </tr>
      <tr>
      <td>포인트</td>
       <td><%=mb.getPoint()%></td>
      </tr>
      <tr>
      <td>계좌번호</td>
      <td><%=mb.getAccount()%></td>
	  </tr>
<%
   }
%>
</table>
<form action="Select.do" method="post">
	<input type="hidden" name="id" value="<%=id%>"> 
    <input class="profile" type="submit" value="select">
    <button class="profile" type="button"onclick="openDuplicateWindow()">비밀번호 변경</button>
</form>
</div></div>
<script>
        function openDuplicateWindow() {
            window.open('ChangePassword.jsp', '중복 확인', 'width=400,height=300');
        }
    </script>
<jsp:include page="app/footer.jsp"/>
</body>
</html>