var twinMode = true;
var WINDOW_DEFAULT_WIDTH = 1800;
var WINDOW_DEFAULT_HEIGHT = 1100;
var WINDOW_MIN_HEIGHT = 660;
var WINDOW_MIN_WIDTH = 1100;

var NAVIGATION_WIDTH = 0;

var idTag = "do-cont-";
var addCount = 0;
var keyvisualLen = 0;
var currentBrowserMode="";
var currentKeyvisualIdx = -1;
var currentKeyvisualType = "";
var hideKeyvisualIdx = -1;
var isStartTimer = false;
var isStart = false;
var isTransition = false;

var TYPE_IMAGE = "image";
var TYPE_VIDEO = "video";

// 비주얼 기본 크기
var VISUAL_DEFAULT_WIDTH = 1800;
var VISUAL_DEFAULT_HEIGHT = 1100;

// 타이틀 중앙 지점 (네비게이션 제외한 넓이)
var CENTER_X = 700;
var POS_TL = 0;
var POS_TC = 1;
var POS_TR = 2;
var POS_BL = 3;
var POS_BC = 4;
var POS_BR = 5;

var timer = 0;
var time = 4000;
var timerCount = 0;
var isPlay = false;
var arrTitlePosX = [];

var mySwipe = "";
var retryTime = 20;

/* window size */
var windowWidth = 0;
var windowHeight = 0;
var windowInnerWidth = 0;

/* index */
var currentIndex = -1;
var isShow = false;

var od = 0;
var subState = true;

$(document).ready(function () {
	
	// 글로벌 변수에 윈도우 사이즈 저장하기
    windowWidth = $(window).width();
    windowHeight = $(window).height();
    windowInnerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	windowInnerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
	
	keyvisualLen = $(".visual-wrap figure").length;

	isPlay = true;
	$(".visualArea .main-btns > a").on("click", function () {
        if(isPlay){
            stopVisual();
        }else{
            playVisual();
        }
        return false;
	});
	$(".btn_do_indicator").on("click", function () {
		var index = $(this).index();
        if(index != currentKeyvisualIdx && !isTransition) {

            timerCount = index;
            onChange_keyVisual(index, true);
            //_this.onResize();
        }
        return false;
	});
	$("section").css("height", "auto");
	$(".visualArea .main-btns > a").removeClass("on");
	
	twinStart();

});


function twinStart() {
	var keyvisualImage =(".visual-wrap figure .fig-content .start-image");
	var header = $('.head');
	
	$(".start-image").css("opacity", 0);
	$(".visual-wrap").css("left", 0);	
	imgResize();
	
	onChange_keyVisual(0, false);
	TweenLite.killTweensOf(keyvisualImage);
	TweenLite.to(keyvisualImage, 1.0, {css:{"opacity": 1}, onComplete:nextFunc});
		
	topFix = 0; //topCheck
	function nextFunc() {
	}
}



function onChange_keyVisual($idx, $isTrans){
	if(currentKeyvisualIdx != $idx) {

		var oldIdx = currentKeyvisualIdx;
		var isNext = true;

		stopTimer();
		if($idx > currentKeyvisualIdx){
			isNext = false;
		}

		if(currentKeyvisualIdx != -1) {
			if (twinMode) {
				hideKeyvisual(currentKeyvisualIdx, $isTrans, isNext);
			}
			hideIndicator(currentKeyvisualIdx);
		}

		currentKeyvisualIdx = $idx;

		showKeyvisual(currentKeyvisualIdx, $isTrans, isNext);
		showIndicator(currentKeyvisualIdx);
	}
}

function showKeyvisualComplete(){
	var index = $(this).index()-1;
	startTimer();
	isTransition = false;
}

