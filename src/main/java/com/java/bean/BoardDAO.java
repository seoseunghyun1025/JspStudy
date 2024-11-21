package com.java.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//DAO는 테이블에 데이터를 넣는 클래스이기때문에 table을 만들었으면 dao도 만들 수 있다.
public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; 
	private String BOARD_SELECT = "select * from BOARD;";
	private String BOARD_CREATE = "insert into BOARD (title, name, count, area) values(?,?,?,?);";
	private String BOARD_LOOK = "select title,name,date,area,count from BOARD where num=?;";
	private String BOARD_COUNT = "UPDATE BOARD set count = count + 1 where num=?;";
	private String BOARD_DELETE = "DELETE from BOARD where num=?";
	
	public ArrayList<BoardDTO> list(String keyword) {
	    conn = JDBCutil.getConnection();
	    ArrayList<BoardDTO> aList = new ArrayList<BoardDTO>();
	    String query = "SELECT * FROM BOARD";
	    try {
	        if (keyword != null && !keyword.isEmpty()) {
	            query += " WHERE name LIKE ?";
	        }
	        pstmt = conn.prepareStatement(query);
	        if (keyword != null && !keyword.isEmpty()) {
	            pstmt.setString(1, "%" + keyword + "%");
	        }
	        rs = pstmt.executeQuery();
	       /* if(rs.next() == false) {
	        	pstmt = conn.prepareStatement(BOARD_SELECT);
	        	rs = pstmt.executeQuery();
	        	while (rs.next()) {
		            BoardDTO rd = new BoardDTO();
		            rd.setNum(rs.getInt("num"));
		            rd.setTitle(rs.getString("title"));
		            rd.setName(rs.getString("name"));
		            rd.setDate(rs.getString("date"));
		            rd.setCount(rs.getInt("count"));
		            aList.add(rd);
		        }
	        	return aList;
	        }*/
	        while (rs.next()) {
	            BoardDTO rd = new BoardDTO();
	            rd.setNum(rs.getInt("num"));
	            rd.setTitle(rs.getString("title"));
	            rd.setName(rs.getString("name"));
	            rd.setDate(rs.getString("date"));
	            rd.setCount(rs.getInt("count"));
	            aList.add(rd);
	        }
	    } catch (SQLException e) {
	        // 예외 처리 코드
	        e.printStackTrace();
	    } finally {
	        JDBCutil.close(rs, pstmt, conn);
	    }
	    return aList;
	}

	
	public int deleteBoard(String num){
		int cnt = 0;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(BOARD_DELETE);
			pstmt.setString(1, num);
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(pstmt, conn);
		}
		System.out.println(cnt);
		return cnt;
	}
	
	public int countPlus(String num){
		int cnt = 0;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(BOARD_COUNT);
			pstmt.setString(1, num);
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(pstmt, conn);
		}
		System.out.println(cnt);
		return cnt;
	}
	public ArrayList<BoardDTO> look(String num) throws SQLException{
		ArrayList<BoardDTO> aList = new ArrayList<BoardDTO>();
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(BOARD_LOOK);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO rd = new BoardDTO();
				rd.setTitle(rs.getString("title"));
				rd.setName(rs.getString("name"));
				rd.setDate(rs.getString("date"));
				rd.setArea(rs.getString("area"));
				rd.setCount(rs.getInt("count"));
				aList.add(rd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return aList;
	}
	
	public ArrayList<BoardDTO> boardSelect() throws SQLException{
		ArrayList<BoardDTO> aList = new ArrayList<BoardDTO>();
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(BOARD_SELECT);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO rd = new BoardDTO();
				rd.setNum(rs.getInt("num"));
				rd.setTitle(rs.getString("title"));
				rd.setName(rs.getString("name"));
				rd.setDate(rs.getString("date"));
				rd.setCount(rs.getInt("count"));
				aList.add(rd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return aList;
	}
	public int createBoard(BoardDTO cre){
		int cnt = 0;
		
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(BOARD_CREATE);
			pstmt.setString(1, cre.getTitle());
			pstmt.setString(2, cre.getName());
			pstmt.setInt(3, 0);
			pstmt.setString(4, cre.getArea());
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(pstmt, conn);
		}
		System.out.println(cnt);
		return cnt;
	}
}