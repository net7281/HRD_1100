<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<% 

String custno = (String)request.getAttribute("custno"); 
String today = (String)request.getAttribute("today");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈쇼핑 회원 등록</title>
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
	section th{
		width: 40%;
	}
	section input{
		width: 100%;
	}
	section button{
		width: 70px;
	}
</style>
<script type="text/javascript">
	function submitCk(){
		var info = document.signForm;
		if(info.custName.value == ""){
			alert("회원 성명이 입력되지 않았습니다.");
			info.custName.focus();
			return false;
		}
		if(info.phone.value ==""){
			alert("전화번호가 입력되지 않았습니다.");
			info.phone.focus();
			return false;
		}
		if(info.address.value ==""){
			alert("주소가 입력되지 않았습니다.");
			info.address.focus();
			return false;
		}
		if(info.grade.value ==""){
			alert("등급이 입력되지 않았습니다.");
			info.grade.focus();
			return false;
		}
		if(info.city.value ==""){
			alert("도시코드가 입력되지 않았습니다.");
			info.city.focus();
			return false;
		}
		info.submit();
	}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<form name="signForm" action="HRD_1100/addUser">
		<section>
			<h3>홈쇼핑 회원 등록</h3>
			<table>
			  <tr>
			    <th>회원번호(자동발생)</th>
			    <td><input type="text" name="custno" value="<%=custno %>" readonly="readonly"></td>
			  </tr>
			  <tr>
			    <th>회원성명</th>
			    <td><input type="text" name="custName"></td>
			  </tr>
			  <tr>
			    <th>회원전화</th>
			    <td><input type="text" name="phone"></td>
			  </tr>
			  <tr>
			    <th>회원주소</th>
			    <td><input type="text" name="address"></td>
			  </tr>
			  <tr>
			    <th>가입일자</th>
			    <td><input type="text" name="joinDate" value="<%=today %>" disabled="disabled"></td>
			  </tr>
			  <tr>
			    <th>고객등급[A:VIP,B:일반,C:직원]</th>
			    <td><input type="text" name="grade"></td>
			  </tr>
			  <tr>
			    <th>도시코드</th>
			    <td><input type="text" name="city"></td>
			  </tr>
			  <tr>
			  	<td colspan="2">
				  	<button type="button" onclick="submitCk()">등록</button>
				  	<button type="button" onclick="">조회</button>
			  	</td>
			  </tr>
			</table>
		</section>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>