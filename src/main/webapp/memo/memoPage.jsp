<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<% String ID = (String) session.getAttribute("sessionId"); %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<style>
.card-header {
	text-align: right;
}

#con {
	display: flex;
/* 	flex-direction: row; */
	flex-flow: wrap;
}

#textCon {
	width: 25rem; 
	min-width:25rem; 
	height: 10rem; 
	margin: 10px; 
}

a:link, :visited {
  color : black;
}

a:hover, :active {
  color : orangered;
}

</style>

<script>
	function readMemo(idx) {	
		location.href = "./readMemoPage.jsp?idx=" + idx;

	}
</script>




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
			
			<h2>메모장</h2>
			
			<div id="con" class="container mt-5">
				<a href="./addMemoPage.jsp" style="text-decoration : none; text-">
					<div class="card border-primary mb-3" id="textCon">
				  		<div class="card-body">
				  			<button onclick="location.href='./addMemoPage.jsp'" class="btn btn-lg btn-primary" type="button" style="margin: auto; margin-top: 42px; display: block">+</button>
						</div>
					</div>
				</a>
				
				<% 	
					String sql = "SELECT * FROM MEMO WHERE ID=? ORDER BY IDX DESC"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, ID);
					rs = pstmt.executeQuery();
					int i = 1;
					while(rs.next()) {
				%>
				<a href="#" onclick="readMemo(<%= rs.getString("idx") %>)" style="text-decoration : none;">
					<div class="card border-primary mb-3" id="textCon">
						<div class="card-header"><%= (rs.getString("REGIST_DAY")).substring(0, 10) %></div>
						<div class="card-body">
							<h4 class="card-title" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><%= rs.getString("TITLE") %></h4>
						    <p class="card-text" style="display: -webkit-box; overflow: hidden; -webkit-line-clamp: 2 ; -webkit-box-orient: vertical;"><%= rs.getString("CONTENT") %></p>
						</div>
					</div>
				</a>
				
				<%
					}
					if (rs != null) { rs.close(); }
					if (pstmt != null) { pstmt.close(); }
					if (conn != null) { conn.close(); }
				%>
				
			</div>
			
			
			
			
		
			
			<div class="container row mt-5" style="float: none; margin:0 auto;"> 
					<div class="col-md-3" style="float: none; margin:0 auto;">
						<div>
						  <ul class="pagination">
						    <li class="page-item disabled">
						      <a class="page-link" href="#">&laquo;</a>
						    </li>
						    <li class="page-item active">
						      <a class="page-link" href="#">1</a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="#">2</a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="#">3</a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="#">4</a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="#">5</a>
						    </li>
						    <li class="page-item">
						      <a class="page-link" href="#">&raquo;</a>
						    </li>
						  </ul>
						</div>
					</div>
				</div>
				
			
			</c:otherwise>
		</c:choose>

		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>
