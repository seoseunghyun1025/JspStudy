<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*, com.java.bean.*"%>
<%
   ArrayList<RegisterDTO> alist = (ArrayList<RegisterDTO>)session.getAttribute("userList");
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>admin page</title>
    <link rel="stylesheet" type="text/css" href="css/manager.css">
</head>
    <script>
  function toggleDropdown() {
    var dropdown = document.getElementById("profileMenu");
    dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
  }
</script>
<link rel="stylesheet" type="text/css" href="css/header.css">
<jsp:include page="app/AdminHeader.jsp"/>
<body>
<br>
<div id="Manager_table">
<div id="Manager_main">
<h1>회원 정보 관리</h1><br>
<%
	String result = (String)session.getAttribute("result");
	if (result != null) {if(result.equals("success")){
%>
<table border="1" >
   <tr>
      <td>삭제</td>
      <td>아이디</td>
      <td>이메일</td>
      <td>이름</td>
      <td>전화번호</td>
      <td>포인트</td>
      <td>계좌번호</td>
   </tr>
   <%
   for(int i=0; i<alist.size(); i++){
      RegisterDTO mb = (RegisterDTO)alist.get(i);
      System.out.println(alist.size());
      if(mb.getMemberid().equals("admin")){
         continue;
      }
   %>
   <tr>
	<td>
		<form action="Delete.do" method="post">
		<input type="hidden" name="delete" value="<%=mb.getMemberid()%>">
			<input class = "delete" type="submit" value="삭제">
		</form>
	</td>
   <td><%=mb.getMemberid()%></td>
   <td><%=mb.getEmail()%></td>
   <td><%=mb.getName()%></td>
   <td><%=mb.getNumber()%></td>
   <td><%=mb.getPoint()%></td>
   <td><%=mb.getAccount()%></td>
   </tr>
   <% } %>
</table >
<%} }%>
<br>
<form action="Insert.do" method="post">
      <input class="manager" type="submit" value="select">
   </form>
   </div></div>
<jsp:include page="app/footer.jsp"/>
</body>
</html>