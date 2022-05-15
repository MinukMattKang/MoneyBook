<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String bank = request.getParameter("bank");
	String accountNumber = request.getParameter("accountNumber");
	String type = request.getParameter("type");
	String amountStr = request.getParameter("amount");
	String content = request.getParameter("content");
	String datetime = request.getParameter("datetime");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	Integer amount;
	if (amountStr.isEmpty()) {
		amount = 0;
	} else {
		amount = Integer.valueOf(amountStr);
	}
	
	String sql = "UPDATE ACCOUNT SET BANK=?, TYPE=?, AMOUNT=?, CONTENT=?, DATETIME=?, ACCOUNT_NUMBER=? WHERE IDX=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bank);
	pstmt.setString(2, type);
	pstmt.setInt(3, amount);
	pstmt.setString(4, content);
	pstmt.setString(5, datetime);
	pstmt.setString(6, accountNumber);
	pstmt.setInt(7, idx);
	pstmt.executeUpdate();
	
	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }
	
	response.sendRedirect("searchAccountPage.jsp");
%>