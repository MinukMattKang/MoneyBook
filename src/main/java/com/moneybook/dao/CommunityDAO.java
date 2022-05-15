package com.moneybook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.moneybook.dto.CommunityDTO;

import com.moneybook.database.DBConnection;

public class CommunityDAO {

	private static CommunityDAO instance;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static CommunityDAO getInstance() {
		if(instance == null) {
			instance = new CommunityDAO();
		}
		return instance;
	}
	
	public CommunityDAO() {
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
	
	// 커뮤니티 글 등록
	public int add(String id, String title, String content) {
		String sql = "INSERT INTO COMMUNITY VALUES (community_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
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

	
	
//	커뮤니티 글 수정
	public int edit(String title, String content, int idx) {
	String sql = "UPDATE COMMUNITY SET TITLE=?, CONTENT=?, MODIFIED=1 WHERE IDX=?";
	try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, idx);
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
	
	//테이블의 레코드 개수
//		public int getListCount(String items, String text) {
//			
//			int x = 0;
//
//			String sql;
//			
//			if (items == null && text == null)
//				sql = "SELECT COUNT(*) FROM COMMUNITY";
//			else
//				sql = "SELECT COUNT(*) FROM COMMUNITY WHERE " + items + " like '%" + text + "%'";
//			
//			try {
//				conn = DBConnection.getConnection();
//				pstmt = conn.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//
//				if (rs.next()) 
//					x = rs.getInt(1);
//				
//			} catch (Exception ex) {
//				System.out.println("getListCount() 에러: " + ex);
//			} finally {			
//				try {				
//					if (rs != null) 
//						rs.close();							
//					if (pstmt != null) 
//						pstmt.close();				
//					if (conn != null) 
//						conn.close();												
//				} catch (Exception ex) {
//					throw new RuntimeException(ex.getMessage());
//				}		
//			}		
//			return x;
//		}
	
	
	
		
		// 테이블의 레코드 가져오기
		public ArrayList<CommunityDTO> getList(int pageNumber) {
			
			String sql = "SELECT * FROM COMMUNITY WHERE ROWNUM < 10 ORDER BY IDX DESC;";
			ArrayList<CommunityDTO> list = new ArrayList<CommunityDTO>();

			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					CommunityDTO community = new CommunityDTO();
					community.setIdx(rs.getInt("IDX"));
					community.setId(rs.getString("id"));
					community.setTitle(rs.getString("title"));
					community.setContent(rs.getString("Content"));
					community.setRegistDay(rs.getString("regist_day"));
					community.setLikeNum(rs.getInt("like_num"));
					community.setDislikeNum(rs.getInt("dislike_num"));
					community.setReadNum(rs.getInt("read_num"));
					community.setModified(rs.getInt("modified"));
					community.setModified(rs.getInt("comment_num"));
					list.add(community);
				}
			} catch (Exception ex) {
				System.out.println("getBoardList() 에러 : " + ex);
			} finally {
				try {
					if (rs != null) 
						rs.close();							
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}			
			}
			return list;
		}
		
	
		
		
//		//선택된 글의 조회수 증가하기
//		public void updateReadNum(int idx) {
//
//			try {
//				conn = DBConnection.getConnection();
//
//				String sql = "SELECT READ_NUM FROM COMMUNITY WHERE IDX = ? ";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, idx);
//				rs = pstmt.executeQuery();
//				int readNum = 0;
//
//				if (rs.next())
//					readNum = rs.getInt("READ_NUM") + 1;
//			
//
//				sql = "UPDATE COMMUNITY SET READ_NUM = ? WHERE IDX = ?";
//				pstmt = conn.prepareStatement(sql);		
//				pstmt.setInt(1, readNum);
//				pstmt.setInt(2, idx);
//				pstmt.executeUpdate();
//			} catch (Exception ex) {
//				System.out.println("updateHit() 에러 : " + ex);
//			} finally {
//				try {
//					if (rs != null) 
//						rs.close();							
//					if (pstmt != null) 
//						pstmt.close();				
//					if (conn != null) 
//						conn.close();
//				} catch (Exception ex) {
//					throw new RuntimeException(ex.getMessage());
//				}			
//			}
//		}
		
	
//		//선택된 글 상세 내용 가져오기
//		public CommunityDTO getBoardByNum(int idx, int page) {
//
//			CommunityDTO board = null;
//
//			updateReadNum(idx);
//			String sql = "SELECT * FROM COMMUNITY WHERE IDX = ? ";
//
//			try {
//				conn = DBConnection.getConnection();
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, idx);
//				rs = pstmt.executeQuery();
//
//				if (rs.next()) {
//					CommunityDTO community = new CommunityDTO();
//					community.setIdx(rs.getInt("IDX"));
//					community.setId(rs.getString("id"));
//					community.setTitle(rs.getString("title"));
//					community.setContent(rs.getString("Content"));
//					community.setRegistDay(rs.getString("regist_day"));
//					community.setLikeNum(rs.getInt("like_num"));
//					community.setDislikeNum(rs.getInt("dislike_num"));
//					community.setReadNum(rs.getInt("read_num"));
//					community.setModified(rs.getInt("modified"));
//				}
//				
//				return board;
//			} catch (Exception ex) {
//				System.out.println("getBoardByNum() 에러 : " + ex);
//			} finally {
//				try {
//					if (rs != null) 
//						rs.close();							
//					if (pstmt != null) 
//						pstmt.close();				
//					if (conn != null) 
//						conn.close();
//				} catch (Exception ex) {
//					throw new RuntimeException(ex.getMessage());
//				}		
//			}
//			return null;
//		}
	
	
	
	
	
	
	
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
