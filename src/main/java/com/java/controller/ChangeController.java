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


@WebServlet("/Change.do")
public class ChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String passwd = request.getParameter("passwd");
		String newpasswd = request.getParameter("newpasswd");
		String passwdChecked = request.getParameter("passwdChecked");
		MemberDAO rd = new MemberDAO();
		MemberDTO rt = new MemberDTO();
		MemberDTO newRt = new MemberDTO();
		rt.setPW(passwd);
		newRt.setPW(newpasswd);
		int cnt = rd.passwordProcess(rt);
		if(!newpasswd.equals(passwdChecked)) {
			session.setAttribute("check","비밀번호가 일치하지 않습니다.");
			System.out.println("비밀번호 일치하지 않음");
			response.sendRedirect("ChangePassword.jsp");
		}else {
			if(cnt == 1) {
				cnt = rd.changePassword(rt,newRt);
				if(cnt == -1) {
					session.setAttribute("check","저장 실패");
					System.out.println("저장되지 않음");
					response.sendRedirect("ChangePassword.jsp");
				}else {
					session.setAttribute("check","변경");
					System.out.println("변경됨");
					response.sendRedirect("ChangePassword.jsp");
				}
			}else {
				session.setAttribute("check", "비밀번호를 찾을 수 없음");
				System.out.println("변경되지 않음");
				response.sendRedirect("ChangePassword.jsp");
			}
		}
	}
}