/* left right */
/*function showKeyvisual($idx, $isTrans, $isNext){
	var selectorKeyvisual = $(".visual-wrap figure").eq($idx);
	var startX = 0;
	if (twinMode) {
		if ($isTrans) {
			if ($isNext) {
				startX = (windowInnerWidth / 4);
			} else {
				startX = -(windowInnerWidth / 4);
			}
			selectorKeyvisual.removeClass("hide").css({"z-index": 1, "left": startX})
		} else {
			selectorKeyvisual.removeClass("hide").css({"z-index": 1, "left": startX});
		}
		slideInKeyvisual(selectorKeyvisual, $isTrans, 0, 0, "animation-slide-keyvisual")
	} else {
		mySwipe.slide($idx);
	}
}

function slideInKeyvisual($target, $isTrans, $startX, $endX, $motionClass){
	isTransition = true;
	TweenLite.killTweensOf($target);
	TweenLite.to($target, 0.8, {"css":{"left":$endX}, ease:Cubic.easeInOut, onComplete:this.showKeyvisualComplete});
}

function slideOutKeyvisual($target, $isTrans, $startX, $endX, $motionClass){
	this.isTransition = true;
	TweenLite.killTweensOf($target);
	TweenLite.to($target, 0.8, {"css":{"left":$endX}, ease:Cubic.easeInOut, onComplete:this.hideKeyvisualComplete});
}

function hideKeyvisual($idx, $isTrans, $isNext){

	var selectorKeyvisual = $(".visual-wrap figure").eq($idx);
	var targetX = 0;

	this.hideKeyvisualIdx = $idx;

	if($isNext){
		targetX = -windowInnerWidth;
	}else{
		targetX = windowInnerWidth;
	}

	if($isTrans) {
		selectorKeyvisual.removeClass("animation-slide-keyvisual").css({"z-index": 2, "left": 0});
	}else{
		selectorKeyvisual.css({"z-index": 2, "left": targetX});
	}

	slideOutKeyvisual(selectorKeyvisual, $isTrans, 0, targetX, "animation-slide-keyvisual")
}*/


/* up down */
function showKeyvisual($idx, $isTrans, $isNext){
	var selectorKeyvisual = $(".visual-wrap figure").eq($idx);
	var startY = 0;
	if (twinMode) {
		if ($isTrans) {
			if ($isNext) {
				startY = (windowInnerHeight / 4);
			} else {
				startY = -(windowInnerHeight / 4);
			}
			selectorKeyvisual.removeClass("hide").css({"z-index": 1, "top": startY})
		} else {
			selectorKeyvisual.removeClass("hide").css({"z-index": 1, "top": startY});
		}
		slideInKeyvisual(selectorKeyvisual, $isTrans, 0, 0, "animation-slide-keyvisual")
	} else {
		mySwipe.slide($idx);
	}
}

function slideInKeyvisual($target, $isTrans, $startY, $endY, $motionClass){
	isTransition = true;
	TweenLite.killTweensOf($target);
	TweenLite.to($target, 0.8, {"css":{"top":$endY}, ease:Cubic.easeInOut, onComplete:this.showKeyvisualComplete});
}

function slideOutKeyvisual($target, $isTrans, $startY, $endY, $motionClass){
	this.isTransition = true;
	TweenLite.killTweensOf($target);
	TweenLite.to($target, 0.8, {"css":{"top":$endY}, ease:Cubic.easeInOut, onComplete:this.hideKeyvisualComplete});
}


function hideKeyvisual($idx, $isTrans, $isNext){

	var selectorKeyvisual = $(".visual-wrap figure").eq($idx);
	var targetX = 0;

	this.hideKeyvisualIdx = $idx;

	if($isNext){
		targetY = -windowInnerHeight;
	}else{
		targetY = windowInnerHeight;
	}

	if($isTrans) {
		selectorKeyvisual.removeClass("animation-slide-keyvisual").css({"z-index": 2, "top": 0});
	}else{
		selectorKeyvisual.css({"z-index": 2, "top": targetY});
	}

	slideOutKeyvisual(selectorKeyvisual, $isTrans, 0, targetY, "animation-slide-keyvisual")
}

function hideKeyvisualComplete(){
	var index = $(this).index()-1;
	var selectorKeyvisual = $(".visual-wrap figure").eq(hideKeyvisualIdx);
	selectorKeyvisual.css({"z-index": 0}).addClass("hide");
	isTransition = false;
}

function playVisual(){
	isPlay = true;
	startTimer();
	$(".visualArea .main-btns > a").removeClass("on");
}

function stopVisual(){
	isPlay = false;
	stopTimer();
	$(".visualArea .main-btns > a").addClass("on");
}


function startTimer(){
	if (!isStartTimer && keyvisualLen > 1 && isPlay) {
		timer = window.setInterval(timerEventHandler, time);
		isStartTimer = true;
	}
}

function stopTimer(){
	if (isStartTimer && keyvisualLen > 1) {
		window.clearInterval(timer)
		isStartTimer = false;
	}
}

