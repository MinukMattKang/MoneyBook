<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>

<title>Sign Up Page</title>
</head>
<body>
	<%@ include file="./menu.jsp"%>
	
	
	<div class="container mt-5">
		<form name="newMember" class="form-horizontal"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 mt-3 ">아이디</label>
				<div class="col-sm-3 mt-3" >
					<input name="id" type="text" class="form-control" placeholder="아이디">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3">비밀번호</label>
				<div class="col-sm-3 mt-3">
					<input name="password" type="text" class="form-control" placeholder="비밀번호" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3">비밀번호확인</label>
				<div class="col-sm-3 mt-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="비밀번호 확인" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3">성명</label>
				<div class="col-sm-3 mt-3">
					<input name="name" type="text" class="form-control" placeholder="이름" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3">닉네임</label>
				<div class="col-sm-3 mt-3">
					<input name="nickname" type="text" class="form-control" placeholder="닉네임" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3">성별</label>
				<div class="col-sm-10 mt-3">
					<input name="sex" type="radio" value="남" /> 남 
					<input name="sex" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 mt-3">생년월일</label>
				<div class="col-sm-4 mt-3 ">
					<input type="text" name="birthyy" maxlength="4" placeholder="연도(4자리)" size="6"> 
					<select name="birthmm" style="height: 30px">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 
					<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2 mt-3">이메일</label>
				<div class="col-sm-10 mt-3">
					<input type="text" name="mail1" maxlength="40">@ 
					<select name="mail2" style="height: 30px">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3">전화번호</label>
				<div class="col-sm-3 mt-3">
					<input name="phone" type="text" class="form-control" placeholder="전화번호" >

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 mt-3 ">주소</label>
				<div class="col-sm-3 mt-3">
					<input name="address" type="text" class="form-control" placeholder="주소">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록" > 
					<input type="reset" class="btn btn-primary " value="취소" onclick="location.href='../welcomePage.jsp'" >
				</div>
			</div>
		</form>
		<div style="margin-top: 200px;">
			<%@ include file="../footer.jsp"%>
		</div>
		
	</div>
</body>
</html>
