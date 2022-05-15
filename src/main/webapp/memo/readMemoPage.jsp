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
			
			
			
			<h2>메모</h2>
			
			<% 	
				String sql = "SELECT * FROM MEMO WHERE IDX= ?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				if(rs.next()) {
			%>
			<div class="container" align="center" style="padding: 30px">
				<div class="card border-primary mb-3">
					<table style="margin: 30px; margin-bottom:15px">
						<thread>
							<tr>
								<th>제목</th>
							</tr>
							<tr>
								<td>
									<input type="text" class="form-control" maxlength="50" name="title" value="<%= rs.getString("TITLE") %>"  readonly="readonly" />
								</td>
							</tr>
						</thread>
						<tobody>
							<tr>
								<th style="padding-top: 20px" >내용</th>
							</tr>
							<tr>
								<td><textarea class="form-control" maxlength="2048" style="height: 400px;" name="content" readonly ><%= (rs.getString("CONTENT")).trim() %></textarea></td>
							</tr>
						</tobody>
					</table>
					<div align="right" style="margin-bottom: 15px; margin-right: 30px">
						<a type="button" class="btn btn-primary" onclick="location.href='./memoPage.jsp'">뒤로</a>
						<button class="btn btn-primary" onclick="editContent('<%= rs.getString("IDX") %>')">수정</button>
						<button class="btn btn-primary" onclick="deleteContent('<%= rs.getString("IDX") %>')">삭제</button>
					</div>
				</div>
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

<script>
	function editContent(idx) {
		location.href = "./editMemoPage.jsp?idx=" + idx;
	}
	function deleteContent(idx) {
		if (confirm("해당 메모를 삭제하시겠습니까?") == true) {
			location.href = "./processDeleteMemo.jsp?idx=" + idx;
		} else {
			return;
		}
	}
</script>