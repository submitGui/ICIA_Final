<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- views/include/menu.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/include/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${path}/include/style.css">
<script type="text/javascript">
	function LoginOpen() {

		var popUrl = "${path}/member/login_form.do"; //팝업창에 출력될 페이지 URL

		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);

	}
</script>
<script type="text/javascript">
	function MypageOpen() {

		var popUrl = "${path}/member/mypage.do"; //팝업창에 출력될 페이지 URL

		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);

	}
</script>
<!-- 메세지함을 호출하기 위해 설정 -->
<script type="text/javascript">
	function MessageOpen() {
		//팝업창에 호출될 URL, 메신저 컨트롤러의 메세지 리스트 호출. 현재 경로는 ~/member 이므로 부모 경로로 수준을 올라가서
		var popUrl = "${path}/messenger/messagelist";

		var popOption = "width=600, height=600, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)

		window.open(popUrl, "", popOption);

	}
</script>

<div class="head"
	style="top: 0px; background-color: white; height: 150px;">
	<div class="header">
		<img src="${pageContext.request.contextPath}/resources/imgs/common/logo_bottom_marry.png"
			style="margin-left: 430px;">
		<div style="position: absolute; top: 0px; right: 0px;">
			<c:choose>
				<c:when test="${sessionScope.name == null }">
					<!-- 로그인하지 않은 상태 -->
					<a href="javascript:LoginOpen()">로그인</a>
				</c:when>
				
				<c:otherwise>
					<!-- 로그인한 상태 -->
				<b>${sessionScope.name}</b>님이 로그인중입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/member/logout.do">로그아웃</a>
				<br>
				현재 보유 포인트 : <b>${member_point}</b> 포인트
				<br>
				<a href="javascript:MypageOpen()">마이페이지</a> | 
					<a href="javascript:MessageOpen()">메세지함</a> | 
					
					<c:if test="${sessionScope.member_type == 'B'}">
						<%-- sessionScope.userid !=  --%>
						<a href="${path}/shop/product/write.do">기업홍보글 작성</a> | 
					</c:if>

					<c:if test="${sessionScope.userid == 'admin'}">
   					<a href="${path}/member/memberList">일반회원 포인트 관리</a>
					</c:if>
					
					
				</c:otherwise>
			</c:choose>
			<div class="evDown" style="top: -60px;">
				<a href="/whatsNew/event/"> <img
					src="/resources/files/evDown.png"></a>
			</div>
		</div>
		<div id="gnbMenu" class="gnbMenu" style="margin-top: 20px;">
			<div class="home">
				<a href="/">결혼할까요</a>
			</div>
			<ul class="menu">
				<li class="m1 mMenu first"><a href="#"><span>공지사항</span></a></li>
				<li class="m2 mMenu"><a href="/member/locationView.do">이용안내<span></span></a>
				<li class="m3 mMenu"><a href="/board/list.do"><span>Custom
							Wedding</span></a></li>
				<li class="m4 mMenu"><a href="/shop/product/list.do"><span>Wedding
							Auction</span></a></li>
				<li class="m5 mMenu last"><a href="/member/supportView.do"><span>고객지원</span></a></li>
			</ul>
		</div>
	</div>
</div>