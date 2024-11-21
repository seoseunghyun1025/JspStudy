package com.java.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; 
	
	private final static String USER_FIND = "select * from members where ID=?;";
	private final static String USER_PREDICTION = "select * from prediction where ID=?;";
	public int deleteProcessWin(String dDto){
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_PREDICTION);
			pstmt.setString(1,dDto);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql = "delete from prediction where id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, dDto);
                pstmt.executeUpdate();
                return 1;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return -2;
	}
	
	public int deleteProcess(String dDto){
		try {
			conn = JDBCutil.getConnection();
			pstmt = conn.prepareStatement(USER_FIND);
			pstmt.setString(1,dDto);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String sql = "delete from members where id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, dDto);
                pstmt.executeUpdate();
                return 1;
			}
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCutil.close(rs, pstmt, conn);
		}
		return -2;
	}
}
