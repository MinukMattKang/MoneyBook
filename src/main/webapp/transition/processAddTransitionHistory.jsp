<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%

	request.setCharacterEncoding("UTF-8");

	String ID = (String) session.getAttribute("sessionId");
			
	String sql = "SELECT * FROM ACCOUNT";
	pstmt = conn.prepareStatement(sql);

	String bank = request.getParameter("bank");
	String accountNumber = request.getParameter("accountNumber");
	String type = request.getParameter("type");
	String amountStr = request.getParameter("amount");
	String content = request.getParameter("content");
	String datetime = request.getParameter("datetime");
		
	Integer amount;
	if (amountStr.isEmpty()) {
		amount = 0;
	} else {
		amount = Integer.valueOf(amountStr);
		if(type.equals("출금")){
			amount = -amount;
		}
	}
	
	
	
	sql = "INSERT INTO ACCOUNT VALUES(?,?,?,?,?,?,?,account_seq.nextval)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bank);
	pstmt.setString(6, accountNumber);
	pstmt.setString(2, type);
	pstmt.setInt(3, amount);
	pstmt.setString(4, content);
	pstmt.setString(5, datetime);
	pstmt.setString(7, ID);
	pstmt.executeUpdate();
	
	


	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }
	
	response.sendRedirect("accountPage.jsp");
%>