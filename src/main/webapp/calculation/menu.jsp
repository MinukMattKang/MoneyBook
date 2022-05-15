<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<!-- calculation 폴더 -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="../welcomePage.jsp">MONEY BOOK</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="../welcomePage.jsp">홈
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../transition/accountPage.jsp">계좌</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../calculation/calculationPage.jsp">결산</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../memo/memoPage.jsp">메모장</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../community/communityPage.jsp">커뮤니티</a>
        </li>
         
      </ul>
      
      <ul class="navbar-nav me-right">
      
	      <c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item"><a class="nav-link" href="<c:url value="../login/loginPage.jsp"/>">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li style="padding-top: 7px; color: white">[(<%=sessionId%>)님 접속중]</li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="../login/logout.jsp"/>">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value="#"/>">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
      
      <%@ include file="../clock.jsp"%>
      
    </div>
  </div>
</nav>