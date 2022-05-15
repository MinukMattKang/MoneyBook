<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<% 
	String ID = (String) session.getAttribute("sessionId"); 
	int idx = Integer.parseInt(request.getParameter("idx"));
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<style>
	th {
		padding: 5px;
		font-size: 1.1rem;
	}
</style>


<title>Memo Page</title>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div class="container mt-5">
		<c:choose>
			<c:when test="${empty sessionId}">
				<%@ include file="../notPermittedPage.jsp" %>
			</c:when>
			<c:otherwise>
			
			
			
			<h2>메모 수정</h2>
			
			<% 	
				String sql = "SELECT * FROM MEMO WHERE IDX = ?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
			%>
			
			<div class="container" align="center" style="padding: 30px">
				<form method="post" action="processEditMemo.jsp" accept-charset="UTF-8">
					<div class="card border-primary mb-3">
						<table style="margin: 30px; margin-bottom:15px">
							<thread>
								<tr>
									<th>글 제목</th>
								</tr>
								<tr>
									<td>
										<input type="text" class="form-control" maxlength="50" name="title" value="<%= rs.getString("TITLE") %>"/>
									</td>
								</tr>
							</thread>
							<tobody>
								<tr>
									<th style="padding-top: 20px" >내용</th>
								</tr>
								<tr>
									<td><textarea class="form-control" maxlength="2048" style="height: 400px;" name="content" ><%= (rs.getString("CONTENT")).trim() %></textarea></td>
									<td>
										<input style="display: none;" name="idx" value="<%= Integer.parseInt(rs.getString("IDX")) %>" />
									</td>
								</tr>
								
							</tobody>
						</table>
						<div align="right" style="margin-bottom: 15px; margin-right: 30px">
							<a type="button" class="btn btn-primary" onclick="location.href='./memoPage.jsp'">취소</a>
							<input type="submit" class="btn btn-primary" value="완료"></input>
						</div>
					</div>
				</form>
			</div>
			
			<%
				}
				if (rs != null) { rs.close(); }
				if (pstmt != null) { pstmt.close(); }
				if (conn != null) { conn.close(); }
			%>	
				
			
			</c:otherwise>
		</c:choose>

		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>
