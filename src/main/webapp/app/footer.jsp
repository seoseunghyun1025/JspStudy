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
        <p> ���θ�(��ȣ) : DY SPORTS / ����ڵ�Ϲ�ȣ : 123-01-24680 / �ּ� : ����� ���α� ���η� 445 <br>
            ��ǥ�̻� : ������ (010-9696-5101) / ����å���� : ������ (010-4071-7026) / ������ : 1234-1111 </p>
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