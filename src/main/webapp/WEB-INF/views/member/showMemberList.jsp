<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<h2 style="text-align:center;">회원 목록</h2>
	<table style="margin:auto; padding:20px;">
		<c:forEach items="${member_list}" var="list">
			<tr>
				<form action="pointPage">
					<td><b>유저 아이디 :</b> ${list.userid}</td>
					<td><b>유저명 :</b> ${list.name} </td>
					<td><b>현재 포인트 :</b> ${list.member_point}</td>
					<td style="border:3px solid #eae6d2"><input type="hidden" name="userid" value="${list.userid}">
					<td style="border:3px solid #eae6d2"><input type="hidden" name="member_point" value="${list.member_point}"> 
					<td><input type="submit" id="pointbtn" value="포인트 주기" style="color: white; height: 30px; width: 100px; font-size: 15px; background-color: #81725F;"></td>
				</form>
			</tr>
		</c:forEach>
	</table>
</body>
</html>