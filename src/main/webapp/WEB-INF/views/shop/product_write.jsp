<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/shop/product_write.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/doMain.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/normalize.css">
	<%@ include file = "../include/header.jsp" %>
	<%@ include file = "../include/menu.jsp" %>
<style type="text/css">
#start {
	width: 50px;
}

,
#end {
	width: 50px;
}

table, th, td {
	border: 3px solid #eae6d2;
	margin: auto;
	text-align: center;
}
</style>

<!-- ckeditor 사용을 위해 js 파일 연결 -->
<script src="/ckeditor/ckeditor.js"></script>
</head>
<body>
	<script>
		function product_write() {
			// 태그를 name으로 조회할 경우
			//var product_name=document.form1.product_name.value;
			// 태그를 id로 조회할 경우
			var product_name = $("#product_name").val();
			var price = $("#price").val();
			var description = $("#description").val();
			if (product_name == "") { //빈값이면
				alert("제목을 입력하세요");
				$("#product_name").focus(); //입력포커스 이동
				return; //함수 종료, 폼 데이터를 제출하지 않음
			}
			if (price == "") {
				alert("가격을 입력하세요");
				$("#price").focus();
				return;
			}
			/* 	if(description==""){
			 alert("상품 설명을 입력하세요");
			 $("#description").focus();
			 return;
			 } */
			//폼 데이터를 받을 주소
			document.form1.action = "${path}/shop/product/insert.do";
			//폼 데이터를 서버에 전송
			document.form1.submit();
		}
	</script>
	<div id="mainContents" style="margin-top: 0;">
		<div class="contents">
			<h1 style="margin-top: 100px; color: #8E6138;">상품 등록</h1>
			<div class="row"
				style="margin-top: 20px; padding: 50px; border-top: 5px solid #eae6d2;">
				<form name="form1" method="post" enctype="multipart/form-data">
					<table style="width:890px;">
						<tr>
							<td>기업명:</td>
							<td><input name="product_name" id="product_name"></td>
						</tr>
						<tr>
							<td>최대금액:</td>
							<td><input name="price" id="price"></td>
						</tr>
						<tr>
							<td>경매시작날짜:</td>
							<td><input type="date" name="product_Start"
								id="product_Start"></td>
						</tr>
						<tr>
							<td>경매마감날짜:</td>
							<td><input type="date" name="product_end" id="product_end">
							</td>
						</tr>
						<tr>
							<td>상품설명</td>
							<td><textarea rows="10" cols="100" name="description"
									id="description"></textarea> <script>
										//id가 description인 태그에 ckeditor를 적용시킴
										//CKEDITOR.replace("description"); //이미지 업로드 안됨
										CKEDITOR.replace(
														"description",
														{
															filebrowserUploadUrl : "${path}/imageUpload.do",//파일업로드를 처리할주소를적어줌
															height:"500px"
														});
									</script></td>
						</tr>
						<tr>
							<td>상품이미지</td>
							<td><input type="file" name="file1" id="file1"><br>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<input type="button" value="등록" onclick="javascript:product_write()" style="text-indent: 0px; background:#81725F; color:white; border:1px solid #D8C3C2; height:30px; width:50px; font-size:17px;"> 
							<input type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'" style="text-indent: 0px; background:#81725F; color:white; border:1px solid #D8C3C2; height:30px; width:50px; font-size:17px;">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<div id="footer" style="position:relative; top:100px;">
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