<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- views/shop/product_list.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko-KR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>

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

<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="/board/write.do";
	});
});
function list(page){
	location.href="board/list.do?curPage="+page;
}
</script>
<style type="text/css">
#common {
   display: inline-block;
   width: 400px;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}
table, tr, td{
	height:50px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="mainContents" style="margin-top: 0; min-height: 900px;">
<div class="contents">
<h1 style="margin-top: 100px; color: #8E6138;">Custom Wedding</h1>
<div class="row" style="margin-top: 20px; padding: 50px; border-top: 5px solid #eae6d2; height: 100px;">
<!-- 검색폼 -->
<div style="text-align:center; margin-bottom:40px;">
	<form name="form1" method="post" action="${path}/board/list.do">
	<select name="search_option">
			<option value="name"
	<c:if test="${map.search_option == 'name'}">selected</c:if>
			>이름</option>
			<option value="title" 
	<c:if test="${map.search_option == 'title'}">selected</c:if>
			>제목</option>
			<option value="content" 
	<c:if test="${map.search_option == 'content'}">selected</c:if>
			>내용</option>
			<option value="all" 
	<c:if test="${map.search_option == 'all'}">selected</c:if>
			>이름+내용+제목</option>
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회" style="background:#81725F; color:white;">
	</form>
</div>
<span style="font-size:17px;">${map.count}개의 게시물이 있습니다.</span>
<button type="button" id="btnWrite" value="글쓰기" style="text-indent: 0px; background:#81725F; color:white; border:1px solid #D8C3C2; height:30px; width:70px; font-size:17px; float:right;">글쓰기</button>
<table style="border:5px solid #eae6d2; width:1030px; text-align:center;" class="col-md-12">
	<tr style="background:#E6DDCE;">
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<!-- forEach var="개별데이터" items="집합데이터" -->
<c:forEach var="row" items="${map.list}">
	<tr>
		<td style="background: #F4F0E9;">${row.bno}</td>
		<td>
	<a href="${path}/board/view.do?bno=${row.bno}">
	${row.title}
	</a>
			<c:if test="${row.cnt > 0}">
				<span style="color:red;">( ${row.cnt} )</span>
			</c:if>   
		</td>
		<td style="background: #F4F0E9;">${row.name}</td>
		<td><fmt:formatDate value="${row.regdate}"
			pattern="yyyy-MM-dd HH:mm:ss"/> </td>
		<td style="background: #F4F0E9;">${row.viewcnt}</td>
	</tr>
</c:forEach>	
<!-- 페이지 네비게이션 출력 -->
	<tr>
		<td colspan="5" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
</div>
</div>
</div>
	<!-- 푸터 -->
	<div id="footer">
		<div class="footerArea" style="height: 100px;">
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