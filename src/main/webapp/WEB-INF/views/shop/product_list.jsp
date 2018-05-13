<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- views/shop/product_list.jsp -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko-KR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ICIA Wedding</title>
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

</head>

<body>
   <%@ include file="../include/menu.jsp"%>
	<!-- 게시판 -->
	<div id="mainContents" style="margin-top: 0; min-height:1300px;">
      <div class="contents">
         <h1 style="margin-top: 100px; color: #8E6138;">Wedding Auction</h1>
			<div class="row" style="margin-top: 20px; padding: 50px; border-top: 5px solid #eae6d2; height: 100px;">
				<!-- 검색폼 -->
				<div style="text-align:center">
					<form action="${path}/shop/product/list.do" method="post">
						<select name="search_option">
							<option value="product_name"
								<c:if test="${map.search_option == 'product_name'}">selected</c:if>>기업명</option>
							<option value="product_date"
								<c:if test="${map.search_option == 'product_date'}">selected</c:if>>경매날짜</option>
							<option value="price"
								<c:if test="${map.search_option == 'price'}">selected</c:if>>가격</option>
							<option value="all"
								<c:if test="${map.search_option == 'all'}">selected</c:if>>기업명+경매날짜+가격</option>
						</select> <input name="keyword" value="${map.keyword}"> <input
							type="submit" value="조회">
					</form>
				</div>
			</div>
			<div class="row" style="margin-top: 20px; padding: 50px; border: 5px double #eae6d2; height: 1040px;">
            <c:forEach var="row" items="${map.list}">
               <div class="col-md-4 col-sm-4 col-xs-4" style="margin-bottom: 20px;">
                  <!-- colored -->
                  <div class="ih-item square colored effect3 bottom_to_top">
                     <a href="${path}/shop/product/detail/${row.product_id}">
                     <c:if test="${sessionScope.admin_userid != null}"><br>
                  	<a href="${path}/shop/product/edit/${row.product_id}"> [편집]</a>
               		</c:if>
                        <div class="img" style="background-size:cover;">
                           <img src="${path}/images/${row.picture_url}" alt="img">
                        </div>
                        <div class="info" style="background:#8E6137;">
                           <h3>${row.product_name}</h3>
                           <p><fmt:formatNumber value="${row.price}" pattern="#,###" /></p>
                        </div>
                     </a>
                  </div>
                  <!-- end colored -->
               </div>
            </c:forEach>
         </div>
         <!-- 페이징 -->
			<div class="col-md-4 col-sm-4 col-xs-4"></div>
			<div class="col-md-4 col-sm-4 col-xs-4">
				<div style="text-align:center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="#" onclick="list('${map.pager.prevPage}')"> [이전]</a>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}"
					end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color: red;">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${map.pager.curPage < map.pager.totPage}">
					<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
				</c:if>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4"></div>
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