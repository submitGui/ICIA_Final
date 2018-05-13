var oneNum = 0;
var twoNum = 0;
var openNum = 0;

/* window size */
var windowWidth = 0;
var windowHeight = 0;
var windowInnerWidth = 0;

var topFix = 0;

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();	

$(document).ready(function () {
	// 글로벌 변수에 윈도우 사이즈 저장하기
    windowWidth = $(window).width();
    windowHeight = $(window).height();
    windowInnerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	windowInnerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
	
	//기본 UL태그  첫li.first  끝li.last 
	ulListSet = function(){
		var ulList= $('ul');
		ulList.find("li:first-child").addClass("first");
		ulList.find("li:last-child").addClass("last");
	}
	ulListSet();

	var header = $('.head');
	var headerHome = $('.head .home');
	var headerGnb = $('.head .menu');
	headerH = header.height();
	$(window).scroll(function(){
		if($(document).scrollTop() >= headerH-1){
			headTop(true);
		};
		if($(document).scrollTop() <= headerH){
			headTop(false);
		};
				
	});
	
	function headTop(v) {
		if (v) {
			$(".contDirect").addClass("on");
			isShow = true;
			if (topFix == 0) {
				$(header).addClass("on");
				$(header).stop().animate({top:-105},800,'easeOutExpo');
			}
			if (typeof stopVisual !== 'undefined' && $.isFunction(stopVisual)) {stopVisual();}
		} else {
			$(".contDirect").removeClass("on");
			isShow = false;
			if (topFix == 0)  {
				$(header).removeClass("on");
				$(header).stop().animate({top:0},0,'swing');
			}
			if (typeof playVisual !== 'undefined' && $.isFunction(playVisual)) {playVisual();}
		}
	}
	
	if(oneNum != 0) {
		openNum = oneNum;
		$("#gnbMenu .mMenu").eq(openNum-1).find(">a").addClass( "on" );
		$("#gnbMenu .mMenu").eq(openNum-1).find(".sm").show();
		$("#gnbMenu .mMenu").eq(openNum-1).find(".sm").find("a").eq(twoNum-1).addClass("on");
		$(".lnbArea .menu li").eq(twoNum-1).addClass("on");
		$(".head .bar").stop().animate({"height":"35px"},200);
	}
	
	$("#gnbMenu .mMenu").each(function(q){
		q = q + 1;
		$(this).find(">a").mouseover(function(){
			$("#gnbMenu .mMenu>a").removeClass("on");
			$(this).addClass("on");
			
			$("#gnbMenu .mMenu>a").next().hide();
			$(this).next(".sm").show();
			
			$(".head .bar").stop().animate({"height":"35px"},200);
		}).focus(function(){
			$(this).mouseover();
		});
	});
	
	$('#gnbMenu .menu').mouseleave(function(){
		$("#gnbMenu .mMenu>a").removeClass("on");
		$("#gnbMenu .mMenu>a").next().hide();
		if (oneNum == 0) {
			$(".head .bar").stop().animate({"height":"0px"},200);
		} else {
			$("#gnbMenu .mMenu").eq(openNum-1).find(">a").addClass( "on" );
			$("#gnbMenu .mMenu").eq(openNum-1).find(".sm").show();
			$("#gnbMenu .mMenu").eq(openNum-1).find(".sm").find("a").eq(twoNum-1).addClass("on");
		}
	});
	
	$('ul#snsKind').hide();
	$('a.snsKind').click(function(){
		$('ul#snsKind').toggle();
		return false;
	});
	$('.footerSNS').mouseleave(function(){
		$('ul#snsKind').hide(); 
	})
	
	$(".contDirect").on("click", function () {
		if(isShow){
			$(this).removeClass("on");
			$('html,body').stop().animate({scrollTop:0},800);
			playVisual();
			isShow = false;
		}else{
			$(this).addClass("on");
			$('html,body').stop().animate({scrollTop:windowInnerHeight-44},800);
			stopVisual();
			isShow = true;
		}
	});
	
});

$( window ).resize(function() {
	windowWidth = $(window).width();
    windowHeight = $(window).height();
    windowInnerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
});

function setMainSlider(slideID,effectVar,intVar,autoVar) {
	$(slideID + ' .slides').bxSlider({
		mode: effectVar,
		auto: autoVar,
		pause: intVar,
		controls: false
	});
}


function popClose(popName) {
	$("."+popName).animate({"top":"-500px"},{duration:600, easing:"easeOutCubic"});
	$(".evDown").delay(400).animate({"top":"0px"},{duration:1000, easing:"easeOutCubic"});
}

function popOpen(popName) {
	$(".evDown").animate({"top":"-60px"},{duration:500, easing:"easeOutCubic"});
	$("."+popName).delay(300).animate({"top":"0px"},{duration:1000, easing:"easeOutCubic"});
}

function popInit(popName) {
	
	$(".evDown").animate({"top":"-60px"},{duration:500, easing:"easeOutCubic"});
	$("."+popName).delay(1000).animate({"top":"0px"},{duration:1000, easing:"easeOutCubic"});
	setMainSlider(".eArea","horizontal",5000,true);
}