function resetTimer(){
	stopTimer();
	startTimer();
}

function timerEventHandler(){
	timerCount++
	if(timerCount == keyvisualLen){
		timerCount = 0;
	}
	if (twinMode) {
		onChange_keyVisual(timerCount, true);
	} else {
		mySwipe.slide(timerCount);
	}
}


function showIndicator ($idx){
    var selector = $(".btn_do_indicator:eq("+$idx+")");
	selector.addClass("on");
}

function hideIndicator($idx){
    var selector = $(".btn_do_indicator:eq("+$idx+")");
	selector.removeClass("on");
}

$( window ).resize(function() {
	imgResize();
});


function imgResize() {
	windowWidth = $(window).width();
    windowHeight = $(window).height();
    windowInnerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	
	windowInnerWidth = windowWidth;
	//setImageUrl();
	var width = WINDOW_DEFAULT_WIDTH;
	var height = WINDOW_DEFAULT_HEIGHT;

	var per = sumSizePer(windowInnerWidth, windowHeight, width, height);
	var i = 0;

	setImgSize(per);

	if (!isStart) {
		isStart = true;
	} else {
		resetTimer();
	}
	
	setIndicatorPos();
}

function setTitlePos($idx){
	var target = $("#"+idTag+$idx+" .fig-txt");
	var targetImg = $("#"+idTag+$idx+" .fig-txt img")
	setCenterPos(target, targetImg);
}

function setIndicatorPos(){
	var indicatorCon = $(".visual-wrap .main-btns");
	var indicatorW = $(".visual-wrap .main-btns").width()/2;
	indicatorCon.css({"left":"50%", "margin-left":-indicatorW+(NAVIGATION_WIDTH/2)});
}

function setPlayBtnPos($idx){
	var target = $("#"+idTag+$idx+" .fig-btn-play");
	var targetImg = $("#"+idTag+$idx+" .fig-btn-play img")
	setCenterPos(target, targetImg);
}

function setCenterPos($target, $targetImg){
	windowInnerWidth = windowWidth;
	var per = windowInnerWidth / WINDOW_DEFAULT_WIDTH
	var posCenterX = CENTER_X * per;
	var targetWidth = $targetImg.width();
	var targetX = posCenterX - (targetWidth/2)

	$target.css("left",targetX);
}

function setImgSize($per){
	var per = $per;
	var selectorFiguer = $(".visual-wrap figure");
	var selectorImgCon = $(".do_type_image");

	var selectorImgParent = $(".fig-content");
	var selectorImg = $(".fig-content img");
	
	var width = Math.floor(VISUAL_DEFAULT_WIDTH * per);
	var height = Math.floor(VISUAL_DEFAULT_HEIGHT * per);
	var posX = 0;
	var posY = 0;
	var headerHeight = 0;
	var containerHeight = windowHeight;
	
	/*if (windowWidth < WINDOW_MIN_WIDTH) {
		windowInnerWidth = WINDOW_MIN_WIDTH;
	} else {
		windowInnerWidth = windowWidth;
	}*/
	
	//windowInnerWidth = windowWidth;
	
	windowInnerWidth = $("#visualArea").width();
	
	if(windowInnerWidth < width){
		posX = -((width - windowInnerWidth)/2) + (NAVIGATION_WIDTH/2);
	} else {
		posX = -((width - windowInnerWidth)/2) + (NAVIGATION_WIDTH/2);
	}

	if(windowHeight < height){
		posY = -((height - windowHeight)/2);
	}
	
	$(".visual-wrap").css({"width":windowInnerWidth, "height":containerHeight});
	selectorImg.css({"width":width, "height":height, "top": posY, "left":posX});
	selectorImgParent.css({"width":windowInnerWidth, "height":(height-posY-headerHeight)});
	selectorImgCon.css({"width":windowInnerWidth, "height":(height-posY-headerHeight)});
	selectorFiguer.css({"width":windowInnerWidth, "height":containerHeight});
	
}



function sumSizePer($targetWidth, $targetHeight, $defaultWidth, $defaultHeight){
	var perWidth = $targetWidth / $defaultWidth;
	var perHeight = $targetHeight / $defaultHeight;
	var per = 0;

	if(perWidth > perHeight){
		per = perWidth;
	}else{
		per = perHeight;
	}
	
	return per;
}

