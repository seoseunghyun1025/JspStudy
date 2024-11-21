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
    <title>Epl ����ǥ</title>
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
<div class="text">EPL 2023/24 ���� �� ����</div>
<!-- ũ�Ѹ� �ڵ� -->
<%
    // ũ�Ѹ��� �� ������ URL
    String url = "https://footystats.org/kr/england/premier-league";

    try {
        // �� ������ ��������
        Document document = Jsoup.connect(url).get();

        // �� ������ ���� Elements ��ü ��������
        Elements teamElements = document.select("#leagueContent > div:nth-child(4) > div:nth-child(3) > div.cf.mt1e > div > div.table-wrapper > table > tbody > tr");

        // ��� ��� - ���̺� ���
%>
        <table border='1'>
            <tr>
                <th>����</th>
                <th>�ΰ�</th>
                <th>��</th>
                <th>����</th>
                <th>��</th>
                <th>��</th>
                <th>��</th>
                <th>����</th>
                <th>����</th>               
                <th>����</th>
            </tr>
<%
        // ��� ��� - ���̺� ����
        int teamRank = 1; // ���� �ʱ�ȭ
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