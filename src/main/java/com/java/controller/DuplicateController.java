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

import com.java.bean.DuplicateDTO;
import com.java.bean.MemberDAO;
import com.java.bean.MemberDTO;
import com.java.bean.RegisterDTO;

@WebServlet("/Dupli.do")
public class DuplicateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		DuplicateDTO dto = new DuplicateDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setID(id);
		int cnt = dao.selectProcess(dto);
		if(cnt == 1) {
			session.setAttribute("duplie","계정이 있습니다 다시 시도해주세요");
			response.sendRedirect("Duplicate.jsp");
		}
		else {
			session.setAttribute("duplie","계정이 없습니다!");
			session.setAttribute("아이디",id);
			response.sendRedirect("Duplicate.jsp");
		}
	}
}