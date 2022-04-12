<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<meta charset="UTF-8">

<title>Account Page</title>
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div class="container mt-5">
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false">계좌선택</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="#">전체</a></li>
				<li><a class="dropdown-item" href="#">국민은행</a></li>
				<li><a class="dropdown-item" href="#">기업은행</a></li>
			</ul>
			<button type="button" class="btn btn-primary" onClick="location.href='account.jsp'">내역확인</button>
			<button type="button" class="btn btn-primary" onClick="location.href='editAccount.jsp'">내역수정</button>
			<button type="button" class="btn btn-primary" onClick="location.href='searchAccount.jsp'">내역검색</button>
		</div>


		<div class="form-group mt-3">
			<label class="form-label mt-4"><h3>내역수정</h3></label>
			<div class="form-group">
				<div class="input-group mb-1" role="group" aria-label="Basic radio toggle button group">
					<span class="input-group-text">거래유형</span> 
					<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="checked"> 
					<label class="btn btn-outline-primary" for="btnradio1">입금</label> 
					<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"> 
					<label class="btn btn-outline-primary" for="btnradio2">출금</label>
					<span class="input-group-text">은행명</span> 
					<input type="text" class="form-control" aria-label="">
					<span class="input-group-text">계좌번호</span> 
					<input type="text" class="form-control" aria-label="">
					<span class="input-group-text">거래날짜</span> 
					<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4"/>

				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">금액</span> 
					<input type="text" class="form-control" aria-label="">
					<span class="input-group-text">세부내용</span> 
					<input type="text" class="form-control" aria-label="">
					<button class="btn btn-primary" type="button" id="button-addon2">추가</button>
				</div>
			</div>
		</div>






		<div class="container mt-3">
			<label class="form-label mt-4"><h3>세부내역</h3></label>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">구분</th>
						<th scope="col">은행명</th>
						<th scope="col">계좌번호</th>
						<th scope="col">거래유형</th>
						<th scope="col">금액</th>
						<th scope="col">세부내용</th>
						<th scope="col">거래날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr class="table-success">
						<th scope="row">1</th>
						<td>국민은행</td>
						<td>201-15552-18215</td>
						<td>입금</td>
						<td>+2,000,000</td>
						<td>6월 급여</td>
						<td>2022-04-11(월)</td>
					</tr>
					<tr class="table-danger">
						<th scope="row">2</th>
						<td>국민은행</td>
						<td>201-15552-18215</td>
						<td>출금</td>
						<td>-1,500</td>
						<td>컴포즈커피 아메리카노</td>
						<td>2022-04-11(월)</td>
					</tr>
					<tr class="table-warning">
						<th scope="row">3</th>
						<td>국민은행</td>
						<td>201-15552-18215</td>
						<td>입금</td>
						<td>-1,000,000</td>
						<td>우리은행 이체</td>
						<td>2022-04-11(월)</td>
					</tr>
					<tr class="table-default">
						<th scope="row"></th>
						<td></td>
						<td></td>
						<td></td>
						<td>잔액 :</td>
						<td>998,500원</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	
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
	

	<%@ include file="footer.jsp"%>
</body>
</html>