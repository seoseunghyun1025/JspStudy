<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/footer.css">

<footer id="footer">
    <h2>DY SPORTS</h2>
    <div id="etc">
        <p> 법인명(상호) : DY SPORTS / 사업자등록번호 : 123-01-24680 / 주소 : 서울시 구로구 경인로 445 <br>
            대표이사 : 서승현 (010-9696-5101) / 관리책임자 : 강태현 (010-4071-7026) / 고객센터 : 1234-1111 </p>
    </div>
    <a href="https://www.youtube.com/@premierleague" target="_blank">
        <img id="youtube" src="<%=cp%>/img/youtube.png" alt="YouTube">
    </a>
    <a href="https://www.facebook.com/premierleague" target="_blank">
     <img id="facebook" src="<%=cp%>/img/facebook.png" alt="Facebook">
    </a>
    <a href="https://www.instagram.com/premierleague/" target="_blank">
       <img id="instagram" src="<%=cp%>/img/instagram.png" alt="Instagram">
    </a>
</footer>