<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function logout() {
    // 세션 정보 삭제
    sessionStorage.removeItem('login');

    // 로그아웃 요청을 서버에 전송
    $.ajax({
        url: '<%=cp%>/Log.do', // 로그아웃을 처리하는 서블릿 또는 컨트롤러 경로
        method: 'POST',
        success: function(response) {
            // 로그아웃 성공 시 추가 동작
            // 페이지 리로드 또는 로그아웃 후 이동 등
            window.location.href = '<%=cp%>/index.jsp';
        },
        error: function() {
            // 에러 처리
            console.error('로그아웃 요청 실패');
        }
    });
}
</script>

    <script>
  function toggleDropdown() {
    var dropdown = document.getElementById("profileMenu");
    dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
  }
</script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/header.css">
<header>
    <section id="top">
      <a id="logo" href="index.jsp"><img src="<%=cp%>/img/DY.png" alt="로고" width="70" height="70"></a>
      <nav id="top_menu">
        <ul>
          <li class="green" id="profileDropdown">
  <a href="#" onclick="toggleDropdown()">
    <img src="<%=cp%>/img/profile.png" alt="프로필" width="30" height="30">
  </a>
  <div id="profileMenu" class="dropdown-content">
    <a href="<%=cp%>/manager.jsp">회원 관리</a>
    <a href="javascript:void(0);" onclick="logout()">로그아웃</a>
  </div>
</li>
      
          </ul>
      </nav> <!-- top_menu -->

      <div class="clear"></div>
     </section> <!-- section top -->

      <nav id="main_menu">
        <ul>
          <li><a href="<%=cp%>/index.jsp">홈</a></li>
          <li><a href="<%=cp%>/Stat.jsp">순위표</a></li>
          <li><a href="<%=cp%>/WinLose.jsp">승부예측</a></li>
          <li><form class="admin" action="Board.do" method="post" style="display: inline;" id="list">
          <input type="submit" value="커뮤니티" class="list">
          </form>
        </li>
        </ul>
      </nav>
  </header> <!--header -->
