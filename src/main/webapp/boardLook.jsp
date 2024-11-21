<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.java.bean.MyUtil"%>
<%@page import="com.java.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.java.bean.BoardDAO"%>
<%@page import="com.java.bean.JDBCutil"%>
<%@page import="java.sql.Connection"%>
<%
   String cp = request.getContextPath();
   ArrayList<BoardDTO> selectList = (ArrayList<BoardDTO>)session.getAttribute("selectList");
   String result = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/boardLook.css">
<title>게시판</title>
</head>
<body>
<%
   if(result != null){if(result.equals("success")){
%>
  <jsp:include page="app/header.jsp" />
  <%}else if(result.equals("admin")){ %>
  <jsp:include page="app/AdminHeader.jsp"/>
  <%}}else{ %>
  <jsp:include page="app/Unheader.jsp"/>
  <%}%>
<%
      BoardDTO mb = (BoardDTO)selectList.get(0);
   %>
   <form class="go" action="Board.do" method="post">
             <input class="look" type="submit" value="목록가기">
          </form>
   <table border="1" >
   <tr>
      <td>제목</td> 
      <td><%=mb.getTitle()%></td>
   </tr>
        <tr>
      <td>작성자</td>
      <td><%=mb.getName()%></td>
        </tr>
        <tr>
      <td>작성일</td>
       <td><%=mb.getDate()%></td>
      </tr>
      <tr>
      <td>내용</td>
      <td><%=mb.getArea()%></td>
      </tr>
      <tr>
      <td>조회수</td>
       <td><%=mb.getCount()%></td>
      </tr>
</table>

<jsp:include page="app/footer.jsp"/>
</body>
</html>