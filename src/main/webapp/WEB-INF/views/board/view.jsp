<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/board/view.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 게시판 글 상세보기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/doMain.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/normalize.css">
<%@ include file="../include/header.jsp"%>
<script src="../include/js/common.js"></script>
<!-- ckeditor의 라이브러리 -->
<script src="/ckeditor/ckeditor.js"></script>
<script>
	$(function() { //자동으로 실행되는 코드
		listReply("1"); // responseText방식
		//댓글 목록 출력
		//listReply2(); // json방식

		//댓글 쓰기
		$("#btnReply").click(function() {
			var replytext = $("#replytext").val(); //댓글 내용
			var bno = "${dto.bno}"; //게시물 번호
			var param = {
				"replytext" : replytext,
				"bno" : bno
			};
			//var param="replytext="+replytext+"&bno="+bno;
			$.ajax({
				type : "post",
				url : "${path}/reply/insert.do",
				data : param,
				success : function() {
					alert("댓글이 등록되었습니다.");
					listReply("1");
					//listReply2(); //댓글 목록 출력
				}
			});
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

		//목록 버튼
		$("#btnList").click(function() {
			location.href = "/board/list.do";
		});
		//수정 버튼
		$("#btnUpdate").click(
				function() {
					//첨부파일 이름들을 폼에 추가
					var str = "";
					$("#uploadedList .file").each(
							function(i) {
								str += "<input type='hidden' name='files[" + i
										+ "]' value='" + $(this).val() + "'>";
							});
					$("#form1").append(str);
					document.form1.action = "/board/update.do";
					document.form1.submit();
				});
		//삭제 버튼
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "/board/delete.do";
				document.form1.submit();
			}
		});

		listAttach();

		//첨부파일 삭제
		//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
		$("#uploadedList").on("click", ".file_del", function(e) {
			var that = $(this); //클릭한 태그
			//data: {fileName: $(this).attr("data-src") },		
			$.ajax({
				type : "post",
				url : "/upload/deleteFile",
				data : "fileName=" + $(this).attr("data-src"),
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						//화면에서 태그 제거
						that.parent("div").remove();
					}
				}
			});
		});

		$("#btnSave").click(
				function() {
					var str = "";
					// uploadedList 내부의 .file 태그 각각 반복
					$("#uploadedList .file").each(
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
	});
	//댓글 목록 출력 함수
	//responseText방식
	function listReply(num) {
		$.ajax({
			type : "get",
			url : "${path}/reply/list.do?bno=${dto.bno}&curPage=" + num,
			success : function(result) {
				//result : responseText 응답텍스트(html)
				$("#listReply").html(result);
			}
		});
	}
	//타임스탬프값(숫자형)을 문자열 형식으로 변환
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute
				+ ":" + second;
		return strDate;
	}

	//첨부파일 리스트를 출력하는 함수
	function listAttach() {
		$.ajax({
			type : "post",
			url : "/board/getAttach/${dto.bno}",
			success : function(list) {
						// list : json
				console.log(list);
				$(list).each(function() {
						var fileInfo = getFileInfo(this);
						//console.log(fileInfo);
						var html = "<div><a href='"+fileInfo.getLink+"'>"
									+ fileInfo.fileName
									+ "</a>&nbsp;&nbsp;";
									<c:if test="${sessionScope.userid == dto.writer}">
									html += "<a href='#' class='file_del' data-src='"
									+this+"'>[삭제]</a></div>";
									</c:if>
									$("#uploadedList").append(html);
							});
					}
				});
	}
</script>

<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
	margin: auto;
}

table, th, td {
	border: 3px solid #eae6d2;
	margin: auto;
	text-align: center;
}
</style>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div id="mainContents" style="margin-top: 0;">
		<div class="contents">
			<h1 style="margin-top: 100px; color: #8E6138;">상품정보</h1>
			<div class="row"
				style="margin-top: 20px; padding: 50px; border-top: 5px solid #eae6d2; height: 100px;">
				<form id="form1" name="form1" method="post"
					action="${path}/board/insert.do">
					<table style="width: 890px;">
						<tr>
							<td rowspan="2" style="background: #E6DDCE">제목 <input
								name="title" id="title" size="80" value="${dto.title}"
								placeholder="제목을 입력하세요">
							</td>
							<td style="background: #E6DDCE">조회수 : ${dto.viewcnt}</td>
						</tr>
						<!-- 본인만 수정,삭제 버튼 표시 -->
						<tr>
							<td style="background: #E6DDCE"><c:if
									test="${sessionScope.userid == dto.writer}">
									<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
									<input type="hidden" name="bno" value="${dto.bno}">
									<button type="button" id="btnUpdate"
										style="text-indent: 0px; background: #81725F; color: white; border: 1px solid #D8C3C2; height: 30px; width: 50px; font-size: 17px;">수정</button>
									<button type="button" id="btnDelete"
										style="text-indent: 0px; background: #81725F; color: white; border: 1px solid #D8C3C2; height: 30px; width: 50px; font-size: 17px;">삭제</button>
									<button type="button" id="btnList"
										style="text-indent: 0px; background: #81725F; color: white; border: 1px solid #D8C3C2; height: 30px; width: 50px; font-size: 17px;">목록</button>
								</c:if></td>
						</tr>
						<tr>
							<td colspan="2">
								<div>
									<textarea rows="10" cols="100" id="content" name="content"
										rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea></div> 
								<script type="text/javascript">
									// ckeditor 적용
									CKEDITOR.replace("content",{
														filebrowserUploadUrl : "${path}/imageUpload.do",
														height : "500px"
													});
								</script>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="background: #F4F0E9">첨부파일을 등록하세요
								<div class="fileDrop"></div>
								<div id="uploadedList"></div>
								<div style="width: 890px; text-align: center;"></div>
							</td>
						</tr>
						<tr>
							<c:if test="${sessionScope.userid != null }">
								<td>
									<!-- 댓글 작성 --> <textarea rows="5" cols="80" id="replytext"
										placeholder="댓글을 작성하세요"></textarea>
								</td>
								<td>
									<button type="button" id="btnReply"
										style="text-indent: 0px; color: white; border: 1px solid #D8C3C2; height: 100px; width: 100px; font-size: 17px; background-color: #81725F;">댓글쓰기</button>
								</td>
							</c:if>
						</tr>
						<tr>
							<td colspan="2">
								<!-- 댓글 목록 -->
								<div id="listReply"></div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<div id="footer" style="position: relative; top: 1300px;">
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