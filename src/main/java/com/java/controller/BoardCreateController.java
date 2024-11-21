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
import com.java.bean.CreateDTO;
import com.java.bean.MemberDAO;

@WebServlet("/BoardCreate.do")
public class BoardCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		
		BoardDTO rt = new BoardDTO();
		BoardDAO rd = new BoardDAO();
		
		rt.setTitle(title);
		rt.setName(name);
		rt.setArea(area);
		
		int cnt = rd.createBoard(rt);
		System.out.println(cnt);
		if(cnt == 1) {
			request.getSession().setAttribute("bResult","글 올리기 성공");
			ArrayList<BoardDTO> memL;
			try {
				memL = rd.boardSelect();
				session.setAttribute("titleList", memL);
				response.sendRedirect("list.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			request.getSession().setAttribute("bResult","글 올리기 실패");
			response.sendRedirect("created.jsp");
		}
	}

}
