package com.java.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.bean.DeleteDAO;
import com.java.bean.MemberDAO;
import com.java.bean.RegisterDTO;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/Delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String delete = request.getParameter("delete");
		DeleteDAO dto = new DeleteDAO();
		MemberDAO rd = new MemberDAO();
		int cnt2 = dto.deleteProcessWin(delete);
		int cnt = dto.deleteProcess(delete);
		if(cnt == 1 && cnt2  == 1) {
			try {
				ArrayList<RegisterDTO> memL = rd.selectMemberList();
				session.setAttribute("userList", memL);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("resultD","success");
			response.sendRedirect("manager.jsp");
		}else {
			session.setAttribute("resultD","fail");
			response.sendRedirect("manager.jsp");
		}
	}

}
