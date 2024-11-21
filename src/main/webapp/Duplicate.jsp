<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="css/Duplicate.css">
<h1>중복 확인</h1>
	<%
	request.setCharacterEncoding("utf-8");
    	String duplicate = (String)session.getAttribute("duplie");
	String 아이디 = (String)session.getAttribute("아이디");
     if(duplicate != null){ if(duplicate.equals("계정이 있습니다 다시 시도해주세요")){
    %>
	<form action="Dupli.do" method="post">
    	<input type="text" name="id" placeholder="아이디를 입력하시오."oninput="validateInput(this)">
    	<input type="submit" value="select">
    	<input type="reset" value="reset">
	</form>
	<script>
	function validateInput(input) {
	    // 입력된 값이 알파벳과 숫자로만 구성되어 있는지 확인
	    var regex = /^[a-zA-Z0-9]*$/;
	    if (!regex.test(input.value)) {
	        alert("영어와 숫자만 입력 가능합니다.");
	        input.value = ""; // 입력된 값을 비움
	    }
	}

function openDuplicateWindow() {
    window.open('Duplicate.jsp', '중복 확인', 'width=400,height=300');
}
</script>
	<h3 style="color:red;"><%= duplicate%></h3>
	<%}else if(duplicate.equals("계정이 없습니다!")){%>
		<form action="Dupli.do" method="post">
			<input type="text" name="id" placeholder="아이디를 입력하시오."oninput="validateInput(this)">
			<input type="submit" value="select">
			<input type="reset" value="reset">
		</form>
		<h3 style="color:red;"><%= duplicate%></h3>
		<a href="javascript:closeAndReload();">사용하기!</a>
		<script>
			function closeAndReload() {
   				// 부모 창의 폼에 아이디를 입력하고 창을 닫음
    			window.opener.document.getElementById("idInput").value = '<%= request.getParameter("id") %>';
    			window.opener.location.reload();  // 부모 창 새로고침
    			window.close();
			}
		</script>
		<script>
function validateInput(input) {
    // 입력된 값이 영어로만 구성되어 있는지 확인
    var regex = /^[a-zA-Z]*$/;
    if (!regex.test(input.value)) {
        alert("영어만 입력 가능합니다.");
        input.value = ""; // 입력된 값을 비움
    }
}

function openDuplicateWindow() {
    window.open('Duplicate.jsp', '중복 확인', 'width=400,height=300');
}
</script>
	<%}}else{%>
		<form action="Dupli.do" method="post">
			<input type="text" name="id" placeholder="아이디를 입력하시오."oninput="validateInput(this)">
			<input type="submit" value="select">
			<input type="reset" value="reset">
		</form>
		<script>
function validateInput(input) {
    // 입력된 값이 영어로만 구성되어 있는지 확인
    var regex = /^[a-zA-Z]*$/;
    if (!regex.test(input.value)) {
        alert("영어만 입력 가능합니다.");
        input.value = ""; // 입력된 값을 비움
    }
}

function openDuplicateWindow() {
    window.open('Duplicate.jsp', '중복 확인', 'width=400,height=300');
}
</script>
		
	<%} %>	
</body>
</html>
