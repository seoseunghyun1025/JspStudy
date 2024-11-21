package com.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.bean.MemberDAO;

@WebServlet("/AdminPrediction.do")
public class AdminPredictionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String team1 = request.getParameter("team1");
		String team2 = request.getParameter("team2");
		String team3 = request.getParameter("team3");
		String team4 = request.getParameter("team4");
		String team5 = request.getParameter("team5");
		MemberDAO rd = new MemberDAO();
		int cnt1 = rd.adminPrediction_win1(team1);
		int cnt2 = rd.adminPrediction_win2(team2);
		int cnt3 = rd.adminPrediction_win3(team3);
		int cnt4 = rd.adminPrediction_win4(team4);
		int cnt5 = rd.adminPrediction_win5(team5);

		if(cnt1 >= 0 || cnt2 >= 0 || cnt3 >= 0 || cnt4 >= 0 || cnt5 >= 0) {
			session.setAttribute("adminPrediction","point append");
			response.sendRedirect("WinLose.jsp");
		}else {
			session.setAttribute("adminPrediction","point fail");
			System.out.println("실패했습니다");
			response.sendRedirect("fail.jsp");
		}
	}

}
