<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<%@ include file="dbconn.jsp" %>

<div class="container mt-3">
	<label class="form-label mt-4"><h3>세부내역</h3></label>
	<table class="table table-hover">
		<tr>
			<th scope="col">구분</th>
			<th scope="col">은행명</th>
			<th scope="col">계좌번호</th>
			<th scope="col">거래유형</th>
			<th scope="col">금액</th>
			<th scope="col">세부내용</th>
			<th scope="col">거래날짜</th>
		</tr>
		<tbody>
			<tr>
				<% 	
					String sql = "SELECT * FROM ACCOUNT";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					int i = 1;
					while(rs.next()) {
				%>
				<td><%= i++ %></td>
				<td><%= rs.getString("bank") %></td>
				<td><%= rs.getString("account_number") %></td>
				<td><%= rs.getString("type") %></td>
				<td><%= rs.getString("amount") %></td>
				<td><%= rs.getString("content") %></td>
				<td><%= rs.getString("datetime") %></td>
			<tr>
		</tbody>
				<%
					}
					if (rs != null) { rs.close(); }
					if (pstmt != null) { pstmt.close(); }
					if (conn != null) { conn.close(); }
				%>
	</table>
</div>