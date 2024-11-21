<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/header.css">
<header>
    <section id="top">
      <a id="logo" href="index.jsp"><img src="<%=cp%>/img/DY.png" alt="로고" width="70" height="70"></a>
      <nav id="top_menu">
        <ul>
          <li class="green"><a href="project.jsp">로그인</a></li>
          <li class="green"><a href="signUp.jsp">회원가입</a></li>
        </ul>     
    </nav> <!-- top_menu -->

      <div class="clear"></div>
     </section> <!-- section top -->

      <nav id="main_menu">
        <ul>
          <li><a href="<%= cp %>/index.jsp">홈</a></li>
          <li><a href="<%= cp %>/Stat.jsp">순위표</a></li>
          <li><a href="<%= cp%>/WinLose.jsp">승부예측</a></li>
          <li><form action="Board.do" method="post" style="display: inline;" id="list">
          <input type="submit" value="커뮤니티" class="list">
          </form>
        </li>
        </ul>
      </nav>
  </header> <!--header -->