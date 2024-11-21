<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.java.bean.MyUtil"%>
<%@page import="com.java.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.java.bean.BoardDAO"%>
<%@page import="com.java.bean.JDBCutil"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String cp = request.getContextPath();
ArrayList<BoardDTO> aList = (ArrayList<BoardDTO>)session.getAttribute("titleList");

String login = (String)session.getAttribute("login");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/list.css"/>
<body>
   </tr>
<%if(login != null){if(login.equals("success")){%>
<jsp:include page="/app/header.jsp" />
   <script>
    function submitForm(num) {
        document.getElementById('selectedNum').value = num;
        document.getElementById('myForm').submit();
    }
</script>
<div class="main_all">
<div id="user">
<div id="search">
      <form action="MemberList.do" method="post">
         <input type="text" name="keyword">
         <input type="submit" value="검색"  id="button1"><br>
         <a href="created.jsp" id="write">글 작성하기</a>
      </form>
   </div>
<table border="1" >
   <tr>
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>날짜</td>
      <td>조회수</td>
   <%
   for(int i=0; i<aList.size(); i++){
      BoardDTO mb = (BoardDTO)aList.get(i);
   %>
   <tr onclick="submitForm('<%=mb.getNum()%>')">
   <td><%=mb.getNum()%></td>
   <td><%=mb.getTitle()%></td>
   <td><%=mb.getName()%></td>
   <td><%=mb.getDate()%></td>
   <td><%=mb.getCount()%></td>
   </tr>
   <% } %>
<form id="myForm" action="BoardSelect.do" method="post">
    <input type="hidden" name="selectedNum" id="selectedNum" value="">
</form>
</div></div>   
<!-- 관리자 -->   
<% }else if(login.equals("admin")){%>
<jsp:include page="/app/AdminHeader.jsp"/>
<form id="myForm" action="BoardSelect.do" method="post">
    <input type="hidden" name="selectedNum" id="selectedNum" value="">
</form>
   <script>
    function submitForm(num) {
        document.getElementById('selectedNum').value = num;
        document.getElementById('myForm').submit();
    }
</script>
<div class="main_all">
<div id="admin">
   <div id="search">
   <h2>작성자 검색</h2>
      <form action="MemberList.do" method="post">
         <input type="text" name="keyword">
         <input id="button1" type="submit" value="검색">
      </form>
   </div>
   <table border="1" >
   <tr>
        <td>삭제</td>
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>날짜</td>
      <td>조회수</td>
        </tr>
   <%
   for(int i=0; i<aList.size(); i++){
      BoardDTO mb = (BoardDTO)aList.get(i);
   %>
   <tr onclick="submitForm('<%=mb.getNum()%>')">
   <td>
      <form action="BoardDelete.do" method="post">
      <input type="hidden" name="delete" value="<%=mb.getNum()%>">
         <input id="button2" type="submit" value="삭제">
      </form>
   </td>
   <td><%=mb.getNum()%></td>
   <td><%=mb.getTitle()%></td>
   <td><%=mb.getName()%></td>
   <td><%=mb.getDate()%></td>
   <td><%=mb.getCount()%></td>
   </tr>
   <% } %>
<%}}else{ %>
</div></div>
<jsp:include page="/app/Unheader.jsp" />
<div class="main_all">
<div id="un">
   <table border="1" >
   <tr>
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>날짜</td>
      <td>조회수</td>
      </tr>
 <%  for(int i=0; i<aList.size(); i++){
      BoardDTO mb = (BoardDTO)aList.get(i);
   %>
   <tr>
   <td><%=mb.getNum()%></td>
   <td><%=mb.getTitle()%></td>
   <td><%=mb.getName()%></td>
   <td><%=mb.getDate()%></td>
   <td><%=mb.getCount()%></td>
   </tr>
   <% } %>
<% } %>
</table >
</div></div>
<jsp:include page="app/footer.jsp"/>
</body>
</html>