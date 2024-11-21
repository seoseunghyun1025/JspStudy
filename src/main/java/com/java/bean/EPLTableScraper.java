package com.java.bean;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class EPLTableScraper extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "https://sports.daum.net/record/epl";

        try {
            Document document = Jsoup.connect(url).get();
            Element table = document.selectFirst("tbody");
            Elements rows = table.select("tr");

            List<TeamData> teamDataList = new ArrayList<>();

            for (Element row : rows) {
                Elements columns = row.select("td");

                if (columns.size() >= 10) {
                    int rank = Integer.parseInt(columns.get(0).text());
                    String teamName = columns.get(1).select("span.txt_name").text();
                    int games = Integer.parseInt(columns.get(2).text());
                    int wins = Integer.parseInt(columns.get(3).text());
                    int draws = Integer.parseInt(columns.get(4).text());
                    int losses = Integer.parseInt(columns.get(5).text());

                    TeamData teamData = new TeamData(rank, teamName, games, wins, draws, losses);
                    teamDataList.add(teamData);
                }
            }

            // JSP 페이지로 데이터 전달
            request.setAttribute("teamData", teamDataList);

            // JSP 페이지로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("Stat.jsp");
            dispatcher.forward(request, response);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

