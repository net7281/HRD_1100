<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="VO.MoneyVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% List<MoneyVO> moneyList = (ArrayList<MoneyVO>)request.getAttribute("moneyList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원매출조회</title>
<style>
	section{
		width: 100%; height: 100vh;
		background-color: #eee;
		overflow: hidden;
	}
	section h3{
		text-align: center;
		line-height: 70px;
		margin-top: 130px;
	}
	section table{
		margin: 0 auto;
		width: 500px;
		border: 1px solid #bbb;
	}
	section tr{
		text-align: center;
	}
	section th, section td{
		border: 1px solid #bbb;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<form action="">
		<section>
			<h3>회원매출조회</h3>
			<table>
			  <tr>
			    <th>회원번호</th>
			    <th>회원성명</th>
			    <th>고객등급</th>
			    <th>매출</th>
			  </tr>
			  <% for(int i=0; i<moneyList.size();i++){%>
			  <tr>
			    <td><%=moneyList.get(i).getCustno() %></td>
			    <td><%=moneyList.get(i).getCustname() %></td>
			    <td>
		    	<% String grade = moneyList.get(i).getGrade();
		    		if(grade.equals("A")){
		    			%><%="VIP" %><%
		    		}
		    		else if(grade.equals("B")){
		    			%><%="일반" %><%
		    		}
		    		else if(grade.equals("C")){
		    			%><%="직원" %><%
		    		}
		    	%>
			    </td>
			    <td><%=moneyList.get(i).getPrice() %></td>
			  </tr>
			  <% }%>
			</table>
		</section>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>