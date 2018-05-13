<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{
border:3px solid #eae6d2;
background:#eae6d2;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
</head>
<body>
<h2 style="text-align:center;"> 지급할 포인트를 입력해주세요</h2>
<table style="margin:auto; padding:20px;">
<tr>
	<form action="addPoint" method="POST">
		<td><b>지급 대상자 아이디 :</b> ${param.userid}</td>
</tr>
<tr>
		<td><b>${param.userid}님의 현재 포인트 :</b> ${param.member_point}</td>
</tr>
		<input type="hidden" name="userid" value="${param.userid}">
<tr>
		<td><b>추가할 포인트 :</b> <input type="text" name="member_point"></td>
</tr>
<tr>
		<td style="text-align:center;"><input type="submit" value="확인" style="color: white; height: 30px; width: 100px; font-size: 15px; background-color: #81725F;"></td>
</tr>
	</form>
<tr>
</body>
</html>