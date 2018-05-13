<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/board/reply_list.jsp -->
    <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>

</head>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<table style="width:1000px">
<c:forEach var="row" items="${list}">   
	<c:set var="str"
value="${fn:replace(row.replytext,'<','&lt;') }" />
	<c:set var="str"
value="${fn:replace(str,'>','&gt;') }" />	
	<c:set var="str"  
value="${fn:replace(str,'  ','&nbsp;&nbsp;')}" />
	<c:set var="str"
value="${fn:replace(str,newLineChar,'<br>') }" />	
	
	<tr>
		<td><input type="hidden" value="${row.rno}">${row.name}
			( <fmt:formatDate value="${row.regdate}"
				 pattern="yyyy-MM-dd a HH:mm:ss" /> )<br>
			${str}
			<!-- 본인이 작성한 댓글만 삭제 가능 표시 -->
			<c:if test="${sessionScope.userid == row.replyer}">
				<a href="${path}/Productreply/productReplydelete.do?rno=${row.rno}">삭제</a>
			</c:if>
		</td>
	</tr>
</c:forEach>
<!-- 페이지 네비게이션 출력 -->
	<tr>
		<td>
			<c:if test="${pager.curBlock > 1 }">
				<a href=
				"javascript:productlistReply('${pager.prevPage}')">
				[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="num" begin="${pager.blockBegin}"
			 end="${pager.blockEnd}">
			<c:choose>
				<c:when test="${num == pager.curPage}">
					<!-- 현재페이지 -->
					<span style="color:red;">${num}</span>
				</c:when>
				<c:otherwise>
					<!-- 현재페이지 아닐 때 -->
					<a href="javascript:productlistReply('${num}')">${num}</a>&nbsp;
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${pager.curBlock <= pager.totBlock}">
			<a href="javascript:productlistReply('${pager.nextPage}')">[다음]</a>
			</c:if>
		</td>
	</tr>	

	
</table>

</body>
</html>



















