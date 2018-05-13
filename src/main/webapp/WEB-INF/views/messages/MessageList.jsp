<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
<title>메세지함</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<style>
.asd {
	text-overflow: elipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>

<script>
	$(function() {
		$("#btn_close").on('click', function() {
			self.close();
		});
	});
</script>
</head>
<body>
	<div class="container">

		<table class="table table-bordered table-hover"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background: orange;"><h4>메세지함</h4></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${MessageList}" var="list">
				<!-- replace 공백처리 주의. 변경의 대상이 되는 ' '는 일반 띄어쓰기 ' '와 다름! -->
					<c:set var="str"
						value="${fn:replace(list.msg_title, ' ', '&nbsp')}" />
					<tr>
						<th>보낸 사람</th>
						<th>제 목</th>
						<th>보낸 날짜</th>
					</tr>
					<tr>
						<td>${list.msg_sender}</td>
						<td>
							<div class="asd">
								<!-- 상세보기 경로 설정 -->
								<a href="../messenger/messageDetailView?msg_title=${str}">${str}</a>
							</div>
						</td>
						<td>${list.msg_time}</td>
					</tr>
				</c:forEach>
				<!-- 하단 버튼 부 -->
				<form method="GET" action="../messenger/writeNewMessage">
					<td style="text-align: left;" colspan="3">
						<h5 style="color: red;"></h5> <input
						class="btn btn-primary pull-right"
						style="background: #skyblue; border: 1px solid #deepblue;"
						type="button" id="btn_close" value="닫기"> <input
						class="btn btn-primary pull-right"
						style="background: #skyblue; border: 1px solid #deepblue;"
						type="submit" value="새 쪽지 작성하기">
					</td>
				</form>

			</tbody>
		</table>
	</div>

</body>
</html>