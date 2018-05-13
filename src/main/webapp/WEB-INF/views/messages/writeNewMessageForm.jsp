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
<title>새 메세지 작성</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="//code.jquery.com/jquery-1.8.3.min.js"></script>



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
		<form method="POST" action="../messenger/messageSend">
			<table class="table table-bordered table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background: orange;"><h4>새 메세지 작성</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px"><h5>받는사람</h5></td>
						<td><textarea class="form-control" rows="1" cols="30"
							name="msg_recipient" placeholder="받는 분의 아이디를 입력하세요"></textarea></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>작성자</h5></td>
						<td style="width: 70px; height: 50px">
						<h5>${userid}</h5>
						<input class="form-control" type="hidden" maxlength="50"
							name="msg_sender" value="${userid}"></td>
				
					</tr>
					<tr>
						<td style="width: 110px"><h5>제목</h5></td>
						<td><input class="form-control" type="text" maxlength="70"
							name="msg_title" placeholder="제목을 입력하세요. 최대 70자까지 가능합니다."></td>
					</tr>
					<tr>
						<td style="width: 110px"><h5>내용</h5></td>
						<td><textarea class="form-control" rows="10" cols="30"
								name="msg_content" maxlength="2048" placeholder="내용을 입력하세요"></textarea></td>
					</tr>

					<tr>
						<td style="text-align: left;" colspan="3"><h5
								style="color: red;"></h5> <input
							class="btn btn-primary pull-right"
							style="background: #skyblue; border: 1px solid #skyblue;"
							type="submit" value="메세지 전송">&nbsp;&nbsp;&nbsp; <input
							class="btn btn-primary pull-right"
							style="background: #skyblue; border: 1px solid #skyblue;"
							type="button" id="btn_close" value="닫기"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>