<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="VO.UserVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% List<UserVO> userList = (ArrayList<UserVO>)request.getAttribute("userList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록조회/수정</title>
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
		width: 700px;
		border: 1px solid #bbb;
	}
	section tr{
		text-align: center;
	}
	section th, section td{
		border: 1px solid #bbb;
	}
	section td a{
		color: #fff;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<form action="">
		<section>
			<h3>홈쇼핑 회원 등록</h3>
			<table>
			  <tr>
			    <th>회원번호</th>
			    <th>회원성명</th>
			    <th>전화번호</th>
			    <th>주소</th>
			    <th>가입일자</th>
			    <th>고객등급</th>
			    <th>거주지역</th>
			  </tr>
			  <% for(int i=0; i<userList.size(); i++){ %>
			  <tr>
			    <td><a href="/HRD_1100/modUser?custno=<%=userList.get(i).getCustno() %>"><%=userList.get(i).getCustno()%></a></td>
			    <td><%=userList.get(i).getCustname() %></td>
			    <td><%=userList.get(i).getPhone() %></td>
			    <td><%=userList.get(i).getAddress() %></td>
			    <td><%=userList.get(i).getJoindate() %></td>
			    <td><%
			    //회원등급을 코드로 받아와서 출력
			    	String grade = userList.get(i).getGrade();
			    	if(grade.equals("A")){
			    		%><%="VIP"%><%
			    	}
			    	else if(grade.equals("B")){
			    		%><%="일반"%><%
			    	}
			    	else if(grade.equals("C")){
			    		%><%="직원"%><%
			    	}
			    %></td>
			    <td><%=userList.get(i).getCity() %></td>
			  </tr>
			  <%} %>
			</table>
		</section>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>