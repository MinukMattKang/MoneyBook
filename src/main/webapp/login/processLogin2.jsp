<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="MONEYBOOK" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
	SELECT * FROM MEMBER WHERE ID=? AND PASSWORD=?
 	<sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<!-- 다 끌어 왔는데 왜 닉네임은 안끌어와지는지 -->

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionNickname", nickname);
	%>
	<c:redirect url="informMemberResult.jsp?msg=2" />
</c:forEach>

<c:redirect url="loginPage.jsp?error=1" />
