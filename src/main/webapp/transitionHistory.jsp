<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="dto.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.TempRepository" %>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<% 
	TempRepository dao = TempRepository.getInstance();
	ArrayList<Account> listOfAccounts = dao.getAllAccounts(); 
%>


<table class="table table-hover">
	<tr>
		<th scope="col">구분</th>
		<th scope="col">은행명</th>
		<th scope="col">계좌번호</th>
		<th scope="col">거래유형</th>
		<th scope="col">금액</th>
		<th scope="col">세부내용</th>
		<th scope="col">거래날짜</th>
	</tr>
	<tbody>
		<tr>
			<% 
				for (int i=0; i < listOfAccounts.size(); i++) {
				Account account = listOfAccounts.get(i);
			%>
			<td><%= i+1 %></td>
			<td><%= account.getBank() %></td>
			<td><%= account.getAccountNumber() %></td>
			<td><%= account.getType() %></td>
			<td><%= account.getAmount() %></td>
			<td><%= account.getContent() %></td>
			<td><%= account.getDatatime() %></td>
		<tr>
	</tbody>
			<%
				}
			%>
</table>