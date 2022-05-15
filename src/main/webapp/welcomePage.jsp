<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
	#text1{
		position: flex;
		height: 550px;
		width: 100%;
		font-size: 7rem;
		text-align: center;
		margin-top: 250px;
	}
	
	.char{
	 text-emphasis-style: dot;
	 text-emphasis-position: over left;
	 -webkit-text-emphasis-style: dot;
	 -webkit-text-emphasis-position: over;
	}

	.char {animation-duration: 3s; animation-name: slow-slidein; }
	@keyframes slow-slidein {
		from {margin-top: 6%; width: 100%; opacity: 0; animation-delay: 2s;}
		to { margin-top: 0%; width: 100%; opacity: 1;}

	}
	
</style>

<title>Welcome Page</title>
</head>
<body>
	<%@ include file="menu.jsp" %>



	<div class="container mt-5">	
		<div class="con1" id="text1">
			<div style="padding:20px">
			    <span class="char">똑똑한 </span>소비습관 만들기
			    <c:choose>
					<c:when test="${empty sessionId}">
						<button class="btn btn-primary btn-lg" type="button" style="float: none; margin:0 auto;" onclick="location.href='./login/loginPage.jsp'">지금 바로 시작하기</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-primary btn-lg" type="button" style="float: none; margin:0 auto;" onclick="location.href='./transition/accountPage.jsp'">지금 바로 시작하기</button>
					</c:otherwise>
				</c:choose>
			    
			</div>
		</div>
		
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>