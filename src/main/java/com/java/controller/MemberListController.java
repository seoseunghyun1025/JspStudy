package com.java.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.bean.BoardDAO;
import com.java.bean.BoardDTO;
import com.java.bean.RegisterDTO;

@WebServlet("/MemberList.do")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		BoardDAO rd = new BoardDAO();
		try {
			ArrayList<BoardDTO> aList = rd.list(keyword);
			session.setAttribute("titleList", aList);
			response.sendRedirect("list.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
