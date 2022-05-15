<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="../dbconn.jsp" %>
<%@ page import="com.moneybook.dao.MemoDAO" %>
<%@ page import="com.moneybook.dto.MemoDTO" %>

<jsp:useBean id="memo" class="com.moneybook.dto.MemoDTO" scope="page" />
<jsp:setProperty name="memo" property="title" />
<jsp:setProperty name="memo" property="content" />

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
		MemoDAO memoDAO = new MemoDAO();
		int result = memoDAO.add(ID, memo.getTitle(), memo.getContent());
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('메모작성에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = memoPage.jsp");
			script.println("</script>");
		}

	}



















// 	String ID = (String) session.getAttribute("sessionId");
			
// 	String sql = "SELECT * FROM ACCOUNT";
// 	pstmt = conn.prepareStatement(sql);

// 	String bank = request.getParameter("bank");
// 	String accountNumber = request.getParameter("accountNumber");
// 	String type = request.getParameter("type");
// 	String amountStr = request.getParameter("amount");
// 	String content = request.getParameter("content");
// 	String datetime = request.getParameter("datetime");
		
// 	Integer amount;
// 	if (amountStr.isEmpty()) {
// 		amount = 0;
// 	} else {
// 		amount = Integer.valueOf(amountStr);
// 		if(type.equals("출금")){
// 			amount = -amount;
// 		}
// 	}
	
	
	
// 	sql = "INSERT INTO ACCOUNT VALUES(?,?,?,?,?,?,?,account_seq.nextval)";
// 	pstmt = conn.prepareStatement(sql);
// 	pstmt.setString(1, bank);
// 	pstmt.setString(6, accountNumber);
// 	pstmt.setString(2, type);
// 	pstmt.setInt(3, amount);
// 	pstmt.setString(4, content);
// 	pstmt.setString(5, datetime);
// 	pstmt.setString(7, ID);
// 	pstmt.executeUpdate();
	
	


// 	if (pstmt != null) { pstmt.close(); }
// 	if (conn != null) { conn.close(); }
	
	response.sendRedirect("memoPage.jsp");
%>