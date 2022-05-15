<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.moneybook.dto.CommunityDTO" %>
<%@ include file="../dbconn.jsp" %>
<% String ID = (String) session.getAttribute("sessionId"); 
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

<script>
	function editContent(idx) {
		location.href = "./editCommunityPage.jsp?idx=" + idx;
	}
	
	function deleteContent(idx) {
		if (confirm("해당 커뮤니티 글을 삭제하시겠습니까?") == true) {
			location.href = "./processDeleteCommunity.jsp?idx=" + idx;
		} else {
			return;
		}
	}
	
	function upLikeNum(idx) {
		location.href="./processUpLikeNum.jsp?idx=" + idx;
	}
	
	function upDislikeNum(idx) {
		location.href="./processUpDislikeNum.jsp?idx=" + idx;
	}
	
	function addComment(idx) {	
		if (confirm("해당 댓글을 남기시겠습니까?") == true) {
			location.href = "./processAddComment.jsp?idx=" + idx;
		} else {
			return;
		}
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

			
				<h2>커뮤니티</h2>
				
				<% 	
					// 조회수 증가
					String sql = "UPDATE COMMUNITY SET READ_NUM = READ_NUM + 1 WHERE IDX = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, idx);
					pstmt.executeUpdate();
					
					// 세부내용 불러오기
					sql = "SELECT * FROM COMMUNITY WHERE IDX = ?"; 
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, idx);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						String writer = rs.getString("ID");
				%>
				<div class="container" align="center" style="padding: 30px">
					<div class="card border-primary mb-3">
						<table style="margin: 30px; margin-bottom:30px;  margin-top: 20px;">
							<thead>
								<tr>
									<th colspan="7">제목</th>
								</tr>
								<tr>
									<td colspan="7">
										<input type="text" class="form-control" maxlength="50" name="title" value="<%= rs.getString("TITLE") %>"  readonly="readonly" />
									</td>
									
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<th style="padding-top: 20px" >작성자</th>
									<th style="padding-top: 20px" >작성일</th>
									
									<th style="padding-top: 20px" >좋아요▲</th>
									<th style="padding-top: 20px" >싫어요▼</th>
									<th style="padding-top: 20px" >조회수</th>
								</tr>
								<tr>
									<td>
										<input type="text" class="form-control" maxlength="50" name="id" value="<%= rs.getString("ID") %>"  readonly="readonly" />
									</td>
									<td>
										<input type="text" class="form-control" maxlength="50" name="registDay" value="<%= (rs.getString("REGIST_DAY")).substring(0, 10)  %>"  readonly="readonly" />
									</td>
									<td>
										<input type="text" class="form-control" maxlength="50" name="id" value="<%= rs.getInt("LIKE_NUM") %>"  readonly="readonly" />
									</td>
									<td>
										<input type="text" class="form-control" maxlength="50" name="id" value="<%= rs.getInt("DISLIKE_NUM") %>"  readonly="readonly" />
									</td>
									<td>
										<input type="text" class="form-control" maxlength="50" name="id" value="<%= rs.getInt("READ_NUM") %>"  readonly="readonly" />
									</td>
								</tr>
								<tr>
									<th style="padding-top: 20px" colspan="7">내용</th>
								</tr>
								<tr>
									<td colspan="7"><textarea class="form-control" maxlength="2048" style="height: 400px;" name="content" readonly><%= rs.getString("CONTENT") %></textarea></td>
								</tr>
								
								<tr>
									<td colspan="4">
										<button class="btn btn-primary" style="margin-top: 12px" onclick="upLikeNum(<%= rs.getInt("IDX") %>)">좋아요▲</button>
										<button class="btn btn-primary" style="margin-top: 12px" onclick="upDislikeNum(<%= rs.getInt("IDX") %>)">싫어요▼</button>
									</td>
									<td colspan="3" align="right">
										<a type="button" class="btn btn-primary" style="margin-top: 12px" onclick="location.href='./communityPage.jsp'">뒤로</a>
										<% if (sessionId.equals(writer)) { %>
											<button class="btn btn-primary" style="margin-top: 12px" onclick="editContent('<%= rs.getInt("IDX") %>')">수정</button>
											<button class="btn btn-primary" style="margin-top: 12px" onclick="deleteContent('<%= rs.getInt("IDX") %>')">삭제</button>
										<% } %>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
					
					
				<div class="container" align="center" style="padding: 30px; margin-top:-60px;">
					<div class="card border-primary mb-3">
						<table style="margin: 30px; margin-bottom:15px; margin-top: 15px;">
							
							<thead>
								<tr>
									<th colspan="7">댓글</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="7"><textarea class="form-control" maxlength="2048" style="height: 80px;" name="content">
									</textarea></td>
								</tr>
								<tr>
									<td colspan="7" align="right">
										<a type="button" class="btn btn-primary" style="margin-top: 12px" onclick="location.href='processAddComment.jsp'">추가</a>
									</td>
								</tr>
							</tbody>
						</table>
						<% for(int i=0; i < 10; i++) { %>
						<table class="card" style="display: flex; margin: 30px; margin-bottom:15px; margin-top: 0px; min-height: 64px">
							<tr>
								<td>
									<p style="width: 140px; margin-left:10px; margin-top:25px; height: 30px">작성자 아이디<%= i %></p>
								</td>
								<td>
									<p style="width: 780px;  margin-top:25px; height: 30px">이곳은 댓글 내용입니다. 이곳은 댓글 내용입니다. 이곳은 댓글 내용입니다.</p>
								</td>
								<td>
									<p style="width: 100px;  margin-top:25px; height: 30px">2022-05-1<%= i %></p>
								</td>
								<td>
									<button class="btn btn-primary" onclick="#">수정</button>
									<button class="btn btn-primary" onclick="#">삭제</button>
								</td>
							</tr>
						</table>
						<% } %>
	
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