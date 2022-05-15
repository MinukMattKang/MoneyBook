package com.moneybook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.moneybook.dto.MemoDTO;

public class MemoDAO {

	private static MemoDAO instance;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static MemoDAO getInstance() {
		if(instance == null) {
			instance = new MemoDAO();
		}
		return instance;
	}
	
	public MemoDAO() {
		try {
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user = "MONEYBOOK";
			String password = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("데이터베이스 연결이 실패했습니다.<br>");
			System.out.println("SQLException: " + e.getMessage());
		}
	}
	
	// 현재시간 호출
	public String getDate() {
		String sql = "SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	// 메모등록
	public int add(String id, String title, String content) {
		String sql = "INSERT INTO MEMO VALUES (memo_seq.nextval, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, getDate());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}
		return -1;
	}
	
	// 메모수정
	public int edit(String title, String content, int idx) {
		String sql = "UPDATE MEMO SET TITLE=?, CONTENT=?, REGIST_DAY=? WHERE IDX=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, getDate());
			pstmt.setInt(4, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}
		return -1;
	}
	
	//페이징
//	public ArrayList<MemoDTO> getList(int pageNum) {
//		String sql = "SELECT * FROM MEMO WHERE ID = ? ORDER BY IDX DESC ROWNUM <= 8";
//		ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setInt(1, getNext() - (pageNum - 1) * 10);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				MemoDTO memo = new MemoDTO();
//				memo.setTitle(rs.getString("title"));
//				memo.setContent(rs.getString("content"));
//				memo.setRegistDay(rs.getString("regist_day"));
//				list.add(memo);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {									
//				if (pstmt != null) 
//					pstmt.close();				
//				if (conn != null) 
//					conn.close();
//			} catch (Exception ex) {
//				throw new RuntimeException(ex.getMessage());
//			}	
//		}
//		return list;
//	}
	
	
	
	
	
	
	
//	public int write(String id, String title, String content) {
//		String sql = "INSERT INTO MEMO VALUES (seq_memo.nextval, ?, ?, ?, ?)";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setString(2, title);
//			pstmt.setString(3, content);
//			pstmt.setString(4, getDate());
//			return pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return -1;
//	}
	
//	게시글 번호
//	public String getNext() {
//		String sql = "SELECT 게시글번호 FROM MEMO ORDER BY 게시글번호 DESC";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			return 1;  // 첫 게시물일 경우
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return -1;
//	}
	
}
