<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="dto.Account" %>
<%@ page import="dao.TempRepository" %>

<%
	request.setCharacterEncoding("UTF-8");

	String bank = request.getParameter("bank");
	String accountNumber = request.getParameter("accountNumber");
	String type = request.getParameter("type");
	int amount = Integer.valueOf(request.getParameter("amount"));
	String content = request.getParameter("content");
	String datetime = request.getParameter("datetime");
	
	TempRepository dao = TempRepository.getInstance();
	
	Account newAccount = new Account();
	newAccount.setBank(bank);
	newAccount.setAccountNumber(accountNumber);
	newAccount.setType(type);
	newAccount.setAmount(amount);
	newAccount.setContent(content);
	newAccount.setDatatime(datetime);
	
	dao.addTransitionHistory(newAccount);
	
	response.sendRedirect("account.jsp");
%>