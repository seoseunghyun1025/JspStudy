package com.java.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import java.io.UnsupportedEncodingException;
import java.sql.*;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; 
	
	private final static String USER_FIND = "select ID,passwd from members where ID=?;";
	private final static String USER_SELECT = "select ID from members where ID=?;";
	private final static String USER_INSERT = "insert into members values(?,?,?,?,?,0,?);";
	private final static String USER_PREDICTION = "insert into prediction(ID) values(?);";
	private final static String USER_LIST = "select * from members;";
	private final static String USER_PROFILE = "select * from members where ID=?;";
	private final static String USER_PASSWORD = "select passwd from members where passwd=?;";
	private final static String USER_CHANGE = "update members set passwd=? where passwd=?;";
	private final static String PREDICTION_INSERT = "update prediction set win1 =?, win2 =?, win3 =?, win4 =?, win5 =?  where ID =?;";	
	private final static String ADMIN_PREDICTION_WIN1 = "Update members, prediction set members.point = members.point + 1 where prediction.win1 = ? and members.ID = prediction.ID;";
	private final static String ADMIN_PREDICTION_WIN2 = "Update members, prediction set members.point = members.point + 1 where prediction.win2 = ? and members.ID = prediction.ID;";
	private final static String ADMIN_PREDICTION_WIN3 = "Update members, prediction set members.point = members.point + 1 where prediction.win3 = ? and members.ID = prediction.ID;";
	private final static String ADMIN_PREDICTION_WIN4 = "Update members, prediction set members.point = members.point + 1 where prediction.win4 = ? and members.ID = prediction.ID;";
	private final static String ADMIN_PREDICTION_WIN5 = "Update members, prediction set members.point = members.point + 1 where prediction.win5 = ? and members.ID = prediction.ID;";
	public int adminPrediction_win1(String team){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(ADMIN_PREDICTION_WIN1);
			pstmt.setString(1,team);
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	public int adminPrediction_win2(String team){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(ADMIN_PREDICTION_WIN2);
			pstmt.setString(1,team);
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	public int adminPrediction_win3(String team){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(ADMIN_PREDICTION_WIN3);
			pstmt.setString(1,team);
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	public int adminPrediction_win4(String team){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(ADMIN_PREDICTION_WIN4);
			pstmt.setString(1,team);
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	public int adminPrediction_win5(String team){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(ADMIN_PREDICTION_WIN5);
			pstmt.setString(1,team);
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	
	public int prediction(String id, String team1, String team2, String team3, String team4, String team5){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(PREDICTION_INSERT);
			pstmt.setString(1,team1);
			pstmt.setString(2,team2);
			pstmt.setString(3,team3);
			pstmt.setString(4,team4);
			pstmt.setString(5,team5);
			pstmt.setString(6,id);
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	
	public int insertProcessWin(CreateDTO cre){
		int cnt = 0;
		
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_PREDICTION);
			pstmt.setString(1, cre.getCID());
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(pstmt, conn);
		}
		System.out.println(cnt);
		return cnt;
	}
	
	public int changePassword(MemberDTO mem, MemberDTO newPass){
		int re = -1;
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_CHANGE);
			pstmt.setString(1,newPass.getPW());
			pstmt.setString(2, mem.getPW());
			re = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(pstmt, conn);
		}
		return re;
	}
	
	public int passwordProcess(MemberDTO mem){
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_PASSWORD);
			pstmt.setString(1,mem.getPW());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("passwd").equals(mem.getPW())) return 1;
				else return 2;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return -2;
	}
	
	public int loginProcess(MemberDTO mem){
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_FIND);
			pstmt.setString(1,mem.getID());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("ID").equals("admin")&& rs.getString("passwd").equals("root")) {
					return 100;
				}
				if(rs.getString("ID").equals(mem.getID())&&rs.getString("passwd").equals(mem.getPW())) return 1;
				else return 2;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return -2;
	}
	public int selectProcess(DuplicateDTO mem){
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_FIND);
			pstmt.setString(1,mem.getID());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("ID").equals(mem.getID())) return 1;
				else return 2;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return -2;
	}
	public ArrayList<RegisterDTO> selectProfileList(String id) throws SQLException{
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_PROFILE);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RegisterDTO rd = new RegisterDTO();
				rd.setMemberid(rs.getString("ID"));
				rd.setPassword(rs.getString("passwd"));
				rd.setEmail(rs.getString("email"));
				rd.setName(rs.getString("name"));
				rd.setNumber(rs.getString("number"));
				rd.setPoint(rs.getInt("point"));
				rd.setAccount(rs.getString("account"));
				aList.add(rd);
				System.out.println(rd.getMemberid());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(rs,  pstmt, conn);
		}
		return aList;
	}
	public int insertProcess(CreateDTO cre){
		int cnt = 0;
		
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_INSERT);
			pstmt.setString(1, cre.getCID());
			pstmt.setString(2, cre.getCPW());
			pstmt.setString(3, cre.getCemail());
			pstmt.setString(4, cre.getCname());
			pstmt.setString(5, cre.getCnumber());
			pstmt.setString(6, cre.getCaccount());
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(pstmt, conn);
		}
		System.out.println(cnt);
		return cnt;
	}
	
	public ArrayList<RegisterDTO> selectMemberList() throws SQLException{
		ArrayList<RegisterDTO> aList = new ArrayList<RegisterDTO>();
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_LIST);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				RegisterDTO rd = new RegisterDTO();
				rd.setMemberid(rs.getString("ID"));
				rd.setPassword(rs.getString("passwd"));
				rd.setEmail(rs.getString("email"));
				rd.setName(rs.getString("name"));
				rd.setNumber(rs.getString("number"));
				rd.setPoint(rs.getInt("point"));
				rd.setAccount(rs.getString("account"));
				aList.add(rd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCutil.close(rs,  pstmt, conn);
		}
		return aList;
	}
}