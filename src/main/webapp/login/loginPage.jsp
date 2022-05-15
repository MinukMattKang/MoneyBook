<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
	#con1{
		text-align: center;
	}
</style>

<title>Login Page</title>
</head>
<body>
	<%@ include file="./menu.jsp"%>
	
	<%
		String error = request.getParameter("error");
		if (error != null) {
			out.println("<div class='container mt-5' id='con1'>");
			out.println("<div class='alert alert-danger'>");
			out.println("아이디와 비밀번호를 확인해 주세요");
			out.println("</div></div>");
		}
	%>
	<div style="position: flex; height: 200px; width: 100%"></div>
	
	<div class="container mt-5" align="center">
		<div class="card border-primary mb-3" style="max-width: 20rem;">
		  <div class="card-header"><p></p><h2>로그인</h2></div>
		  <div class="card-body">
		    <form class="form-signin" action="processLogin.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">아이디</label> 
					<input	type="text" class="form-control" placeholder="ID" name='id' required autofocus>
				</div>
				<div class="form-group mt-2">
					<label for="inputPassword" class="sr-only">패스워드</label> 
					<input 	type="password" class="form-control" placeholder="Password" name='password' required>
				</div>
				<div class="container mt-3" align="right">
					<button class="btn btn-warning" type="button" value="회원가입" onClick="location.href='./signUpPage.jsp'">회원가입</button>
					<button class="btn btn-success" type="submit" value="로그인">로그인</button>
					<button class="btn btn-primary" type="button" value="취소" onClick="location.href='../welcomePage.jsp'">취소</button>
			  	</div>
			</form>
		  </div>
		</div>
		
		<div style="position: flex; height: 250px; width: 100%"></div>
		<div align="left">
			<%@ include file="../footer.jsp"%>
		</div>
	</div>
</body>
</html>
