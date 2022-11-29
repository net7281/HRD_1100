<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="VO.UserVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% UserVO user = (UserVO)request.getAttribute("user"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈쇼핑 회원 정보 수정</title>
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
		var info = document.modForm;
		if(info.custName==""){
			alert("회원 성명이 입력되지 않았습니다.");
			info.userName.focus();
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
	<form name="modForm" action="/HRD_1100/updateUser">
		<section>
			<h3>홈쇼핑 회원 등록</h3>
			<table>
			  <tr>
			    <th>회원번호(자동발생)</th>
			    <td><input type="text" name="custno" value="<%=user.getCustno()%>" readonly="readonly"></td>
			  </tr>
			  <tr>
			    <th>회원성명</th>
			    <td><input type="text" name="custName" value="<%=user.getCustname()%>"></td>
			  </tr>
			  <tr>
			    <th>회원전화</th>
			    <td><input type="text" name="phone" value="<%=user.getPhone()%>"></td>
			  </tr>
			  <tr>
			    <th>회원주소</th>
			    <td><input type="text" name="address" value="<%=user.getAddress()%>"></td>
			  </tr>
			  <tr>
			    <th>가입일자</th>
			    <td><input type="text" name="joinDate" value="<%=user.getJoindate()%>" disabled="disabled"></td>
			  </tr>
			  <tr>
			    <th>고객등급[A:VIP,B:일반,C:직원]</th>
			    <td><input type="text" name="grade" value="<%=user.getGrade()%>"></td>
			  </tr>
			  <tr>
			    <th>도시코드</th>
			    <td><input type="text" name="city" value="<%=user.getCity()%>"></td>
			  </tr>
			  <tr>
			  	<td colspan="2">
				  	<button type="button" onclick="submitCk()">수정</button>
				  	<button type="button">조회</button>
			  	</td>
			  </tr>
			</table>
		</section>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>