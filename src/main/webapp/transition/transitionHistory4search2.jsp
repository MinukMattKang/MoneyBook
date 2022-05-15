<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	String ID = (String) session.getAttribute("sessionId"); 
	request.setCharacterEncoding("UTF-8");
%>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<%@ include file="../dbconn.jsp" %>

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
			<th scope="col">수정/삭제</th>
		</tr>
		<tbody>
			<tr>
				<% 	
					String sql = "SELECT * FROM ACCOUNT WHERE ID = ? ORDER BY DATETIME DESC";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ID);
					
					String bank = request.getParameter("bank");
					String accountNumber = request.getParameter("accountNumber");
					String type = request.getParameter("type");
					String datetime = request.getParameter("datetime");
					
					
					
					// ******* 하드코딩이라서 나중에 수정 필요****
					String defaultStmt = "SELECT * FROM ACCOUNT WHERE ID=? ORDER BY DATETIME DESC";
					// 전체 미선택
					if(bank.isEmpty() && accountNumber.isEmpty() && type==null && datetime.isEmpty()) {
						sql = defaultStmt;
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
					}
					
					// 1개 항목 선택
					if(!bank.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
					}
					
					if(!accountNumber.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND ACCOUNT_NUMBER=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, accountNumber);
					}
					
					if(type!=null) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND TYPE=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, type);
					}
					
					if(!datetime.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, datetime);
					}
					
					// 2개 항목 선택
					if(!bank.isEmpty() && !accountNumber.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? AND ACCOUNT_NUMBER=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
						pstmt.setString(3, accountNumber);
					}
					
					if(!bank.isEmpty() && type!=null) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? AND TYPE=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
						pstmt.setString(3, type);
					}
					
					if(!bank.isEmpty() && !datetime.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
						pstmt.setString(3, datetime);
					}
					
					if(!accountNumber.isEmpty() && type!=null) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND ACCOUNT_NUMBER=? AND TYPE=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, accountNumber);
						pstmt.setString(3, type);
					}
					
					if(!accountNumber.isEmpty() && !datetime.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND ACCOUNT_NUMBER=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, accountNumber);
						pstmt.setString(3, datetime);
					}
					
					if(type!=null && !datetime.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND TYPE=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, type);
						pstmt.setString(3, datetime);
					}
					
					// 3개 항목 선택
					if(!bank.isEmpty() && !accountNumber.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? AND ACCOUNT_NUMBER=? AND TYPE=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
						pstmt.setString(3, accountNumber);
						pstmt.setString(4, type);
					}
					
					if(!bank.isEmpty() && !accountNumber.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? AND ACCOUNT_NUMBER=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
						pstmt.setString(3, accountNumber);
						pstmt.setString(4, datetime);
					}
					
					if(!bank.isEmpty() && !accountNumber.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND BANK=? AND TYPE=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, bank);
						pstmt.setString(3, type);
						pstmt.setString(4, datetime);
					}
					
					if(!bank.isEmpty() && !accountNumber.isEmpty()) {
						sql = "SELECT * FROM ACCOUNT WHERE ID=? AND ACCOUNT_NUMBER=? AND TYPE=? AND DATETIME=? ORDER BY DATETIME DESC";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, ID);
						pstmt.setString(2, accountNumber);
						pstmt.setString(3, type);
						pstmt.setString(4, datetime);
					}
					// ***하드코딩 끝***

					
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
				<td><%= (rs.getString("datetime")).substring(0,10) %></td>
				<td>
					<button class="btn btn-primary" onclick="editContent('<%= rs.getString("idx") %>')">수정</button>
					<button class="btn btn-primary" onclick="deleteContent('<%= rs.getString("idx") %>')">삭제</button>
				</td>
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

<script>
	function editContent(idx) {
		location.href = "./editTransitionHistory.jsp?idx=" + idx;
	}

	function deleteContent(idx) {
		if (confirm("해당 내역을 삭제하시겠습니까?") == true) {
			location.href = "./processDeleteTransitionHistory.jsp?idx=" + idx;
		} else {
			return;
		}
	}
</script>