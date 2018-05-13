<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/custom.css">
<title>메세지 상세보기</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>

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
					<th colspan="2" style="background: orange;"><h4>1:1 문의함</h4></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Messagedetail}" var="detail">
					<tr>
						<td style="width: 110px"><h5>보낸 사람</h5></td>
						<td>${detail.msg_sender}</td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>글 제목</h5></td>
						<td>${detail.msg_title}</td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>글 내용</h5></td>
						<td>${detail.msg_content}</td>
					</tr>
					<form method="POST"
						action="../messenger/msgReply?msg_recipient=${detail.msg_recipient}&msg_sender=${detail.msg_sender}">
						<td style="text-align: left;" colspan="3">
							<h5 style="color: red;"></h5> 
							<input
							class="btn btn-primary pull-right"
							style="background: #ffffff; border: 1px solid #000000;"
							type="submit" value="답장"> <input
							class="btn btn-primary pull-right"
							style="background: #ffffff; border: 1px solid #000000;"
							type="button" id="btn_close" value="닫기">
						</td>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>