<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<% String cp = request.getContextPath(); %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function logout() {
    // ���� ���� ����
    sessionStorage.removeItem('login');

    // �α׾ƿ� ��û�� ������ ����
    $.ajax({
        url: '<%=cp%>/Log.do', // �α׾ƿ��� ó���ϴ� ���� �Ǵ� ��Ʈ�ѷ� ���
        method: 'POST',
        success: function(response) {
            // �α׾ƿ� ���� �� �߰� ����
            // ������ ���ε� �Ǵ� �α׾ƿ� �� �̵� ��
            window.location.href = '<%=cp%>/index.jsp';
        },
        error: function() {
            // ���� ó��
            console.error('�α׾ƿ� ��û ����');
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
      <a id="logo" href="index.jsp"><img src="<%=cp%>/img/DY.png" alt="�ΰ�" width="70" height="70"></a>
      <nav id="top_menu">
        <ul>
          <li class="green" id="profileDropdown">
  <a href="#" onclick="toggleDropdown()">
    <img src="<%=cp%>/img/profile.png" alt="������" width="30" height="30">
  </a>
  <div id="profileMenu" class="dropdown-content">
    <a href="<%=cp%>/manager.jsp">ȸ�� ����</a>
    <a href="javascript:void(0);" onclick="logout()">�α׾ƿ�</a>
  </div>
</li>
      
          </ul>
      </nav> <!-- top_menu -->

      <div class="clear"></div>
     </section> <!-- section top -->

      <nav id="main_menu">
        <ul>
          <li><a href="<%=cp%>/index.jsp">Ȩ</a></li>
          <li><a href="<%=cp%>/Stat.jsp">����ǥ</a></li>
          <li><a href="<%=cp%>/WinLose.jsp">�ºο���</a></li>
          <li><form class="admin" action="Board.do" method="post" style="display: inline;" id="list">
          <input type="submit" value="Ŀ�´�Ƽ" class="list">
          </form>
        </li>
        </ul>
      </nav>
  </header> <!--header -->
