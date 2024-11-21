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
import com.java.bean.MemberDAO;
import com.java.bean.RegisterDTO;

@WebServlet("/Board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		BoardDAO rd = new BoardDAO();
		try {
			ArrayList<BoardDTO> memL = rd.boardSelect();
			session.setAttribute("titleList", memL);
			response.sendRedirect("list.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
