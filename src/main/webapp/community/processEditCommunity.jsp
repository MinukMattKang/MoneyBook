<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter"%>
<%@ include file="../dbconn.jsp" %>
<%@ page import="com.moneybook.dao.CommunityDAO" %>
<%@ page import="com.moneybook.dto.CommunityDTO" %>

<jsp:useBean id="memo" class="com.moneybook.dto.MemoDTO" scope="page" />
<jsp:setProperty name="memo" property="title" />
<jsp:setProperty name="memo" property="content" />
<jsp:setProperty name="memo" property="idx" />

<%
	request.setCharacterEncoding("UTF-8");

	String ID = (String) session.getAttribute("sessionId");
	
	if (memo.getTitle() == null || memo.getContent() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		CommunityDAO communityDAO = new CommunityDAO();
		int result = communityDAO.edit(memo.getTitle(), memo.getContent(), memo.getIdx());
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('커뮤니티 수정에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = communityPage.jsp");
			script.println("</script>");
		}
	
	}
	
	response.sendRedirect("communityPage.jsp");
%>