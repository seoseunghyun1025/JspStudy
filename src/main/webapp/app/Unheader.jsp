<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/header.css">
<header>
    <section id="top">
      <a id="logo" href="index.jsp"><img src="<%=cp%>/img/DY.png" alt="�ΰ�" width="70" height="70"></a>
      <nav id="top_menu">
        <ul>
          <li class="green"><a href="project.jsp">�α���</a></li>
          <li class="green"><a href="signUp.jsp">ȸ������</a></li>
        </ul>     
    </nav> <!-- top_menu -->

      <div class="clear"></div>
     </section> <!-- section top -->

      <nav id="main_menu">
        <ul>
          <li><a href="<%= cp %>/index.jsp">Ȩ</a></li>
          <li><a href="<%= cp %>/Stat.jsp">����ǥ</a></li>
          <li><a href="<%= cp%>/WinLose.jsp">�ºο���</a></li>
          <li><form action="Board.do" method="post" style="display: inline;" id="list">
          <input type="submit" value="Ŀ�´�Ƽ" class="list">
          </form>
        </li>
        </ul>
      </nav>
  </header> <!--header -->