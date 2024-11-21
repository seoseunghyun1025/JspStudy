<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<%
   String result = (String)session.getAttribute("login");
%>
<meta charset="UTF-8">
<title> DY SPORTS </title>
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
    <section id="cat2">
      <section class="container">
        <div id="carouselExampleAutoplaying" class="carousel slide carousel-white w-50 " data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="img/cloud.png" class="d-block w-100" id="bowen">
              </div>
              <div class="carousel-item">
                <img src="img/son.jpg" class="d-block w-100" id="son">
              </div>
              <div class="carousel-item">
                <img src="img/holland.jpg" class="d-block w-100" id="holland">
              </div>
              <div class="carousel-item">
                <img src="img/hwang.jpg" class="d-block w-100" id="hwang">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
    </section> <!-- section cat2 -->

    <div class="clear"></div>
     
    <!--사이드바-->
      <aside>
             <div class="weather-container">
    <div class="card">
      <h2>서울시</h2>
      <img id="ic" src="">
      
      <span id="humidity"></span>
    </div>
    <script src="js/weather.js"></script>
    <script>
        // OpenWeatherMap API 키
        const apiKey = '10693e5a33a8fd1c75c25f22c58d69c6';

        // weather.js에서 정의한 함수 호출
        fetchWeather(apiKey)
            .then(data => {
                // 결과를 화면에 표시
                document.getElementById("humidity").innerHTML = data.result;

                // 아이콘 이미지 표시
                const iconurl = document.getElementById('ic');
                iconurl.src = data.iconUrl;
            });
    </script>
         
         </div> 
      </aside>

      <section id="single">
    <h4 id="sports">스포츠기사 > 출처: 스포츠춘추</h4>    
         
<%
    // 크롤링할 웹 페이지 주소
   String url = "https://www.spochoo.com/news/articleList.html?sc_sub_section_code=S2N5&view_type=sm";
   String key = "class";
   String value = "type2";
   
    try {
        // Jsoup을 사용하여 웹 페이지의 내용을 가져오기
        Document doc = Jsoup.connect(url).get();

        Elements todayItems = doc.select(".type2 li");
        int count = 0;
        for(Element item : todayItems){
           count++;
           if(count > 6 ){
              break;
           }
            String imageUrl = item.select("img").attr("src");
            String title = item.select("a").text();
            String newsDetailUrl = "https://www.spochoo.com/" + item.select("a").attr("href");
            %>
             <div class="news">
        <!-- 이미지 클릭 시 뉴스 상세 페이지로 이동하는 링크 -->
        <a href="<%= newsDetailUrl %>" target="_blank">
            <div class="image-container">
                <img src="<%= imageUrl %>" alt="이미지">
            </div>
            <div class="text-container">
                <p><%= title %></p>
            </div>
        </a>
    </div>

 <%
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
       </section> <!-- section main -->
</body>
<jsp:include page="app/footer.jsp" />
</html>