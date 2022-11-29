<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style>
*{
		margin: 0; padding: 0;
	}
	header{
		width: 100%; height: 130px;
		background-color: blue;
		position: absolute; top:0;
	}
	header h1{
		color: white;
		text-align: center;
		line-height: 100px
	}
	nav{
		width: 100%; height: 30px;
		background-color: #55e;
	}
	nav a{
		color: #fff;
		text-decoration: none;
		font-weight: 800;
		margin: 0 20px;
		line-height: 30px;
	}
	</style>
</head>
<body>
<header>
		<h1 class="title">쇼핑몰 회원관리 ver 1.0</h1>
		<nav>
			<a href="/HRD_1100/signUser">회원등록</a>
			<a href="/HRD_1100/userList">회원목록조회/수정</a>
			<a href="/HRD_1100/moneyList">회원매출조회</a>
			<a href="/HRD_1100/home">홈으로.</a>
		</nav>
	</header>
</body>
</html>