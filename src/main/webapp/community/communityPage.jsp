<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="com.moneybook.dao.CommunityDAO" %>
<%@ page import="com.moneybook.dto.CommunityDTO" %>
<%@ include file="../dbconn.jsp" %>
<% 
	List<String[]> list = new ArrayList<String[]>();
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
	th, td {
	text-align: center;
	}
</style>

<script>
	function addCommunity() {
		if (${empty sessionId}) {
			alert("로그인이 필요한 서비스입니다.");
		} else {
			location.href = "./addCommunityPage.jsp";
		};
	};
	
	function readCommunity(idx) {	
		location.href = "./readCommunityPage2.jsp?idx=" + idx;

	}
</script>



<title>Community Page</title>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div class="container mt-5">

			
			<h2>커뮤니티</h2>
			
			

			
			<div class="container mt-3">
				<table class="table table-hover" style="padding-top: 50px">
				<thead>
					<tr>
				    	<th scope="col" style="text-align: center;">번호</th>
				    	<th scope="col">제목</th>
				    	<th scope="col">작성일</th>
				    	<th scope="col">작성자</th>
				    	<th scope="col">조회수</th>
				    	<th scope="col">댓글</th>
				    	<th scope="col">좋아요</th>
				    	<th scope="col">싫어요</th>
				    </tr>
				</thead>
				
				<%
				
					// 구분번호
					String sql = "SELECT * FROM COMMUNITY";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					int i = list.size();
					while(rs.next()) {
						String totalNum[] = {rs.getString("idx")};
						list.add(totalNum);
						i = list.size();
					}
				
				
					sql = "SELECT * FROM COMMUNITY ORDER BY IDX DESC";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						
						
					
				%>
				    <tr onclick="readCommunity(<%= rs.getInt("idx")%>)">
			
					    <td style="width: 8%;"><%= i-- %></td>
					    
					    <td style="width: 35%; text-align: left;"><%= rs.getString("title") %></td>
					    <td style="width: 12%; text-align: left;">
					    	<% if( rs.getInt("modified") == 1) { %>
					    	<%= (rs.getString("regist_day")).substring(0, 10) %> (수정됨)<% } else { %>
					    	<%= (rs.getString("regist_day")).substring(0, 10) %><% } %>
					    </td>
					    <td style="width: 15%;"><%= rs.getString("id") %></td>
				      	<td style="width: 5%;"><%= rs.getInt("read_num") %></td>
				      	<td style="width: 5%;"><%= rs.getInt("comment_num") %></td>
				      	<td style="width: 5%;"><%= rs.getInt("like_num") %></td>
					    <td style="width: 5%;"><%= rs.getInt("dislike_num") %></td>
				    </tr>
				    
				<% 
					}
					if (rs != null) 
						rs.close();							
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();
				%>
				    
				</table>
			</div>
			
			
			<div>
			
			
			</div>
			
			
			
			<div class="container row mt-2" style="float: none; margin:0 auto;"> 
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
				
				
				<div class="container" style="height: 50px">
					<div style="float: left">
						<select  name="items" class="txt" style="width: 100px; height:34px">
								<option value="title">제목</option>
								<option value="content">본문</option>
								<option value="titleAndContent">제목+본문</option>
								<option value="writer">작성자</option>
						</select>
						<input type="text" width="16px" style="width: 150px; height:34px"/>
						<button class="btn btn-primary">검색</button>
					</div>
					<div align="right" style="float: right">
						<button class="btn btn-primary" class="btn btn-primary" onclick="addCommunity()">글쓰기</button>
						
					</div>
				</div>


		<%@ include file="../footer.jsp"%>
	</div>
</body>
</html>


