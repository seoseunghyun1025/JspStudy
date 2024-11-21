<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	String check = (String)session.getAttribute("check");
	String cp = request.getContextPath();
	request.setCharacterEncoding("utf-8");
	//저장 실패, 변경, 비밀번호를 찾을 수 없음 
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/changePassword.css">
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
</head>
<body>

<form action="Change.do" method="post">
			<input type="password" name="passwd" placeholder="현재 비밀번호를 입력하시오.">
			<input type="password" name="newpasswd" placeholder="새 비밀번호를 입력하시오.">
			<input type="password" name="passwdChecked" placeholder="다시 한번 비밀번호를 입력하시오.">
			<input type="submit" value="select">
			<input type="reset" value="reset">
<% if(check != null){ if(check.equals("변경")){%>
<a href="javascript:closeAndReload();">사용하기!</a>
		<script>
			function closeAndReload() {
   				// 부모 창의 폼에 아이디를 입력하고 창을 닫음
    			window.opener.location.reload();  // 부모 창 새로고침
    			window.close();
			}
		</script>

<%}}else{ }%>
		</form>
</body>
</html>