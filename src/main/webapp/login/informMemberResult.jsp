<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<title>Inform Registration Result</title>
</head>
<body>
	<%@ include file="./menu.jsp"%>

	<div class="container mt-5 mb-5" align="center">
		<div style="margin-top: 350px; margin-bottom: 400px;">
			<%
				String msg = request.getParameter("msg");
	
				if (msg != null) {
					if (msg.equals("0"))
						out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
					else if (msg.equals("1"))
						out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
					else if (msg.equals("2")) {
						String loginId = (String) session.getAttribute("sessionId");
						out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
					}				
				} else {
					out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
				}
			%>
		</div>
		<div>
			<%@ include file="../footer.jsp"%>	
		</div>
	</div>
</body>
</html>