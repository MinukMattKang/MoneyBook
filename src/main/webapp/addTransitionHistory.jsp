<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<div class="container mt-5">
	<div class="form-group mt-3">
		<label class="form-label mt-4"><h3>내역추가</h3></label>
		<div class="form-group">
			<form name="newTransitionHistory" action="./processAddTransitionHistory.jsp" method="post">
				<div class="input-group mb-1" role="group" aria-label="Basic radio toggle button group">
					<span class="input-group-text">거래유형</span> 
					<input type="radio" class="btn-check" name="type" id="input" value="입금"> 
					<label class="btn btn-outline-primary" for="input">입금</label> 
					<input type="radio" class="btn-check" name="type" id="output" value="출금"> 
					<label class="btn btn-outline-primary" for="output">출금</label>
					<span class="input-group-text">은행명</span> 
					<input type="text" class="form-control" name="bank">
					<span class="input-group-text">계좌번호</span> 
					<input type="text" class="form-control" name="accountNumber">
					<span class="input-group-text">거래날짜</span> 
					<input type="text" class="form-control" name="datetime">
				</div>
				<div class="input-group mb-3">
					<span class="input-group-text">금액</span> 
					<input type="text" class="form-control" name="amount">
					<span class="input-group-text">세부내용</span> 
					<input type="text" class="form-control" name="content">
					<input class="btn btn-primary" type="submit" value="등록">
				</div>
			</form>
		</div>
	</div>
</div>