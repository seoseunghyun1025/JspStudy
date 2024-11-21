package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.bean.MemberDAO;

@WebServlet("/Prediction.do")
public class PredictionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");
		String team3 = request.getParameter("team3");
		String team4 = request.getParameter("team4");
		String team5 = request.getParameter("team5");
		MemberDAO rd = new MemberDAO();
		int cnt = rd.prediction(id, team1, team2, team3, team4, team5);
		if(cnt == 1) {
			System.out.println("성공");
			session.setAttribute("prediction","성공");
			response.sendRedirect("WinLose.jsp");
		}else {
			session.setAttribute("predicition","실패");
			System.out.println("실패");
			response.sendRedirect("fail.jsp");
		}
	}

}
