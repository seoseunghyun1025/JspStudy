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

@WebServlet("/BoardSelect.do")
public class BoardSelectController extends HttpServlet {
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
		String num = request.getParameter("selectedNum");
		System.out.print("넣은 값"+num);
		HttpSession session = request.getSession();
		BoardDAO rd = new BoardDAO();
		int cnt = rd.countPlus(num);
		try {
			ArrayList<BoardDTO> borL = rd.look(num);
			session.setAttribute("selectList", borL);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(cnt == 1) {
			response.sendRedirect("boardLook.jsp");
		}else {
			response.sendRedirect("");

		}
	}

}
