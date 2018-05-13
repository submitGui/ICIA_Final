<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결혼할까요</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=1280,target-densitydpi=medium-dpi ">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/files/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/files/doMain.css">

<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/modernizr-2.6.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/jquery.bxslider.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/files/doMainStyle.js"></script>
<script src="${pageContext.request.contextPath}/resources/files/doMainVisualStyle.js"></script>
<script type="text/javascript" src="resources/js/jssor.slider.min.js"></script>
<script language="javascript">oneNum = 0; twoNum = 0; subState = false;</script>
<script type="text/javascript">	

	function LoginOpen(){

		var popUrl = "/member/login_form.do";	//팝업창에 출력될 페이지 URL

		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);

		}
</script>
<!-- 메세지함을 호출하기 위해 설정 -->
<script type="text/javascript">	
	function MessageOpen(){
		//팝업창에 호출될 URL, 메신저 컨트롤러의 메세지 리스트 호출. 현재 경로는 ~/member 이므로 부모 경로로 수준을 올라가서
		var popUrl = "/messenger/messagelist";

		var popOption = "width=600, height=600, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);

		}
</script>
 <script type="text/javascript">	
	function MypageOpen(){

		var popUrl = "/member/mypage.do";	//팝업창에 출력될 페이지 URL

		var popOption = "width=800, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);

		}
