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

import com.java.bean.BoardDAO;
import com.java.bean.BoardDTO;
import com.java.bean.DeleteDAO;
import com.java.bean.MemberDAO;
import com.java.bean.RegisterDTO;

@WebServlet("/BoardDelete.do")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String delete = request.getParameter("delete");
		BoardDAO dto = new BoardDAO();
		BoardDTO rd = new BoardDTO();
		int cnt = dto.deleteBoard(delete);
		if(cnt == 1) {
			try {
				ArrayList<BoardDTO> memL = dto.boardSelect();
				session.setAttribute("titleList", memL);
				response.sendRedirect("list.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			session.setAttribute("resultD","fail");
			response.sendRedirect("manager.jsp");
		}
	}

}
