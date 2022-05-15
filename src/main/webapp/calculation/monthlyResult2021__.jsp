<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ include file="../dbconn.jsp"%>

<% 
	String ID = (String) session.getAttribute("sessionId"); 
	
	List<String[]> arrCalIncome = new ArrayList<String[]>(12);
	List<String[]> arrCalExpenditure = new ArrayList<String[]>(12);
	List<String[]> arrMonths = new ArrayList<String[]>();
%>

<style>
 	table{ 
 		width: 100%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
 	} 
	
 	tbody{ 
 		border: 1px;
 	} 
	
 	th,td{ 
 		border-bottom: 1px solid #444444;
    	padding: 10px;
   	text-align: center;

 	} 

</style>


<div class="container mt-3" style="text-align: center;">
	<canvas id="myChart" width="1200" height="500" style="display: inline-block;"></canvas>
</div>
<div class="container mt-3 mb-5">
	<table>
		<tr>
		<th>구분</th>
			<%for(int i=1; i< 13; i++) {  %>
			<th><%= i %>월</th>
			<% } %>
		</tr>
		
		<tr>
		<th>수입</th>
			<% 
			String sql = "SELECT SUBSTR(DATETIME, 1, 5) AS MONTH, SUM(AMOUNT) AS TOTAL_INCOME FROM ACCOUNT WHERE TYPE='입금' AND SUBSTR(DATETIME, 1, 2)='21' AND ID=? GROUP BY SUBSTR(DATETIME, 1, 5) ORDER BY SUBSTR(DATETIME, 1, 5) ASC"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

			
				while(rs.next()) {
					
					String arrIncome[] = {rs.getString("total_income")};
					String arrMonth[] = {(rs.getString("month")).substring(4, 5)};
					arrCalIncome.add(arrIncome);
					arrMonths.add(arrMonth);
				}

		    	for(int i=0; i < 12; i++) {
		    		if(arrMonths.get(i).equals(i+1)) {
		    		%>
		    		<td><%=arrCalIncome.get(i)%>원</td> 
			    	<%
			    	} else {	
			    	%>
			    		<td>&nbsp;</td> 
			    <%
			    } }
		   	 	%>
		    
		</tr>
		
		
		<tr>
		<th>지출</th>
			<% 
			sql = "SELECT SUBSTR(DATETIME, 1, 5) AS MONTH, SUBSTR(SUM(AMOUNT), 2) AS TOTAL_EXPENDITURE FROM ACCOUNT  WHERE TYPE='출금' AND SUBSTR(DATETIME, 1, 2)='21' AND ID=? GROUP BY SUBSTR(DATETIME, 1, 5) ORDER BY SUBSTR(DATETIME, 1, 5) ASC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();

				while(rs.next()) {
					
					String arrExpenditure[] = {rs.getString("total_expenditure")};
					arrCalExpenditure.add(arrExpenditure);
					
			%>
		    <td><%=rs.getString("total_expenditure")%>원</td>
		    <% 
		    	} 
				if (rs != null) { rs.close(); }
				if (pstmt != null) { pstmt.close(); }
				if (conn != null) { conn.close(); }
		    %>
		</tr>
		
	</table>
</div>




<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			datasets : [
					{
						label : '수입',
						data : [ 

							<% for(int i =0; i < arrCalIncome.size(); i++) { out.print(arrCalIncome.get(i)[0] + ", "); }; %> 
							
							],
						backgroundColor : [			
							'rgba(54, 162, 235, 0.2)', 
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(54, 162, 235, 0.2)'
						],
						borderColor : [ 
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(54, 162, 235, 1)' ],
						borderWidth : 1
					},
					{
						label : '지출',
						data : [ 
							
							<% for(int i =0; i < arrCalExpenditure.size(); i++) { out.print(arrCalExpenditure.get(i)[0] + ", "); }; %> 
							
							],
						backgroundColor : [ 
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 99, 132, 0.2)'
						],
						borderColor : [ 
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)',
							'rgba(255, 99, 132, 1)'
						],
						borderWidth : 1
					} ]
		},
	// 수동 범위 설정
// 		options : {
// 			responsive : false,
// 			scales : {
// 				yAxes : [ {
// 					ticks : {
// 						min : 0,
// 						max : 100,
// 						stepSize : 20,
// 						beginAtZero : true
// 					}
// 				} ]
// 			}
// 		}
	// 자동 범위 설정
		   options: {
		    	title : {
					display : true,
					text : '2021년 수입/지출 현황',
					fontSize : 20,
					fontColor : 'black'
				},
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }

		});
</script>

