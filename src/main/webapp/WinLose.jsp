<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%
request.setCharacterEncoding("UTF-8");
String login = (String)session.getAttribute("login");
String id = (String)session.getAttribute("id");
String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>승부예측</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/WinLose.css"/>
<script src="<%=cp%>/js/WinLose.js"></script>
</head>

<body>
<%if(login != null){ if(login.equals("success")){ %>
<jsp:include page="/app/header.jsp" />
<form action="Prediction.do" method="post">
<input type="hidden" name="id" value="<%= id%>">
<div id="main">
        <div id="main_bar">
          <input type="submit" value="투표하기" class="btn" onclick="success()">
    	<input type="reset" value="초기화" class="btn" onclick="resetButtons()">
            <ul>
                <li id="showvboo_1_bar">
        <div class="showvboo_1_bar_divide1">
            <input type="radio" name="team1" value="웨스트 햄" class="team1" onchange="changeBackgroundColor1('team1')">
            <img src="img/soccer/웨스트 햄.png" class="logo">
           <span class="day" >12.23 (토) </span><span class="text1" >웨스트 햄 </>
        </div>
        <div class="showvboo_1_bar_divide2">
            <input type="radio" name="team1" value="맨유" class="team2" onchange="changeBackgroundColor1('team2')">
            <img src="img/soccer/맨유.png" class="logo">
            <br><div class="text" >맨유</div>
        </div>
        </li>
              <li id="showvboo_2_bar">
                    <div class="showvboo_2_bar_divide1">
                    <input type="radio" name="team2" value="토트넘" class="team3" onclick="changeBackgroundColor2('team3')" >
                        <img src="img/soccer/토트넘.png" class="logo">
             <span class="day" >  12.24 (일) </span>  <div class="text1" >토트넘</div>
                    </div>
                    <div class="showvboo_2_bar_divide2">
                    <input type="radio" name="team2" value="에버턴" class="team4" onclick="changeBackgroundColor2('team4')" >
                        <img src="img/soccer/에버턴.png" class="logo">
                 <br><div class="text" >에버턴</div>
                    </div>
                </li>
                <li id="showvboo_3_bar">
                    <div class="showvboo_3_bar_divide1">
                    <input type="radio" name="team3" value="루턴 타운" class="team5" onclick="changeBackgroundColor3('team5')">
                        <img src="img/soccer/루턴 타운.png" class="logo">
              <span class="day" >    12.24 (일)  </span>  <div class="text1" >루턴 타운</div>
                    </div>
                    <div class="showvboo_3_bar_divide2">
                    <input type="radio" name="team3" value="뉴캐슬" class="team6" onclick="changeBackgroundColor3('team6')">
                        <img src="img/soccer/뉴캐슬.png" class="logo">
                  <br> <div class="text" > 뉴캐슬</div>
                    </div>
                </li>
                <li id="showvboo_4_bar">
                    <div class="showvboo_4_bar_divide1">
                    <input type="radio" name="team4" value="리버풀" class="team7" onclick="changeBackgroundColor4('team7')">
                        <img src="img/soccer/리버풀.png"  class="logo">
              <span class="day" >    12.24(일) </span>   <div class="text1" >리버풀</div>
                    </div>
                    <div class="showvboo_4_bar_divide2">
                    <input type="radio" name="team4" value="아스널" class="team8" onclick="changeBackgroundColor4('team8')">
                        <img src="img/soccer/아스널.png" class="logo">
                   <br> <div class="text" >아스널</div>
                    </div>
                </li>
                <li id="showvboo_5_bar">
                    <div class="showvboo_5_bar_divide1">
                    <input type="radio" name="team5" value="울버스" class="team9" onclick="changeBackgroundColor5('team9')" >
                        <img src="img/soccer/울버스.png" class="logo">
                <span class="day" >   12.24(일) </span>  <div class="text1" >울버스</div>
                    </div>
                    <div class="showvboo_5_bar_divide2">
                    <input type="radio" name="team5" value="첼시" class="team10" onclick="changeBackgroundColor5('team10')">
                        <img src="img/soccer/첼시.png" class="logo">
                  <br> <div class="text" > 첼시</div>
                    </div>
                </li>
            </ul>
        </div>    
    </div>
 
    </form>
   <%}else if(login.equals("admin")){ %>
   <jsp:include page="/app/AdminHeader.jsp" />
<form action="AdminPrediction.do" method="post">
<div id="main">
        <div id="main_bar">
            <ul>
             <input type="submit" value="포인트 추가" class="btn" onclick="success('admin')">
   			 <input type="reset" value="초기화" class="btn" onclick="resetButtons()">
                <li id="showvboo_1_bar">
        <div class="showvboo_1_bar_divide1">
            <input type="radio" name="team1" value="웨스트 햄" class="team1" onchange="changeBackgroundColor1('team1')">
            <img src="img/soccer/웨스트 햄.png" class="logo">
           <span class="day" >12.23 (토)</span> <div class="text1" >웨스트 햄 </div>
        </div>
        <div class="showvboo_1_bar_divide2">
            <input type="radio" name="team1" value="맨유" class="team2" onchange="changeBackgroundColor1('team2')">
            <img src="img/soccer/맨유.png" class="logo">
            <div class="text" >맨유</div>
        </div>
    </li>
                <li id="showvboo_2_bar">
                    <div class="showvboo_2_bar_divide1">
                    <input type="radio" name="team2" value="토트넘" class="team3" onclick="changeBackgroundColor2('team3')" >
                        <img src="img/soccer/토트넘.png" class="logo">
                    <span class="day" >12.24 (일)</span><div class="text1" >토트넘</div>
                    </div>
                    <div class="showvboo_2_bar_divide2">
                    <input type="radio" name="team2" value="에버턴" class="team4" onclick="changeBackgroundColor2('team4')" >
                        <img src="img/soccer/에버턴.png" class="logo">
                    <div class="text" >에버턴</div>
                    </div>
                </li>
                <li id="showvboo_3_bar">
                    <div class="showvboo_3_bar_divide1">
                    <input type="radio" name="team3" value="루턴 타운" class="team5" onclick="changeBackgroundColor3('team5')">
                        <img src="img/soccer/루턴 타운.png" class="logo">
                   <span class="day" >12.24 (일)</span><div class="text1" > 루턴 타운</div>
                    </div>
                    <div class="showvboo_3_bar_divide2">
                    <input type="radio" name="team3" value="뉴캐슬" class="team6" onclick="changeBackgroundColor3('team6')">
                        <img src="img/soccer/뉴캐슬.png" class="logo">
                    <div class="text" >뉴캐슬</div>
                    </div>
                </li>
                <li id="showvboo_4_bar">
                    <div class="showvboo_4_bar_divide1">
                    <input type="radio" name="team4" value="리버풀" class="team7" onclick="changeBackgroundColor4('team7')">
                        <img src="img/soccer/리버풀.png" class="logo">
                  <span class="day" >12.24 (일)</span> <div class="text1" > 리버풀</div>
                    </div>
                    <div class="showvboo_4_bar_divide2">
                    <input type="radio" name="team4" value="아스널" class="team8" onclick="changeBackgroundColor4('team8')">
                        <img src="img/soccer/아스널.png" class="logo">
                   <div class="text" > 아스널</div>
                    </div>
                </li>
                <li id="showvboo_5_bar">
                    <div class="showvboo_5_bar_divide1">
                    <input type="radio" name="team5" value="울버스" class="team9" onclick="changeBackgroundColor5('team9')" >
                        <img src="img/soccer/울버스.png" class="logo">
                    <span class="day" >12.24 (일)</span><div class="text1" >울버스</div>
                    </div>
                    <div class="showvboo_5_bar_divide2">
                    <input type="radio" name="team5" value="첼시" class="team10" onclick="changeBackgroundColor5('team10')">
                        <img src="img/soccer/첼시.png" class="logo">
                    <div class="text" >첼시</div>
                    </div>
                </li>
            </ul>
        </div>    
    </div>
    </form>
   <%}}else{%>
   <jsp:include page="/app/Unheader.jsp" />
	   <div id="main">
        <div id="main_bar">
        <div class="text3" > 회원가입을 하고 승부예측에 참여하세요! </div>
           <ul>
                <li id="showvboo_1_bar">
        <div class="showvboo_1_bar_divide1">
            <input type="radio" name="team1" value="웨스트 햄" class="team1" onchange="changeBackgroundColor1('team1')">
            <img src="img/soccer/웨스트 햄.png" class="logo">
          <span class="day" >12.23 (토)</span>  <div class="text1" >웨스트 햄</div>
        </div>
        <div class="showvboo_1_bar_divide2">
            <input type="radio" name="team1" value="맨유" class="team2" onchange="changeBackgroundColor1('team2')">
            <img src="img/soccer/맨유.png" class="logo">
            <div class="text" >맨유</div>
        </div>
    </li>
                <li id="showvboo_2_bar">
                    <div class="showvboo_2_bar_divide1">
                    <input type="radio" name="team2" value="토트넘"  class = "team3" onclick="changeBackgroundColor2('team3')" >
                        <img src="img/soccer/토트넘.png" class="logo">
                   <span class="day" >12.24 (일)</span> <div class="text1" >토트넘</div>
                    </div>
                    <div class="showvboo_2_bar_divide2">
                    <input type="radio" name="team2" value="에버턴" class="team4" onclick="changeBackgroundColor2('team4')" >
                        <img src="img/soccer/에버턴.png" class="logo">
                   <div class="text" > 에버턴</div>
                    </div>
                </li>
                <li id="showvboo_3_bar">
                    <div class="showvboo_3_bar_divide1">
                    <input type="radio" name="team3" value="루턴 타운" class="team5" onclick="changeBackgroundColor3('team5')">
                        <img src="img/soccer/루턴 타운.png" class="logo">
                  <span class="day" >12.24 (일)</span> <div class="text1" > 루턴 타운</div>
                    </div>
                    <div class="showvboo_3_bar_divide2">
                    <input type="radio" name="team3" value="뉴캐슬" class="team6" onclick="changeBackgroundColor3('team6')">
                        <img src="img/soccer/뉴캐슬.png" class="logo">
                    <div class="text" >뉴캐슬</div>
                    </div>
                </li>
                <li id="showvboo_4_bar">
                    <div class="showvboo_4_bar_divide1">
                    <input type="radio" name="team4" value="리버풀" class="team7" onclick="changeBackgroundColor4('team7')">
                        <img src="img/soccer/리버풀.png" class="logo">
                  <span class="day" >12.24 (일)</span> <div class="text1" > 리버풀</div>
                    </div>
                    <div class="showvboo_4_bar_divide2">
                    <input type="radio" name="team4" value="아스널" class="team8" onclick="changeBackgroundColor4('team8')">
                        <img src="img/soccer/아스널.png" class="logo">
                    <div class="text" >아스널</div>
                    </div>
                </li>
                <li id="showvboo_5_bar">
                    <div class="showvboo_5_bar_divide1">
                    <input type="radio" name="team5" value="울버스" class="team9" onclick="changeBackgroundColor5('team9')" >
                        <img src="img/soccer/울버스.png" class="logo">
                  <span class="day" >12.24 (일)</span> <div class="text1" > 울버스</div>
                    </div>
                    <div class="showvboo_5_bar_divide2">
                    <input type="radio" name="team5" value="첼시" class="team10" onclick="changeBackgroundColor5('team10')">
                        <img src="img/soccer/첼시.png" class="logo">
                    <div class="text" >첼시</div>
                    </div>
                </li>
            </ul>
        </div>    
    </div>
 <%  } %>
<jsp:include page="/app/footer.jsp" />
</body>
</html>
