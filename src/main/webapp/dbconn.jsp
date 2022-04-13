<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "MONEYBOOK";
		String password = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (SQLException e) {
		out.println("데이터베이스 연결이 실패했습니다.<br>");
		out.println("SQLException: " + e.getMessage());
	}
%>