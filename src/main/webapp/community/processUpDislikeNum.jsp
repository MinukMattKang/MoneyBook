<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));

	String sql = "UPDATE COMMUNITY SET DISLIKE_NUM = DISLIKE_NUM + 1 WHERE IDX = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.executeUpdate();
	
	sql = "UPDATE COMMUNITY SET READ_NUM = READ_NUM - 1 WHERE IDX = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.executeUpdate();
	
	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }
	
	response.sendRedirect("readCommunityPage2.jsp?idx=" + idx);
%>