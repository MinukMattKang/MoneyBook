<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));

	String sql = "SELECT * FROM ACCOUNT";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		sql = "DELETE FROM ACCOUNT WHERE IDX = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
	} else {
		out.println("일치하는 내역이 없습니다.");
	}
	
	if (rs != null) { rs.close(); }
	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }
	
	response.sendRedirect("searchAccountPage.jsp");
%>
