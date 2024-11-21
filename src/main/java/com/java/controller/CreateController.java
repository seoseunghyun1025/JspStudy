package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.bean.MemberDAO;
import com.java.bean.MemberDTO;
import com.java.bean.CreateDTO;

@WebServlet("/Create.do")
public class CreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("ID");
		String pw = request.getParameter("passwd");
		String pwC = request.getParameter("passwdChecked");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String number = request.getParameter("cnumber");
		String account = request.getParameter("account");
		/*
		 * if(id == null || id.equals("")|| pw == null || pw.equals("") ||account ==
		 * null || account.equals("") || pwC == null || pwC.equals("")) {
		 * request.getSession().setAttribute("messageType","오류");
		 * request.getSession().setAttribute("messageContent","아이디, 비밀번호를 입력하세요.");
		  
		response.sendRedirect("signUp.jsp"); return;*/ 
		if(!pw.equals(pwC)) {
		 session.setAttribute("messageType","오류");
		 session.setAttribute("messageContent","비밀번호가 서로 일치하지 않습니다.");
		 response.sendRedirect("signUp.jsp"); 
		 System.out.println("비밀번호가 서로 일치하지 않습니다.");
		 return;
		}
		 
		
		CreateDTO rt = new CreateDTO();
		CreateDTO rt1 = new CreateDTO();
		MemberDAO rd = new MemberDAO();
		
		rt.setCID(id);
		rt.setCPW(pw);
		rt.setCemail(email);
		rt.setCname(name);
		rt.setCnumber(number);
		rt.setCaccount(account);
		
		rt1.setCID(id);
		int cnt = rd.insertProcess(rt);
		int cnt2 = rd.insertProcessWin(rt1);
		System.out.println(cnt + " " + cnt2);
		if(cnt == 1 && cnt2 == 1) {
			request.getSession().setAttribute("messageType","회원가입 성공");
			response.sendRedirect("project.jsp");
		}else {
			request.getSession().setAttribute("messageType","회원가입 실패");
			response.sendRedirect("signUp.jsp");
		}
	}

}
