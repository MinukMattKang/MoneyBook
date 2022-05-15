<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
	#idx {
	display: none;
	}

</style>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String idx = request.getParameter("idx");

	String sql = "SELECT * FROM ACCOUNT WHERE IDX = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, idx);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		String bank = rs.getString("bank");
		String accountNumber = rs.getString("account_number");
		String type = rs.getString("type");
		String amount = rs.getString("amount");
		String content = rs.getString("content");
		String datetime = (rs.getString("datetime")).substring(0, 10);
	

%>

<div class="container mt-5">
	<div class="form-group mt-3">
		<label class="form-label mt-4"><h3>내역수정</h3></label>
		<div class="form-group">
			<form name="newTransitionHistory" action="./processEditTransitionHistory.jsp" method="post">
				<div class="input-group mb-1" role="group" aria-label="Basic radio toggle button group">
					<span class="input-group-text">거래유형</span> 
					<input type="radio" class="btn-check" name="type" id="income" value="입금" <% if(type.equals("입금")) { %> checked="checked" <% } %>> 
					<label class="btn btn-outline-primary" for="income">입금</label> 
					<input type="radio" class="btn-check" name="type" id="expenditure" value="출금" <% if(type.equals("출금")) { %> checked="checked" <% } %>> 
					<label class="btn btn-outline-primary" for="expenditure">출금</label>
					<span class="input-group-text">은행명</span> 
					<input type="text" class="form-control" name="bank" value="<%=bank%>">
					<span class="input-group-text">계좌번호</span> 
					<input type="text" class="form-control" name="accountNumber" value="<%=accountNumber%>">
					<span class="input-group-text">거래날짜</span> 
					<input type="text" class="form-control" name="datetime" value="<%=datetime%>">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">금액</span> 
					<input type="text" class="form-control" name="amount" value="<%=amount%>">
					<span class="input-group-text">세부내용</span> 
					<input type="text" class="form-control" name="content" value="<%=content%>">
					<div id="idx">
						<input type="text" class="form-control" name="idx" value="<%=idx%>">
					</div>
					<input class="btn btn-primary" type="submit" value="수정">
				</div>
			</form>
		</div>
	</div>
</div>

<% 
	}
	if (rs != null) { rs.close(); }
	if (pstmt != null) { pstmt.close(); }
	if (conn != null) { conn.close(); }

%>