</script>
<script>
   (function(i, s, o, g, r, a, m) {
      i['GoogleAnalyticsObject'] = r;
      i[r] = i[r] || function() {
         (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
      a = s.createElement(o), m = s.getElementsByTagName(o)[0];
      a.async = 1;
      a.src = g;
      m.parentNode.insertBefore(a, m)
   })(window, document, 'script', '//www.google-analytics.com/analytics.js',
         'ga');

   ga('create', 'UA-65330408-2', 'auto');
   ga('send', 'pageview');
</script>

<script>
   jQuery(document).ready(function($) {

      var jssor_1_options = {
         $AutoPlay : true,
         $ArrowNavigatorOptions : {
            $Class : $JssorArrowNavigator$
         },
         $ThumbnailNavigatorOptions : {
            $Class : $JssorThumbnailNavigator$,
            $Cols : 9,
            $SpacingX : 3,
            $SpacingY : 3,
            $Align : 260
         }
      };
      try {
         var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
      } catch (e) {
      }

   });
</script>

<style>
table.person td {
   text-align: center;
}

table.person td.etc {
   text-align: left;
}

#jssor_1 {
   margin-top: 20px;
}

.jssora02l, .jssora02r {
   display: block;
   position: absolute;
   /* size of arrow element */
   width: 55px;
   height: 55px;
   cursor: pointer;
   background: url('/img/a02.png') no-repeat;
   overflow: hidden;
}

.jssora02l {
   background-position: -3px -33px;
}

.jssora02r {
   background-position: -63px -33px;
}

.jssora02l:hover {
   background-position: -123px -33px;
}

.jssora02r:hover {
   background-position: -183px -33px;
}

.jssora02l.jssora02ldn {
   background-position: -3px -33px;
}

.jssora02r.jssora02rdn {
   background-position: -63px -33px;
}

.jssort03 .p {
   position: absolute;
   top: 0;
   left: 0;
   width: 100px;
   height: 63px;
}

.jssort03 .t {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   border: none;
}

.jssort03 .w, .jssort03 .pav:hover .w {
   position: absolute;
   width: 100px;
   height: 63px;
   border: white 1px dashed;
   box-sizing: content-box;
}

.jssort03 .pdn .w, .jssort03 .pav .w {
   border-style: solid;
}

.jssort03 .c {
   position: absolute;
   top: 0;
   left: 0;
   width: 100px;
   height: 63px;
   background-color: #000;
   filter: alpha(opacity = 45);
   opacity: .45;
   transition: opacity .6s;
   -moz-transition: opacity .6s;
   -webkit-transition: opacity .6s;
   -o-transition: opacity .6s;
}

.jssort03 .p:hover .c, .jssort03 .pav .c {
   filter: alpha(opacity = 0);
   opacity: 0;
}

.jssort03 .p:hover .c {
   transition: none;
   -moz-transition: none;
   -webkit-transition: none;
   -o-transition: none;
}

* html .jssort03 .w {
   width /**/: 100px;
   height /**/: 63px;
}
</style>

<script type="text/javascript" defer="" async=""
   src="http://ssl.http.or.kr/HTTP_MSN/UsrConfig/parkruan/js/ASP_Conf.js?s=r9083629281933.531"></script>

   
</head>
<body style="">
   <div id="wrap">
	<%@ include file="include/menu.jsp"%>
   
   <div id="eventDownArea">
      <div class="evDown" style="top: -60px;">
         <a href="javascript:popOpen('evArea');"><img
            src="/resources/files/evDown.png"></a>
      </div>
   </div>

   <div id="visualArea" class="visualArea">
      <div class="visual-wrap"
         style="left: 0px; width: 1100px; height: 957px;">
         <div id="main-do-swipe">
            <div class="swipe-wrap">

               <figure id="do-cont-0" class="do_type_image"
                  style="width: 1100px; height: 957px; z-index: 1; top: 0px;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_1.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>

               <figure id="do-cont-1" class="do_type_image hide"
                  style="width: 1100px; height: 957px; top: 974px; z-index: 0;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_2.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>

               <figure id="do-cont-2" class="do_type_image hide"
                  style="width: 1100px; height: 957px; top: 974px; z-index: 0;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_3.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>

               <figure id="do-cont-3" class="do_type_image hide"
                  style="width: 1100px; height: 957px; top: 974px; z-index: 0;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_4.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>

               <figure id="do-cont-4" class="do_type_image hide"
                  style="width: 1100px; height: 957px; top: 974px; z-index: 0;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_7.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>

               <figure id="do-cont-5" class="do_type_image hide"
                  style="width: 1100px; height: 957px; top: 974px; z-index: 0;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_5.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>

               <figure id="do-cont-6" class="do_type_image hide"
                  style="width: 1100px; height: 957px; top: -974px; z-index: 0;">
               <p class="fig-content" style="width: 1100px; height: 957px;">
                  <img src="/resources/imgs/main/main_6.jpg" class="start-image"
                     style="opacity: 1; width: 1566px; height: 957px; top: 0px; left: -233px;">
               </p>
               </figure>
            </div>
         </div>

         <div class="main-foot-area">
            <div class="main-foot">
               <div class="tel">
                  <span>예약문의&nbsp;&nbsp;Tel 02-536-1010</span>
               </div>
               <div class="contDirect">See More Detail</div>
            </div>
         </div>
         <div class="main-btns-bg"></div>
      </div>
   </div>
   <div id="mainContents" style="margin-top: 0;">
      <div class="contents">
         <img src="/resources/imgs/main/content.jpg" style="margin:100px -50px;">
      </div>

   </div>
   <div class="clearFix"></div>
   <div class="clearFix"></div>
   <div id="footer">
      <div class="footerArea">
         <div class="footerLogo" style="margin-right: 160px;">
            <img src="${pageContext.request.contextPath}/resources/imgs/common/logo_bottom_marry.png">
         </div>
         <div class="footerAddr">
            
            
            (주)ICIA웨딩 | 사업자등록번호 123-55-789456 <br> <span>COPYRIGHT
               MarryMe ALL RIGHT RESERVED.</span>
         </div>
      </div>
   </div>
   </div>


   <!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
   <script type="text/javascript" src="http://wcs.naver.net/wcslog.js">
      
   </script>
   <script type="text/javascript">
      if (!wcs_add)
         var wcs_add = {};
      wcs_add["wa"] = "s_939855db746";
      if (!_nasa)
         var _nasa = {};
      wcs.inflow();
      wcs_do(_nasa);
   </script>
</body>
</html>