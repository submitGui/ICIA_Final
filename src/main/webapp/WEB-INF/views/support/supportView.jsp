<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<script language="javascript">
	oneNum = 2;
	twoNum = 5;
	subState = true;
</script>
<div class="subSlide">
		<div class="subImg" style="display: block; height: 320px;">
			<img src="/files/subimg_wed.jpg">
		</div>
		<div class="subTxt" style="display: block;">
			<img src="/files/subtxt_wed.png">
		</div>
	</div>
	
	<div class="subContainer">
		<div class="container">
			<div class="lnbArea">
		<div class="lnbMenu">
			<h2 class="tit">Support</h2>
			<ul class="menu">
				<li class="s1"><a href="/wedding/garden.html"><span>자주 묻는질문</span></a></li>
				<li class="s2"><a href="/wedding/hall.html"><span>1:1 이메일 상담</span></a></li>
				
			</ul>
		</div>
	</div>

<script>
	$(document).ready(function () {
		$(".lnbArea .menu a").eq(twoNum-1).addClass("on");
	});
</script>			<div id="content">
				<h3>Wedding Price
				<span class="sub">비용</span>
				</h3>
				<div class="location">
					<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; Wedding &gt; <strong>price</strong></p>
				</div>
				<div class="wedding">
					
					
					<div class="hallDesc">


					<div class="guide">
							
					<table class="pricelist mt20">
						<caption>기본사항</caption>
						<thead>
							<tr>
								<th scope="col" style="width:270px">품목(ITEM)</th>
								<th scope="col" style="width:100%">내용(CONTENTS)</th>
								<th scope="col" style="width:100px" class="tEnd">가격(PRICE)</th>
							</tr>
						</thead>
						<tbody>
						
						<tr>
							<th scope="row" class="tStart">평균 홀대관료</th>
							<td>파크홀(동시 200명/분리 400명), 야외 가든웨딩(분리 400명)</td>
							 
							<td rowspan="10" class="tEnd">별도문의</td>
							
						</tr>
						
						<tr>
							<th scope="row" class="tStart">평균 폐백실 사용료</th>
							<td>폐백실 및 폐백의상(활옷+사모관대), 기타용품(수모비별도)</td>
							
						</tr>
						
						<tr>
							<th scope="row" class="tStart">혼구용품</th>
							<td>성혼선언문, 혼인서약서, 방명록, 축지, 장갑, 봉투외</td>
							
						</tr>
						
						<tr>
							<th scope="row" class="tStart">웨딩연출/진행/중계 </th>
							<td>영상조명, 특수효과, 실시간 중계, 전담 예식매니저</td>
							
						</tr>
						</tbody>
					</table>

					<table class="pricelist mt20">
						<caption>기본품목</caption>
						<thead>
							<tr>
								<th scope="col" style="width:270px">품목(ITEM)</th>
								<th scope="col" style="width:100%">내용(CONTENTS)</th>
								<th scope="col" style="width:100px" class="tEnd">가격(PRICE)</th>
							</tr>
						</thead>
						<tbody>
						
						<tr>
							<th scope="row" class="tStart">생화장식(Flower Decoration)</th>
							<td>홀내 웨딩세팅 및 전체생화장식</td>							 
							<td rowspan="10" class="tEnd">별도문의</td>
							
						</tr>
						
						<tr>
							<th scope="row" class="tStart">웨딩연주(Wedding Music)</th>
							<td>재즈 3중주</td>							
						</tr>
						</tbody>
					</table>

					<table class="pricelist mt20">
						<caption>FOOD & BEVERAGE</caption>
						<thead>
							<tr>
								<th scope="col" style="width:100px">품목(ITEM)</th>
								<th scope="col" style="width:100px">가격(PRICE)</th>
								<th scope="col" style="width:100px">품목(ITEM)</th>
								<th scope="col" style="width:100px">가격(PRICE)</th>
								<th scope="col" style="width:100%">품목(ITEM)</th>
								<th scope="col" style="width:100px">가격(PRICE)</th>
								<th scope="col" style="width:100px" class="tEnd">비고</th>
							</tr>
						</thead>
						<tbody>
						
						<tr>
							<th scope="row" class="tStart">Course_A</th>
							<td class="tRight">55,000원</td>
							<th scope="row" class="tStart">Course_D</th>
							<td class="tRight">98,000원</td>
							<th scope="row" class="tStart">음료</th>
							<td class="tRight">3,000원</td>
							<td rowspan="4" class="tEnd">실수량정산</td>
						</tr>
						
						<tr>
							<th scope="row" class="tStart">Course_B</th>
							<td class="tRight">68,500원</td>
							<th scope="row" class="tStart">Course_E</th>
							<td class="tRight">128,000원</td>
							<th scope="row" class="tStart">맥주</th>
							<td class="tRight">6,000원</td>
						</tr>
						
						<tr>
							<th scope="row" class="tStart">Course_C</th>
							<td class="tRight">87,000원</td>
							<th scope="row" class="tStart">Course_F</th>
							<td class="tRight">185,000원</td>
							<th scope="row" class="tStart">와인</th>
							<td class="tRight">40,000원</td>
						</tr>

						<tr>
							<td colspan="4" scope="row" class="tStart">※ 소인(6세 이하) : 메뉴가 60%부과</td>
							
							<th scope="row" class="tStart">고량주</th>
							<td class="tRight">30,000원~</td>
						</tr>

						</tbody>
					</table>


					<table class="pricelist mt20">
						<caption>선택사항</caption>
						<thead>
							<tr>
								<th scope="col" style="width:100px">품목(ITEM)</th>
								<th scope="col" style="width:80px">가격(PRICE)</th>
								<th scope="col" style="width:100px">품목(ITEM)</th>
								<th scope="col" style="width:80px">가격(PRICE)</th>
								<th scope="col" style="width:100%">품목(ITEM)</th>
								<th scope="col" style="width:80px">가격(PRICE)</th>
								<th scope="col" style="width:100px" class="tEnd">비고</th>
							</tr>
						</thead>
						<tbody>
						
						<tr>
							<th scope="row" class="tStart">본식 원판촬영</th>
							<td rowspan="6" class="tCenter">별도문의</td>
							<th scope="row" class="tStart">전문주례자</th>
							<td rowspan="6" class="tCenter">별도문의</td>
							<th scope="row" class="tStart">헤어/메이크업(신부)</th>
							<td rowspan="6" class="tCenter">별도문의</td>
							<td rowspan="6" class="tEnd">구성에 따라 상품금액이 상이할 수 있습니다</td>
						</tr>
						
						<tr>
							<th scope="row" class="tStart">본식 원판+스넵</th>							
							<th scope="row" class="tStart">전문사회자</th>							
							<th scope="row" class="tStart">헤어/메이크업(신랑)</th>							
						</tr>
						
						<tr>
							<th scope="row" class="tStart">비디오(DVD)</th>							
							<th scope="row" class="tStart">포토테이블</th>							
							<th scope="row" class="tStart">혼주메이크업</th>							
						</tr>

						<tr>
							<th scope="row" class="tStart">식전영상제작</th>							
							<th scope="row" class="tStart">메뉴/덕담카드</th>							
							<th scope="row" class="tStart">부케세트</th>							
						</tr>

						<tr>
							<th scope="row" class="tStart">현악 3중주</th>							
							<th scope="row" class="tStart">폐백수모</th>							
							<th scope="row" class="tStart">청첩장</th>							
						</tr>

						<tr>
							<th scope="row" class="tStart">재즈 3중주</th>							
							<th scope="row" class="tStart">폐백음식</th>							
							<th scope="row" class="tStart"></th>							
						</tr>

						</tbody>
					</table>



					</DIV>
					
					
				</div><!-- /class wedding -->
			</div><!-- /content -->
		</div><!-- /container -->
	</div><!-- /subContainer -->
	
<div class="clearFix"></div>
<div id="footer">
		<div class="footerArea">
			<div class="footerLogo" style="margin-right:100px;">
				<img src="${pageContext.request.contextPath}/resources/imgs/common/logo_bottom_marry.png">
			</div>
			<div class="footerAddr">

				(주)결혼할까요 |  사업자등록번호 123-55-789456 <br>
				<span>COPYRIGHT MarryMe ALL RIGHT RESERVED.</span>

				
			</div>

		</div>
	</div>
	</div>

<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_939855db746";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>


</body></html>