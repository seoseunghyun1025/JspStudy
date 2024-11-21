<%@ page import="java.io.IOException" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
    String result = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Epl 순위표</title>
    <link rel="stylesheet" type="text/css" href="css/stat.css">
</head>
<body>
<%if(result != null){if(result.equals("success")){ %>
<jsp:include page="app/header.jsp"/>
<%}else if(result.equals("admin")){ %>
<jsp:include page="app/AdminHeader.jsp" />
<%}}else{%>
<jsp:include page="app/Unheader.jsp" />
<%}%>
<div class="text">EPL 2023/24 시즌 팀 순위</div>
<!-- 크롤링 코드 -->
<%
    // 크롤링할 웹 페이지 URL
    String url = "https://footystats.org/kr/england/premier-league";

    try {
        // 웹 페이지 가져오기
        Document document = Jsoup.connect(url).get();

        // 팀 정보를 담을 Elements 객체 가져오기
        Elements teamElements = document.select("#leagueContent > div:nth-child(4) > div:nth-child(3) > div.cf.mt1e > div > div.table-wrapper > table > tbody > tr");

        // 결과 출력 - 테이블 헤더
%>
        <table border='1'>
            <tr>
                <th>순위</th>
                <th>로고</th>
                <th>팀</th>
                <th>경기수</th>
                <th>승</th>
                <th>무</th>
                <th>패</th>
                <th>득점</th>
                <th>실점</th>               
                <th>승점</th>
            </tr>
<%
        // 결과 출력 - 테이블 본문
        int teamRank = 1; // 순위 초기화
        for (Element teamElement : teamElements) {
            String teamName = teamElement.select("td.team.borderRightContent > a").text();
            String mpValue = teamElement.select("td.mp").text();
            String winValue = teamElement.select("td.win").text();
            String drawValue = teamElement.select("td.draw").text();
            String lossValue = teamElement.select("td.loss").text();
            String gfValue = teamElement.select("td.gf").text();
            String gaValue = teamElement.select("td.ga").text();
            String pointValue = teamElement.select("td.points.bold").text();          
%>
            <tr>
                <td><%= teamRank++ %></td>
                <td><img src="img/soccer2/<%=teamName%>.webp" class="soccerimg"></td>
                <td><%= teamName %></td>
                <td><%= mpValue %></td>
                <td><%= winValue %></td>
                <td><%= drawValue %></td>
                <td><%= lossValue %></td>
                <td><%= gfValue %></td>
                <td><%= gaValue %></td>
                <td><%= pointValue %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch (IOException e) {
        e.printStackTrace();
    }
%>

<jsp:include page="app/footer.jsp"/>
</body>
</html>