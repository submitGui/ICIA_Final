<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 게시판</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	media="screen" title="no title" charset="utf-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/doMain.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/normalize.css">

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<script src="/include/js/common.js"></script>
<!-- ckeditor의 라이브러리 -->
<script src="/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		$("#btnSave").click(
				function() {
					var str = "";
					// uploadedList 내부의 .file 태그 각각 반복
					$("#uploadedList.file").each(
							function(i) {
								console.log(i);
								//hidden 태그 구성
								str += "<input type='hidden' name='files[" + i
										+ "]'	value='" + $(this).val() + "'>";
							});
					//폼에 hidden 태그들을 붙임
					$("#form1").append(str);
					document.form1.submit();
				});
		$(".fileDrop").on("dragenter dragover", function(e) {
			//기본 효과 막음
			e.preventDefault();
		});
		$(".fileDrop")
				.on(
						"drop",
						function(e) {
							e.preventDefault();
							//첫번째 첨부파일
							var files = e.originalEvent.dataTransfer.files;
							var file = files[0];
							//폼 데이터에 첨부파일 추가
							var formData = new FormData();
							formData.append("file", file);
							$
									.ajax({
										url : "/upload/uploadAjax",
										data : formData,
										dataType : "text",
										processData : false,
										contentType : false,
										type : "post",
										success : function(data) {
											//console.log(data);
											//data : 업로드한 파일 정보와 Http 상태 코드
											var fileInfo = getFileInfo(data);
											//console.log(fileInfo);
											var html = "<a href='"+fileInfo.getLink+"'>"
													+ fileInfo.fileName
													+ "</a><br>";
											html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
											$("#uploadedList").append(html);
										}
									});
						});
	});
</script>
<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
table, tr, td{
 	border: 5px solid #eae6d2;
}
</style>

</head>
<body>
	<div id="mainContents" style="margin-top: 0;">
		<div class="contents">
			<h1 style="margin-top: 100px; color: #8E6138;">글쓰기</h1>
			<div class="row"
				style="margin-top: 20px; padding: 50px; border-top: 5px solid #eae6d2; height: 100px;">
				<form id="form1" name="form1" method="post"
					action="/board/insert.do">
					<table style="width: 890px; text-align:center;">
						<tr>
							<td style="background: #E6DDCE">
								<input name="title" id="title" size="80" placeholder="제목을 입력하세요">
							</td>
						</tr>
						<tr>
							<td style="width: 800px;">
							<div> <textarea rows="10" cols="100" id="content" name="content" placeholder="내용을 입력하세요"></textarea></div>
								<script type="text/javascript">
									// ckeditor 적용
									CKEDITOR.replace(
													"content",
													{
														filebrowserUploadUrl : "/imageUpload.do",//파일업로드를 처리할주소를적어줌
														height : "500px"
													});
								</script></td>
						</tr>
						<tr>
							<td style="background: #F4F0E9">
								첨부파일을 등록하세요
								<div class="fileDrop" style="margin:auto;"></div>
								<div id="uploadedList"></div>
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" id="btnSave" style="text-indent: 0px; background:#81725F; color:white; border:1px solid #D8C3C2; height:30px; width:50px; font-size:17px;">확인</button>
								<button type="button" onclick="location.href='${path}/board/list.do'" style="text-indent: 0px; background:#81725F; color:white; border:1px solid #D8C3C2; height:30px; width:50px; font-size:17px;">목록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<div id="footer" style="position:relative; top:1300px;">
		<div class="footerArea">
			<div class="footerLogo" style="margin-right: 100px;">
				<img
					src="${pageContext.request.contextPath}/resources/imgs/common/logo_bottom_marry.png">
			</div>
			<div class="footerAddr">
				
				
				(주)결혼할까요 | 사업자등록번호 123-55-789456 <br> <span>COPYRIGHT
					MarryMe ALL RIGHT RESERVED.</span>
			</div>

		</div>
	</div>
</body>
</html>