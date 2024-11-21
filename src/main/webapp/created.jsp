<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%
   request.setCharacterEncoding("UTF-8");
   String board = (String)session.getAttribute("bResult");
   String result = (String)session.getAttribute("login");
   System.out.print(board);
   String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
         function closeAndReload() {
               // 부모 창의 폼에 아이디를 입력하고 창을 닫음
             window.opener.location.reload();  // 부모 창 새로고침
         }
      </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/created.css"/>
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
</head>
<body>
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
   <form action="BoardCreate.do" method="post">
    <table>
        <tr>
            <td>제목:</td>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <td>작성자:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>내용:</td>
            <td><textarea name="area" rows="10" cols="50"></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input class="up" type="submit" value="올리기">
                <input class="up"  type="reset" value="다시 작성">
                <a class="up" href="list.jsp">작성취소</a>
            </td>
        </tr>
    </table>
</form>
<br><br><br><br>
<jsp:include page="app/footer.jsp" />
</body>
</html>