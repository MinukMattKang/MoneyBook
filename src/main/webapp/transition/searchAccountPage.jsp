<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<meta charset="UTF-8">

<title>Account Page</title>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div class="container mt-5">
		<c:choose>
			<c:when test="${empty sessionId}">
				<%@ include file="../notPermittedPage.jsp" %>
			</c:when>
			<c:otherwise>
				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">계좌선택</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="#">전체</a></li>
						<li><a class="dropdown-item" href="#">국민은행</a></li>
						<li><a class="dropdown-item" href="#">기업은행</a></li>
					</ul>
					<button type="button" class="btn btn-primary" onClick="location.href='accountPage.jsp'">내역확인</button>
<!-- 					<button type="button" class="btn btn-primary" onClick="location.href='editAccount.jsp'">내역수정</button> -->
					<button type="button" class="btn btn-primary" onClick="location.href='searchAccountPage.jsp'">내역검색</button>
				</div>
				<%@ include file="searchTransitionHistory.jsp"%>
				<%@ include file="transitionHistory4search.jsp"%>
				
				<div class="container row" style="float: none; margin:0 auto;"> 
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