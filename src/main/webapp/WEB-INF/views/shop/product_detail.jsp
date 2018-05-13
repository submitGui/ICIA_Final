<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- views/shop/product_detail.jsp -->
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 보기</title>
<%@ include file = "../include/header.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/ihover.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/doMain.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/files/normalize.css">
<%
   int member_point = (Integer)session.getAttribute("member_point");
%>
<style type="text/css">

</style>
<script type="text/javascript">
   $(function() { //자동으로 실행되는 코드
      //댓글 목록 출력
      productlistReply("1");

      //댓글 쓰기
      $("#btnProductReply").click(function() {
         var replytext = $("#replytext").val(); //댓글 내용
         var product_id = "${dto.product_id}"; //게시물 번호
         var param = {
            "replytext" : replytext,
            "product_id" : product_id
         };
         //var param="replytext="+replytext+"&product_id="+product_id;
         $.ajax({
            type : "post",
            url : "${path}/Productreply/insert.do",
            data : param,
            success : function() {
               alert("댓글이 등록되었습니다.");
               productlistReply("1"); //댓글 목록 출력
            }
         });
      });
      //입찰하기 버튼 클릭시
      $("#bidding_submit").click(function() {
         var popUrl = "${path}/shop/product/Auction.do?product_id=${dto.product_id}&price=${dto.price}&member_point=${auction.member_point+0}&mypoint="+<%=member_point%>+"&userid=${userid}";
         var popOption = "width=600, height=600, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

         window.open(popUrl,"",popOption);
      });

   });
   //댓글 목록 출력 함수
   function productlistReply(num) {
      $
            .ajax({
               type : "get",
               url : "${path}/Productreply/list.do?product_id=${dto.product_id}&curPage="
                     + num,
               success : function(result) {
                  //result : responseText 응답텍스트(html)
                  $("#productlistReply").html(result);
               }
            });
   }
</script>

<style>
table, tr, td {
	border: 3px solid #eae6d2;
}
</style>
</head>

<body>
	<%@ include file="../include/menu.jsp"%>

	<div id="mainContents" style="margin-top: 0;">
		<div class="contents">
			<h1 style="margin-top: 170px; color: #8E6138;">상품정보</h1>
			<!-- 날짜 계산을 위한 jstl -->
			<jsp:useBean id="today" class="java.util.Date" />
			<input type="hidden" value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			<fmt:parseDate var="end" value="${dto.product_end}" pattern="yyyy-MM-dd" />
			<input type="hidden" value="<fmt:formatDate value="${end}" pattern="yyyyMMdd"/>">
			<input type="hidden" value="<fmt:formatDate value="${end}" pattern="HHmmss"/>">
			<fmt:parseNumber value="${today.time / (24 * 60 * 60 * 1000)}" integerOnly="true" var="nowDays" />
			<fmt:parseNumber value="${end.time / (24 * 60 * 60 * 1000)}" integerOnly="true" var="oldDays" />

			<font color="red"> <!-- 경매 날짜 계산후에 마감날짜 출력 --> 
			<c:choose>
					<c:when test="${(oldDays - nowDays + 1) > 0}">
    					  만료예정일 ${oldDays - nowDays + 1}일 남음
      				</c:when>
					<c:when test="${(oldDays - nowDays + 1) == 0}">
      					경매가 당일 종료됩니다.
      				</c:when>
					<c:when test="${(oldDays - nowDays + 1) < 0}">
<!--       				<script type="text/javascript">
    				location.href = "${path}/shop/product/list.do";
      				alert("경매가 마감되었습니다.");
      				</script> -->
      				마감된 경매입니다.
					</c:when>
			</c:choose>
			</font>
			<div class="row"
				style="margin-top: 20px; padding: 50px; border-top: 5px solid #eae6d2; height: 100px;">
				<table
					style="width: 1000px; text-align: center; border: 5px solid #fff;">
					<tr>
						<td style="border: 5px solid #fff"><img
							src="${path}/images/${dto.picture_url}" width="400px"
							height="400px"></td>
						<td align="right">
							<table
								style="width: 500px; height: 400px; border: 5px solid #fff">
								<tr>
									<td style="border: 5px solid #fff"><h3
											style="font-weight: bold;">업체명</h3></td>
									<td style="border: 5px solid #fff"><h3>${dto.product_name}</h3></td>
								</tr>
								<tr>
									<td style="border: 5px solid #fff"><h3
											style="font-weight: bold;">가격</h3></td>
									<td style="border: 5px solid #fff"><h3>${dto.price}</h3></td>
								</tr>
								<tr>
									<td style="border: 5px solid #fff">
										<h3 style="font-weight: bold;">경매 시작날짜</h3>
									</td>
									<td style="border: 5px solid #fff">
									<h3>
										<fmt:parseDate value="${dto.product_Start}" var="start" pattern="yyyy-MM-dd"/>
                     					<fmt:formatDate value="${start}" pattern="yyyy-MM-dd"/>
									</h3>
									</td>
								</tr>
								<tr>
									<td style="border: 5px solid #fff"><h3
											style="font-weight: bold;">경매 마감날짜</h3></td>
									<td style="border: 5px solid #fff"><h3>
									<fmt:parseDate value="${dto.product_end}" var="end" pattern="yyyy-MM-dd"/>
                     				<fmt:formatDate value="${end}" pattern="yyyy-MM-dd"/>   
										</h3></td>
								</tr>
								<tr>
									<td style="border: 5px solid #fff"><h3
										style="font-weight: bold;">현재최고 입찰자</h3></td>
									<td style="border: 5px solid #fff">
									<h3>${auction.userid}</h3>
									</td>
								</tr>
								<tr>
									<td style="border: 5px solid #fff"><h3
										style="font-weight: bold;">현재 입찰가</h3></td>
									<td style="border: 5px solid #fff">
									<h3>${auction.member_point}</h3>
									</td>
								</tr>
								<tr>
									<td style="border: 5px solid #fff"><h3
										style="font-weight: bold;">내 포인트</h3></td>
									<td style="border: 5px solid #fff">
									<h3><%=member_point %></h3>
									</td>
								</tr>
								<tr>
									<td colspan=2>
									<button type="button" id="bidding_submit"
											style="text-indent: 0px; background: #81725F; color: white; border: 1px solid #D8C3C2; height: 50px; width: 100px; font-size: 17px; margin-left:120px;">입찰하기</button></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<div style="width: 890px; border: 5px double #eae6d2; margin-top: 40px; padding: 50px; min-height: 600px;">${dto.description}</div>

				<table style="width: 1000px; text-align: center; margin-top: 40px;">
					<tr>
						<c:if test="${sessionScope.userid != null }">
							<td>
								<!-- 댓글 작성 --> <textarea rows="5" cols="120" id="replytext"
									placeholder="댓글을 작성하세요"></textarea>
							</td>
							<td>
								<button type="button" id="btnProductReply"
									style="text-indent: 0px; background: #81725F; color: white; border: 1px solid #D8C3C2; height: 100px; width: 100px; font-size: 17px;">댓글쓰기</button>
							</td>
						</c:if>
					</tr>
				</table>
				<!-- 댓글 목록 -->
				<span id="productlistReply" style="text-align: center;"></span>
			</div>
		</div>
	</div>

<!-- 푸터 -->
	<div id="footer" style="position:relative; top:1800px; overflow:hidden;">
		<div class="footerArea" style="height:100px;">
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