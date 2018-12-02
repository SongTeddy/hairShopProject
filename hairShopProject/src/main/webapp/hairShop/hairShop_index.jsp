<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
/* 좋아요 css */
.btn_like {
  position: absolute;
  margin: 26% 95%;
  display: block;
  width: 44px;
  height: 44px;
  border: 1px solid #e8e8e8;
  border-radius: 44px;
  font-family: notokr-bold,sans-serif;
  font-size: 14px;
  line-height: 16px;
  background-color: #fff;
  color: #DD5D54;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
  cursor: pointer;
}

.btn_like:hover {
  border: 1px solid rgba(228,89,89,0.3);
  background-color: rgba(228,89,89,0.02);
  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
}

.btn_unlike .img_emoti {
    background-position: -30px -120px;
}

.img_emoti {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
    text-indent: -9999px;
    vertical-align: top;
    width: 20px;
    height: 17px;
    margin-top: 1px;
    background-position: 0px -120px;
    text-indent: 0;
}

.btn_like .ani_heart_m {
    margin: -63px 0 0 -63px;
}

.ani_heart_m {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 125px;
    height: 125px;
    margin: -63px 0 0 -63px;
    pointer-events: none;
}

.ani_heart_m.hi {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
    -webkit-background-size: 9000px 125px;
    background-size: 9000px 125px;
    animation: on_m 1.06s steps(72);
}

.ani_heart_m.bye {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
    -webkit-background-size: 8250px 125px;
    background-size: 8250px 125px;
    animation: off_m 1.06s steps(66);
}

@keyframes on_m {
  from { background-position: 0 }
  to { background-position: -9000px }
}

@keyframes off_m {
  from { background-position: 0 }
  to { background-position: -8250px }
}
/* 좋아요 */


/* 리뷰 css */
/* 리뷰 관련 css */
.info_area{
	line-height: 25px;
	font-family: 함초롬돋움; 
	font-size: 17px;
	font-weight: bold;
}
.reviewcontent_area{
	line-height: 25px;
	font-family: 함초롬돋움; 
	font-size: 17px;
}
.star_name_logtime_area{
	line-height: 25px;
	font-family: 함초롬돋움; 
	font-size: 17px;
}

button.disable {
	cursor: not-allowed;
	background-color: gray;
}

div.tab-div {
	padding-bottom: 70px;
	outline: none;
}

li.tab {
	padding-bottom: 30px;
}

div.tab-div :focus {
	outline: none;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Source Sans Pro';
	font-weight: 700;
}

.fancyTab {
	text-align: center;
	vertical-align: middle;
	padding: 15px 0;
	background-color: #eee;
	box-shadow: 0 0 0 1px #ddd;
	height: 70px;
	top: 15px;
	transition: top .2s;
}

.fancyTab.active {
	height: 70px;
	transition: height .2s;
	font-weight: bold;
}

.whiteBlock {
	display: none;
}

.fancyTab.active .whiteBlock {
	display: block;
	/* 		  height:2px;
 */
	bottom: -2px;
	background-color: #fff;
	width: 99%;
	position: absolute;
	z-index: 1;
}

.fancyTab a {
	font-family: 'Source Sans Pro';
	font-size: 1.65em;
	font-weight: 300;
	transition: .2s;
	color: #333;
}

/*.fancyTab .hidden-xs {
		  white-space:nowrap;
		}*/
.fancyTabs {
	border-bottom: 2px solid #ddd;
	margin: 15px 0 0;
}

li.fancyTab a {
	padding-top: 15px;
	top: -15px;
	padding-bottom: 0;
}

li.fancyTab.active a {
	/* 		  padding-top: inherit; */
	
}

.fancyTab .fa {
	font-size: 40px;
	width: 100%;
	padding: 15px 0 5px;
	color: #666;
}

.fancyTab.active .fa {
	color: #cfb87c;
}

.fancyTab a:focus {
	outline: none;
}

.fancyTabContent {
	border-color: transparent;
	box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
	padding: 30px 15px 15px;
	position: relative;
	background-color: #fff;
	text-align: center;
}

.nav-tabs>li.fancyTab.active>a, .nav-tabs>li.fancyTab.active>a:focus,
	.nav-tabs>li.fancyTab.active>a:hover {
	border-width: 0;
}

.nav-tabs>li.fancyTab:hover {
	background-color: #f9f9f9;
	box-shadow: 0 0 0 1px #ddd;
}

.nav-tabs>li.fancyTab.active:hover {
	background-color: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd
		inset;
}

.nav-tabs>li.fancyTab:hover a {
	border-color: transparent;
}

.nav.nav-tabs .fancyTab a[data-toggle="tab"] {
	background-color: transparent;
	border-bottom: 0;
}

.nav-tabs>li.fancyTab:hover a {
	border-right: 1px solid transparent;
}

.nav-tabs>li.fancyTab>a {
	margin-right: 0;
	border-top: 0;
	padding-bottom: 30px;
	margin-bottom: -30px;
}

.nav-tabs>li.fancyTab {
	margin-right: 0;
	margin-bottom: 0;
}

.nav-tabs>li.fancyTab:last-child a {
	border-right: 1px solid transparent;
}

.nav-tabs>li.fancyTab.active:last-child {
	border-right: 0px solid #ddd;
	box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
}

.fancyTab:last-child {
	box-shadow: 0 0 0 1px #ddd;
}

.tabs .nav-tabs li.fancyTab.active a {
	box-shadow: none;
	top: 0;
}

.fancyTab.active {
	background: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd
		inset;
	padding-bottom: 30px;
}

.arrow-down {
	display: none;
	width: 0;
	height: 0;
	border-left: 20px solid transparent;
	border-right: 20px solid transparent;
	border-top: 22px solid #ddd;
	position: absolute;
	top: -1px;
	left: calc(10% - 20px);
}

.arrow-down-inner {
	width: 0;
	height: 0;
	border-left: 18px solid transparent;
	border-right: 18px solid transparent;
	border-top: 12px solid #fff;
	position: absolute;
	top: -22px;
	left: -18px;
}

.fancyTab.active .arrow-down {
	display: block;
}

@media ( max-width : 1200px) {
	.fancyTab .fa {
		font-size: 36px;
	}
	.fancyTab .hidden-xs {
		font-size: 22px;
	}
}

@media ( max-width : 992px) {
	.fancyTab .fa {
		font-size: 33px;
	}
	.fancyTab .hidden-xs {
		font-size: 13px;
		font-weight: normal;
	}
}

@media ( max-width : 768px) {
	.fancyTab>a {
		font-size: 18px;
	}
	.nav>li.fancyTab>a {
		padding: 15px 0;
		margin-bottom: inherit;
	}
	.fancyTab .fa {
		font-size: 30px;
	}
	.nav-tabs>li.fancyTab>a {
		border-right: 1px solid transparent;
		padding-bottom: 0;
	}
	.fancyTab.active .fa {
		color: #333;
	}
}

td.serviceCheck {
	opacity: 0.4;
	cursor: pointer;
}

td.check {
	opacity: 1;
	cursor: pointer;
}

/* tab 메뉴 */
.z-tabs {
	margin: 10px;
	display: inline-block;
	border-bottom: 1px solid #ddd;
	width: 80%;
	padding: 0;
}

.z-tabs>li {
	display: inline;
	float: left;
	margin-bottom: 8px;
	width: 25%;
}

.z-tabs>li>a {
	text-decoration: none;
	padding: .5em 1em;
	border-radius: 4px 4px 0 0;
	background: #fff;
	color: #37b;
	font-size: 20pt;
}

.z-tabs>li>a:hover {
	background: #ddd;
}

.z-tabs>li.active>a {
	border: 1px solid #ddd;
	border-bottom-color: transparent;
	cursor: default;
	color: #000;
}

.z-tabs>li.active>a:hover {
	background: #fff;
}
/*  z-tab 위에 메뉴 css--> 	*/
.reserve-haircut {
	cursor: pointer;
}

.reserve-hairperm {
	cursor: pointer;
}

.reserve-hairdye {
	cursor: pointer;
}

.reserve-hairstyling {
	cursor: pointer;
}

.reserve-hairclinic {
	cursor: pointer;
}

button.timeOptionBtn {
	border-radius: 3em;
	margin: 5px 8px;
}

.reserveTable {
    max-width: 96%;
	vertical-align: middle;
	margin: 0.4%;
}
.reserveTable tr{
	border-top: 1px solid; 
	border-bottom: 1px solid; 
	border-color: #ddd;
}

/* 	서비스 리스트    */
.serviceChoice {
	margin-left: 20px;
	margin-right: 20px;
	width: 100%;
	text-align: left;
}

.tl_default {
	cursor: pointer;
	padding: 10px;
	border: 1px solid #ddd;
	position: relative;
	float: left;
	margin: 0.28%;
	margin-bottom: 19px;
	width: 18.8%;
	display: list-item;
	text-align: -webkit-match-parent;
}

.td_t {
	display: inline-block;
	overflow: hidden;
	max-height: 36px;
	color: #222;
	vertical-align: top;
	letter-spacing: -.5px;
	font-weight: 700;
	font-size: 18px;
	line-height: 18px;
	zoom: 1;
	display: inline;
	text-align: left;
}

.td_t {
	text-align: right;
}

.td_ow {
	display: block;
	text-align: right;
	overflow: hidden;
	padding-top: 4px;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: #ee0006;
}

.td_o {
	color: #888;
	text-align: right;
	display: block;
	text-align: right;
	overflow: hidden;
	padding-top: 4px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

li.chosen {
	background-color: #ebebeb;
}

img.designerImages {
	width: 100%;
	border-radius: 10em;
	margin: 10px;
}

button.selectedBtn {
	background-color: lime;
}
</style>
<!-- css -->
<link href="/hairShopProject/hairShop/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="/hairShopProject/hairShop/css/style.css" rel="stylesheet"
	media="screen">
<link href="/hairShopProject/hairShop/color/default.css"
	rel="stylesheet" media="screen">

<!-- calendar css -->
<link href="/hairShopProject/hairShop/css/vanillaCalendar.css"
	rel="stylesheet" media="screen">

<!-- banner style start-->
<link rel="stylesheet"
	href="/hairShopProject/main/assets/css/banner.css">

<!-- banner start -->
<div id="jssor_1"
	style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 1300px; height: 400px; overflow: hidden; visibility: hidden;">
	<!-- Loading Screen -->
	<div data-u="loading" class="jssorl-009-spin"
		style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; text-align: center; background-color: rgba(0, 0, 0, 0.7);">
		<img
			style="margin-top: -19px; position: relative; top: 50%; width: 38px; height: 38px;"
			src="/hairShopProject/main/assets/img/spin.svg" />
	</div>
	<div data-u="slides"
		style="cursor: default; position: relative; top: 0px; left: 0px; width: 1300px; height: 400px; overflow: hidden;">
		<!-- 슬라이드 추가시 img 만 추가하면 됩니다.-->
		<div id="index_img1"></div>
		<div id="index_img2"></div>
		<div id="index_img3"></div>
		<button type="button" id="heartBtn" class="btn_like">
		  <span class="img_emoti">좋아요</span>
		  <span class="ani_heart_m"></span>
		</button>
	</div>
	<!-- Bullet Navigator -->
	<div data-u="navigator" class="jssorb032"
		style="position: absolute; bottom: 12px; right: 12px;"
		data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
		<div data-u="prototype" class="i" style="width: 16px; height: 16px;">
			<svg viewbox="0 0 16000 16000"
				style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
					<circle class="b" cx="8000" cy="8000" r="5800"></circle>
				</svg>
		</div>
	</div>
	<!-- Arrow Navigator -->
	<div data-u="arrowleft" class="jssora051"
		style="width: 65px; height: 65px; top: 0px; left: 25px;"
		data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
		<svg viewbox="0 0 16000 16000"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
				<polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
			</svg>
	</div>
	<div data-u="arrowright" class="jssora051"
		style="width: 65px; height: 65px; top: 0px; right: 25px;"
		data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
		<svg viewbox="0 0 16000 16000"
			style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
				<polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
			</svg>
	</div>
</div>
<div class="container tab-div">
	<section id="fancyTabWidget" class="tabs t-tabs">
		<ul class="nav nav-tabs fancyTabs" role="tablist">
			<li class="tab fancyTab active" id="li-tab0">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>Home</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
			<li class="tab fancyTab" id="li-tab1">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>Designers</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
			<li class="tab fancyTab" id="li-tab2">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab2" href="#tabBody2" role="tab" aria-controls="tabBody2"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>Reservation</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
			<li class="tab fancyTab" id="li-tab3">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab3" href="#tabBody3" role="tab" aria-controls="tabBody3"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>Review</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
			<li class="tab fancyTab" id="li-tab4">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab4" href="#tabBody4" role="tab" aria-controls="tabBody3"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>Q&A</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content fancyTabContent"
			aria-live="polite">
			<div class="tab-pane fade active in" id="tabBody0" role="tabpanel"
				aria-labelledby="tab0" aria-hidden="false" tabindex="0">
				<section id="spacer1" class="home-section spacer">
					<!-- 소개글 내 이미지 -->
					<div class="container" id="homeBackgroundImg">
						<div class="row">
							<div class="col-md-12">
								<div class="color-light">
									<h1 class="wow bounceInDown">
										<span id="hairshopName_span"></span>
									</h1>
									<!-- 헤어샵 이름 -->
									<p class="wow bounceInDown">
										<span id="hairshopAddr"></span>
									</p>
									<!-- 헤어샵 주소 -->
									<h2 class="wow bounceInDown">
										<span id="hairshopTel"></span>
									</h2>
									<!-- 헤어샵 전화번호 -->
									<br>
									<br>
									<h2 class="lead wow bounceInUp">
										<span id="hairshopContent"></span>
									</h2>
									<!-- 헤어샵 소개글 -->
									<br>
									<br>
									<p class="lead wow bounceInUp">영업시간</p>
									<div class="lead wow bounceInUp">
										<span style="color: white;" id="hairShopOpTime"></span>
										<!-- 오픈시간 -->
										<span style="color: white;"> - </span> <span
											style="color: white;" id="hairShopClTime"></span>
										<!-- 클로즈시간 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</section>
				<div id="map" style="width: 100%; height: 50vh; z-index: 7;"></div>
				<div id="hairShopAddress"></div>
			</div>
			<div class="tab-pane  fade" id="tabBody1" role="tabpanel"
				aria-labelledby="tab1" aria-hidden="true" tabindex="0">
				<div class="row">
					<div class="col-md-offset-2 col-md-8">
						<div class="section-heading">
							<h2>디자이너</h2>
							<span id="hairshopName_span2"></span>
							<!-- db에서 content 받아서 뿌리기 -->
							<span>'s 헤어 스타일러들 입니다.</span>
						</div>
					</div>
					<div class="row designer"></div>
				</div>
			</div>
			<div class="tab-pane  fade" id="tabBody2" role="tabpanel"
				aria-labelledby="tab2" aria-hidden="true" tabindex="0">
				<div class="row">
					<div class="col-md-12">
						<h2>Reservation</h2>
						<p>받으실 서비스와 예약 시간을 선택해 주세요</p>
					</div>
				</div>
				<div class="row">
					<div class="calendarContainer">
						<g fill="none"> <path
							d="M77.877 47.673a6.515 6.515 0 0 1-1.912 4.619 6.515 6.515 0 0 1-4.618 1.912H8.653a6.53 6.53 0 0 1-4.618-11.149 6.515 6.515 0 0 1 4.618-1.912h3.918a6.53 6.53 0 0 1-4.618-11.149 6.515 6.515 0 0 1 4.619-1.912h3.918a6.53 6.53 0 0 1-4.618-11.15 6.515 6.515 0 0 1 4.618-1.911h2.613c0-7.213 5.848-13.062 13.06-13.062H60.9a13.02 13.02 0 0 1-3.828 9.234 13.02 13.02 0 0 1-9.234 3.828h15.674a6.53 6.53 0 0 1 4.618 11.148 6.515 6.515 0 0 1-4.619 1.913h3.919a6.53 6.53 0 0 1 4.618 11.149 6.515 6.515 0 0 1-4.618 1.912h3.918a6.53 6.53 0 0 1 6.53 6.53z"
							fill="#FFF" /> <path
							d="M37.388 15.02h10.449a13.02 13.02 0 0 0 9.234-3.826 13.02 13.02 0 0 0 3.827-9.235H50.449a13.02 13.02 0 0 1-3.827 9.234 13.02 13.02 0 0 1-9.234 3.828zm33.959 26.123h-3.918a6.515 6.515 0 0 0 4.618-1.913 6.53 6.53 0 0 0-4.618-11.149h-3.918a6.515 6.515 0 0 0 4.618-1.912 6.53 6.53 0 0 0-4.618-11.149H53.062a6.53 6.53 0 0 1 4.618 11.15 6.515 6.515 0 0 1-4.618 1.911h3.918a6.53 6.53 0 0 1 4.618 11.15 6.515 6.515 0 0 1-4.618 1.912h3.918a6.53 6.53 0 0 1 4.618 11.149 6.515 6.515 0 0 1-4.618 1.912h10.449a6.515 6.515 0 0 0 4.618-1.912 6.53 6.53 0 0 0-4.618-11.149z"
							fill="#EBE5DD" /> <path fill="#FFDA44"
							d="M63.249 77.71425L53.06125 126.04075 26.93875 126.04075 16.751 77.71425" />
						<path
							d="M16.751 77.714l1.101 5.225h31.12c3.319 0 5.796 3.054 5.112 6.302l-7.758 36.8h6.736l10.187-48.327H16.751z"
							fill="#EEBF00" /> <path fill="#FFDA44"
							d="M67.242 77.71425L12.758 77.71425 7.347 54.204 72.653 54.204z" />
						<path
							d="M66.226 54.204L62.95 68.437a5.225 5.225 0 0 1-5.09 4.053H11.555l1.202 5.224h54.484l5.41-23.51h-6.426z"
							fill="#EEBF00" /> <path
							d="M79.837 47.673c0-3.667-2.338-6.799-5.603-7.983a8.427 8.427 0 0 0 1.684-5.078c0-3.668-2.338-6.799-5.602-7.983A8.427 8.427 0 0 0 72 21.55c0-4.681-3.809-8.49-8.49-8.49h-5.56A14.921 14.921 0 0 0 62.857 1.96V0H32.163C24.546 0 18.24 5.702 17.275 13.061h-.785c-2.269 0-4.401.883-6.004 2.486A8.436 8.436 0 0 0 8 21.551c0 1.9.627 3.656 1.686 5.072a8.459 8.459 0 0 0-3.118 1.985 8.434 8.434 0 0 0-2.486 6.004c0 1.9.627 3.656 1.686 5.072A8.456 8.456 0 0 0 2.65 41.67a8.433 8.433 0 0 0-2.486 6.003c0 3.63 2.288 6.732 5.498 7.944l5.535 24.057h3.965L25.349 128h29.302l10.187-48.326h3.965l5.534-24.052a8.461 8.461 0 0 0 3.013-1.945 8.434 8.434 0 0 0 2.487-6.004zm-70.029 8.49h6.742l3.006 19.592h-5.24L9.809 56.163zm41.388 19.592L52.7 56.163h6.787l-3.005 19.592h-5.285zm-3.93 0H41.96V56.163h6.81l-1.503 19.592zm-9.225 0h-5.307L31.23 56.163h6.81v19.592zM27.3 56.163l1.503 19.592h-5.285l-3.005-19.592H27.3zm24.171 67.919H28.528l-9.361-44.408h41.667l-9.362 44.408zm14.211-48.327h-5.238l3.005-19.592h6.742l-4.508 19.592zm8.897-24.848a4.542 4.542 0 0 1-3.233 1.338H8.653a4.577 4.577 0 0 1-4.572-4.572c0-1.221.476-2.37 1.339-3.233a4.542 4.542 0 0 1 3.233-1.338h20.898v-3.918h-16.98A4.577 4.577 0 0 1 8 34.612c0-1.222.475-2.37 1.338-3.233a4.542 4.542 0 0 1 3.234-1.338H40v-3.919H16.49a4.577 4.577 0 0 1-4.572-4.571c0-1.222.476-2.37 1.339-3.233a4.541 4.541 0 0 1 3.233-1.338h7.837V13.06h-3.09c.93-5.19 5.474-9.143 10.926-9.143h26.604a11.025 11.025 0 0 1-3.081 5.89 11.03 11.03 0 0 1-7.85 3.253H37.389v3.919H63.51c2.52 0 4.572 2.05 4.572 4.571 0 1.222-.475 2.37-1.338 3.233a4.542 4.542 0 0 1-3.234 1.338H53.061v3.919h14.367c2.521 0 4.572 2.05 4.572 4.571 0 1.222-.475 2.37-1.338 3.233a4.542 4.542 0 0 1-3.234 1.339H42.612v3.918h28.735c2.52 0 4.572 2.05 4.572 4.572 0 1.221-.476 2.37-1.339 3.233z"
							fill="#000" /> </g>
						<div id="v-cal">
							<div class="vcal-header">
								<button class="vcal-btn" data-calendar-toggle="previous">
									<svg height="24" version="1.1" viewbox="0 0 24 24" width="24"
										xmlns="http://www.w3.org/2000/svg">
											<path
											d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
										</svg>
								</button>
								<div class="vcal-header__label" data-calendar-label="month">
									2018 November</div>
								<button class="vcal-btn" data-calendar-toggle="next">
									<svg height="24" version="1.1" viewbox="0 0 24 24" width="24"
										xmlns="http://www.w3.org/2000/svg">
											<path
											d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
										</svg>
								</button>
							</div>
							<div class="vcal-week">
								<span>월</span> <span>화</span> <span>수</span> <span>목</span> <span>금</span>
								<span>토</span> <span>일</span>
							</div>
							<div class="vcal-body" data-calendar-area="month"></div>
						</div>
						<p class="demo-picked">
							<span data-calendar-label="picked"></span> 
							<input type="hidden" name="selectedDay" id="selectedDay" />
							<input type="hidden" name="whichDay" id="whichDay" />
						</p>
					</div>
					<div class="section-content">
						<br />
						<table class="reserve-hair"
							style="width: 100%; text-align: center;">
							<tr>
								<td class="serviceCheck"><img
									class="fa fa-code fa-4x reserve-haircut" alt="haircut"
									src="/hairShopProject/hairShop/serviceCategoryImage/haircut.png">
									<br />
								<h5 class="reserve-haircut">커트</h5></td>
								<td class="serviceCheck"><img
									class="fa fa-cog fa-4x reserve-hairperm" alt="hairperm"
									src="/hairShopProject/hairShop/serviceCategoryImage/perm.png"
									style="width: 142px; height: 142px"> <br />
								<h5 class="reserve-hairperm">펌</h5></td>
								<td class="serviceCheck"><img
									class="fa fa-cog fa-4x reserve-hairdye" alt="hairdye"
									src="/hairShopProject/hairShop/serviceCategoryImage/dye.png"
									style="width: 142px; height: 142px">
									<h5 class="reserve-hairdye">염색</h5></td>
								<td class="serviceCheck"><img
									class="fa fa-cog fa-4x reserve-hairstyling" alt="hairstyling"
									src="/hairShopProject/hairShop/serviceCategoryImage/styling.png">
									<h5 class="reserve-hairstyling">스타일링</h5></td>
								<td class="serviceCheck"><img
									class="fa fa-cog fa-4x reserve-hairclinic" alt="hairclinic"
									src="/hairShopProject/hairShop/serviceCategoryImage/clinic.png">
									<h5 class="reserve-hairclinic">클리닉</h5></td>
							</tr>
						</table>
						<div class="row">
							<ul class="serviceChoice">
							</ul>
						</div>
						<div class="row" style="margin: 10px; width: 100%;">
							<table class="reserveTable">
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane  fade" id="tabBody3" role="tabpanel"
				aria-labelledby="tab3" aria-hidden="true" tabindex="0">
				<div class="row">
					<div class="col-md-12">
						<h2>Review</h2>
						<p>미용실 별점 및 리뷰</p>
					</div>
					 <div id="review_area" align="center">
					 	<ul id="reviewList"></ul>
					 </div>
					 <input type="button" value="리뷰쓰기" id="reviewWriteBtn">
				</div>
			</div>
			<div class="tab-pane  fade" id="tabBody4" role="tabpanel"
				aria-labelledby="tab1" aria-hidden="true" tabindex="0">
				<div class="row">
					<div class="col-md-12">
						<h2>Q & A</h2>
						<p>질문 답변 게시판</p>
						<!-- db에서 content 받아서 뿌리기 -->
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-2 col-md-8">
						<div class="section-heading">
							<div class="tab-pane z-tab3" id="tab3">
								<input type="hidden" id="pg" value="${pg}" />
								<table id="boardListTable" cellpadding="5" frame="hsides"
									rules="rows">
									<tr>
										<th width="100">글번호</th>
										<th width="250">제목</th>
										<th width="100">작성자</th>
										<th width="150">작성일</th>
										<th width="100">조회수</th>
									</tr>
								</table>
								<div id="boardPagingDiv"
									style="float: left; width: 700px; text-align: center;"></div>

								<br>
								<br>
								<br>
								<div style="width: 750px; text-align: center;">
									<select id="searchOption">
										<option value="subject">제목</option>
										<option value="id">아이디</option>
									</select> <input type="text" id="keyword" width="30px"> <input
										type="button" value="검색" id="searchBtn">
									<!-- 글쓰기 버튼 -->
									<div style="float: right; text-align: center;">
										<c:if test="${memId!=null}">
											<a href="/hairShopProject/hairShop/board/boardWriteForm.do"
												style="color: black; font-family: 한컴 윤체 L; text-decoration: none">글쓰기</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- js -->
<script src="/hairShopProject/hairShop/js/modernizr.custom.js"></script>
<script src="/hairShopProject/hairShop/js/jquery.js"></script>
<script src="/hairShopProject/hairShop/js/bootstrap.min.js"></script>
<script src="/hairShopProject/hairShop/js/jquery.smooth-scroll.min.js"></script>
<script src="/hairShopProject/hairShop/js/jquery.dlmenu.js"></script>
<script src="/hairShopProject/hairShop/js/wow.min.js"></script>
<script src="/hairShopProject/hairShop/js/custom.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bdcc4d7ca1e01a2e5d822a148f1f8aa&libraries=services"></script>

<!-- main banner slider -->
<script src="/hairShopProject/main/assets/js/slider.js"></script>
<!-- calendar js -->
<script src="/hairShopProject/hairShop/js/vanillaCalendar.js"></script>
<!-- 달력 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="js/jquery-ui-datepicker.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 좋아요 js */
		$('button#heartBtn').click(function(){
		  if($(this).hasClass('btn_unlike')){
		    $(this).removeClass('btn_unlike');
		    $('.ani_heart_m').removeClass('hi');
		    $('.ani_heart_m').addClass('bye');
		  }
		  else{
		    $(this).addClass('btn_unlike');
		    $('.ani_heart_m').addClass('hi');
		    $('.ani_heart_m').removeClass('bye');
		  }
		});
		
		var para = document.location.href.split("#tab");
	      if(para.length>1) {
	         $('#li-tab0').removeClass('active');
	         $('#li-tab'+para[1]).addClass('active');
	         $('#tabBody0').removeClass('active in');
	         $('#tabBody'+para[1]).addClass('active in');
	      }
		vanillaCalendar.init({
			disablePastDays: true
		});
		//.ajax onload
		
		var chosenHairShopName = "";
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/hairShop/getHairShopInfo.do',
			data : {'hairShopId' : '${hairShopId }'},
			dataType: 'json',
			success : function(data){
				$('#hairshopAddr').text(data.map.HAIRSHOPADDR);
				$('#hairshopTel').text(data.map.HAIRSHOPTEL);
				$('#hairshopName_span').text(data.map.NAME);
				$('#hairshopName_span2').text(data.map.NAME);
				chosenHairShopName = data.map.NAME;
				$('#hairshopContent').text(data.map.HAIRSHOPCONTENT);
				$('#hairShopOpTime').text(data.map.OPENTIME);
				$('#hairShopClTime').text(data.map.CLOSETIME);
				$('div#index_img1').html("<img data-u='image' src='/hairShopProject/hairShop/img/banner/"+data.map.HAIRSHOPIMAGE1+"' style='top: 0px; left: 0px; width: 1300px; height: 400px; position: absolute; display: block; max-width: 10000px; z-index: 1;' border='0' data-events='auto' data-display='block' />");
	            $('div#index_img2').html("<img data-u='image' src='/hairShopProject/hairShop/img/banner/"+data.map.HAIRSHOPIMAGE2+"' style='top: 0px; left: 0px; width: 1300px; height: 400px; position: absolute; display: block; max-width: 10000px; z-index: 1;' border='0' data-events='auto' data-display='block' />");
	            $('div#index_img3').html("<img data-u='image' src='/hairShopProject/hairShop/img/banner/"+data.map.HAIRSHOPIMAGE3+"' style='top: 0px; left: 0px; width: 1300px; height: 400px; position: absolute; display: block; max-width: 10000px; z-index: 1;' border='0' data-events='auto' data-display='block' />");
				
	            
	        	/* 미용실 위치 띄우기 */
	        	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	        	    mapOption = { 
	        	        center: new daum.maps.LatLng(data.map.LATITUD , data.map.LONGITUDE), // 지도의 중심좌표
	        	        level: 1 // 지도의 확대 레벨
	        	    };

	        	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	        	var imageSrc = '/hairShopProject/hairShop/img/미용실아이콘.png', // 마커이미지의 주소입니다    
	        	imageSize = new daum.maps.Size(32, 45), // 마커이미지의 크기입니다
	        	imageOption = {offset: new daum.maps.Point(20, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	        	  
	        	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	        	var hairShopMarkerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption), 
	        	hairShopMarkerPosition = new daum.maps.LatLng(data.map.LATITUD, data.map.LONGITUDE ); // 마커가 표시될 위치입니다

	        	// 지도에 마커를 표시합니다 
	        	var hairShopMarker = new daum.maps.Marker({
	        		position: hairShopMarkerPosition, 
	        	    image: hairShopMarkerImage
	        	});

	        	hairShopMarker.setMap(map);
	        	
	        	$('#hairShopAddress').text(data.map.ADDR1 + " " + data.map.ADDR2);
	        	
	            
	            
	            
	            $.each(data.list, function(index, items){
					$('<div/>',{
						class:'col-xs-12 col-sm-3 col-md-3 col-lg-3',
						html : '<div class="box-team wow bounceInDown" data-wow-delay="0.1s">'+
								'<div id="designer_img"><img data-u="image" src="/hairShopProject/hairShop/img/team/'+items.DESIGNERIMAGE+'"></div>'+  
			                    '<h2><span id="designerName'+index+'"></span></h2>'+
			                    '<p id="designerPosition'+index+'"></p>'+  
			                    '<span >쉬는요일 : </span>'+
			                    '<span id="dayoff'+index+'"></span>'+
								'</div>'
					}).appendTo($('div.designer'));
					
					$('span#designerName'+index).text(items.NAME);
					$('p#designerPosition'+index).text(items.POSITION);
					$('span#dayoff'+index).text(items.DAYOFF);
					
				});

			},
			error : function(){alert("정보 에러");}
		});
		// banner slide start!!
		jssor_1_slider_init();
		
		
		var pickedService = "";
		
		$('table.reserve-hair').on('click','td.serviceCheck',function(){
			$('td.serviceCheck').removeClass('check');
			$(this).addClass('check');
			pickedService = $(this).children(":last").text();
			alert(pickedService);
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/getServiceList.do',
				data : {'pickedService' : pickedService, 'hairShopId' : '${hairShopId }'},
				dataType : 'json',
				success : function(data){
					$('ul.serviceChoice').empty();
					$.each(data.list, function(index, item){
						$('<li/>', {
							class : 'tl_default'
						}).append($('<span/>',{
							class : 'td_tw'
						})).append($('<span/>',{
							class : 'td_t',
							text : item.DESCRIPTION
						})).append($('<span/>',{
							class : 'td_ow',
							text : (item.PRICE).toLocaleString() + '원'
						})).append($('<span/>',{
							class : 'td_o',
							text : item.TIMEREQUIRED + '분 소요'
						})).appendTo($('.serviceChoice'));
					});	
				},
				error: function(){alert("서비스 리스트 못받아옴");}
			});
			
		});
		var chosenService = "";
		var chosenServicePrice = "";
		var chosenServiceRequiredTime = "";
		var theday = "";
		
		$('ul.serviceChoice').on('click','li.tl_default',function(){
			$('li.tl_default').removeClass('chosen');
			$(this).addClass('chosen');
			chosenService = $(this).children(":eq(1)").text();
			chosenServicePrice = $(this).children(":eq(2)").text().replace(",000원", "000");
			chosenServiceRequiredTime = $(this).children(":last").text().replace("분 소요", "");
 			alert(chosenService +  " " + chosenServicePrice + " " + chosenServiceRequiredTime);
			$('.btn-primary').remove();			
			getDesignerSchedule();

		});
		
		function getDesignerSchedule(){
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/getDesignerSchedule.do',
				data : {'selectedDay' : $('input[name=selectedDay]').val(), 'hairShopId': '${hairShopId }'},
				dataType : 'json',
				success : function(data){
					$('table.reserveTable').empty();
					$('#reserveBtn').remove();
					
					var jData;
					var cData = "";
					$.each(data.reservationList, function(index2, item2){
// 						alert(JSON.stringify(item2));
						if(JSON.stringify(item2) != '[]') {
							if(cData === "") 
								cData = cData + (JSON.stringify(item2)).replace('[','').replace(']','');
							else 
								cData = cData +','+(JSON.stringify(item2)).replace('[','').replace(']','');
						}
					});
					cData = '['+cData+']';
					cData.replace('},]', '}]');
					jData = JSON.parse(cData);
					
					var btnLength;
					$.each(data.list, function(index, item){
						theday = item.THEDAY;
						$('<tr/>'
						).append($('<td/>',{
						    class: 'designerName',
						    style : 'width: 3%; padding: 10px;'
						}).append($('<div/>',{
						}).append($('<img/>',{
							class : 'designerImages',
							src :'/hairShopProject/hairShop/img/team/1.jpg'
						})).append($('<span/>',{
							html : '<br/>' + item.POSITION + " " + item.DESIGNERNAME
						})))).append($('<td/>',{
							id : item.DESIGNERID,
							align : 'left',
							style : 'vertical-align: top; width: 50%; padding-top: 10px; padding-bottom: 10px;'
						})).appendTo($('table.reserveTable'));

						btnLength = (item.ENDTIME - item.STARTTIME)/1800000;
						
						for(var i=0; i<btnLength; i++){
							var dateTime = new Date(item.STARTTIME + 30*60000*i);
							var time = dateTime.getHours()+":"+(dateTime.getMinutes()===30?dateTime.getMinutes():(dateTime.getMinutes()+'0'));
							$('<button/>', {
								text : time,
								class : 'btn btn-warning timeOptionBtn able',
								id : item.DESIGNERID+i,
								type : 'button',
							}).appendTo('#'+item.DESIGNERID);
						}
						
						var calT = new Array;
						var endT = new Array;
						
						for(var j=0; j<jData.length; j++) {
// 							alert(jData[j].DESIGNERID);
							if(jData[j].DESIGNERID===item.DESIGNERID) {
								calT[j] = (jData[j].STARTTIME-item.STARTTIME)/1800000;
								endT[j] = (jData[j].TIMEREQUIRED/30)+calT[j];
								for(var i = calT[j]; i<endT[j]; i++) {
									$('#'+item.DESIGNERID+i).css('cursor','not-allowed').css('background-color','gray');
									$('#'+item.DESIGNERID+i).removeClass('btn-warning able');
									$('#'+item.DESIGNERID+i).addClass('disable');
								}
							}
						}
						// --------- 예약 잡힌거 막기;
						var timeChecker = chosenServiceRequiredTime/30;
// 						alert("버튼개수 선택해줘"+timeChecker);
						var qwer = [];
						for(var k=0; k< $('#'+item.DESIGNERID).children().size()-timeChecker+1; k++) {
// 							alert("포문 k="+k);
							var j=0;
							for(var i=0; i<timeChecker; i++) {
								if($('#'+item.DESIGNERID+' button.timeOptionBtn').eq(k+i).hasClass('able')) j++
							}
							if(j===timeChecker) {
								qwer.push(k);
							}
						}
// 						alert(JSON.stringify(qwer));
						for(var k=0; k< $('#'+item.DESIGNERID).children().size(); k++) {
							$('#'+item.DESIGNERID+' button.timeOptionBtn').eq(k).removeClass('btn-warning able');
							$('#'+item.DESIGNERID+' button.timeOptionBtn').eq(k).addClass('disable');
						} 
						for(var i=0; i< qwer.length; i++){
							for(var a=0; a<timeChecker; a++){
								$('#'+item.DESIGNERID+' button.timeOptionBtn').eq(qwer[i]+a).removeClass('disable');							
								$('#'+item.DESIGNERID+' button.timeOptionBtn').eq(qwer[i]+a).addClass('btn-warning able');							
							}
						}
					});	// ------- each 끝
					$('.btn-primary').remove();
					$('<button/>',{
						align: 'center',
						text : '예약하기',
						class : 'btn-primary',
						id : 'reserveBtn'
					}).appendTo($('table.reserveTable'));
				},
				error : function(){
					alert("못가져온대요~");
				}
			});
			
		}
		var chosenDesignerId = "";
		var chosenDesigner = "";
		var chosenTime = "";
		$('table').on('click', '.able', function(){
			var index = $($(this).parent().children()).index(this);
			chosenDesignerId = $(this).parent().attr('id');
			$('.able').removeClass('btn-success').addClass('btn-warning');
			var count = 0;
			for(i=index; i < index + chosenServiceRequiredTime/30; i++){
				if($(this).parent().children(':eq('+ i +')').hasClass('able')){
					count++;
				}
			}
			if(count == chosenServiceRequiredTime/30){
				for(i=index; i < index + chosenServiceRequiredTime/30; i++){
					$(this).parent().children(':eq('+ i +')').removeClass('btn-warning').addClass('btn-success');					
				}
				chosenTime = $(this).text();
				chosenDesigner = $(this).parent().parent().children(':first').children(':first').children('span').text();
			}else{
				alert("예약 시간을 확인해주세요.");
			}
		});
		
		
		$('body').on('click', '#reserveBtn', function(){
			alert(chosenDesignerId);
/* 			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/reserve.do',
				data : JSON.stringify()
			});
			 */
			var params = {'chosenHairShopName' : chosenHairShopName, 'pickedService' : pickedService, 'chosenService' : chosenService, 'chosenServicePrice': chosenServicePrice, 'chosenServiceRequiredTime': chosenServiceRequiredTime, 'chosenTime' : chosenTime, 'theday': theday, 'whichDay' : $('#whichDay').val(), 'hairShopId' : '${hairShopId }', 'chosenDesignerId' : chosenDesignerId, 'chosenDesigner' : chosenDesigner };
			var path = "/hairShopProject/hairShop/reserve.do";
			var method = 'post';
			post_to_url(path, params, method);
			
		});
		
		var numItems = $('li.fancyTab').length;
		if (numItems == 12){
			$("li.fancyTab").width('8.3%');
		}
	  	if (numItems == 11){
			$("li.fancyTab").width('9%');
		}
	 	if (numItems == 10){
			$("li.fancyTab").width('10%');
		}
	  	if (numItems == 9){
			$("li.fancyTab").width('11.1%');
		}
	  	if (numItems == 8){
			$("li.fancyTab").width('12.5%');
		}
	  	if (numItems == 7){
			$("li.fancyTab").width('14.2%');
		}
	  	if (numItems == 6){
			$("li.fancyTab").width('16.666666666666667%');
		}
	 	if (numItems == 5){
			$("li.fancyTab").width('20%');
		}
	 	if (numItems == 4){
			$("li.fancyTab").width('25%');
		}
		if (numItems == 3){
			$("li.fancyTab").width('33.3%');
		}
		if (numItems == 2){
			$("li.fancyTab").width('50%');
		}
		$('.fancyTabs').each(function() {
	    	var highestBox = 0;
			$('.fancyTab a', this).each(function() {
				if ($(this).height() > highestBox) highestBox = $(this).height();
			});
			$('.fancyTab a', this).height(highestBox);
		});
		  
		
		dateChecker('input[name=selectedDay]', function(){ 
// 			alert("선택한 날짜가 바뀌었음!");
			if(chosenService!="") {
				getDesignerSchedule();
			}
			document.getElementById('reserveBtn').remove();
		}); 
	});
	
	
	function post_to_url(path, params, method) {
	    method = method || "post";
	    var reserveForm = document.createElement("form");
	    reserveForm.setAttribute("method", method);
	    reserveForm.setAttribute("action", path);
	    for (var key in params) {
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", key);
	        hiddenField.setAttribute("value", params[key]);
	        reserveForm.appendChild(hiddenField);
	    }
	    document.body.appendChild(reserveForm);
	    reserveForm.submit();
	    return false;
	}
	
	
	// selectedDay의 값이 변경될 때마다 수행되는 콜백 메소드
    function dateChecker(selector, callback) {
        var input = $(selector);
        var oldvalue = input.val();
        setInterval(function(){
           if (input.val()!=oldvalue){
               oldvalue = input.val();
               callback();
           }
        }, 100);
     }
	</script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		//리뷰
		$('#review').on('click',function(){
			var dataList;
			var listIndex;
			var i = 0;
			var j;
			var dataListSize;
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/reviewList.do',
				dataType : 'json',
				success : function(data){
					//alert(JSON.stringify(data));
					dataList = data.list;
					dataListSize = dataList.length;
					$('#reviewListTable tr:eq(0)').remove();
					$.each(data.list,function(index,items){
						var email = items.email.split("@");
						var name = email[0];
						$('<li/>').append($('<div/>',{
							class : 'info_area',
							align : 'left',
							html : "["+items.service+"]"+items.reviewsubject+"&emsp;"+items.position+"&nbsp;"+items.designername//[서비스] + 리뷰제목 + 디자이너직책 + 디자이너이름 
						})).append($('<div/>',{
							colspan : 3,
							align : 'left',
							class : 'reviewcontent_area',
							text : items.reviewcontent//리뷰내용
						})).append($('<div/>',{
							class : 'star_name_logtime_area',
							align : 'left', 
							html : '<img style = "width : 13px; height : 13px; margin-top : -3px;" src = "/hairShopProject/hairShop/img/review/img_star.png" />' +
									'x'+items.designerstar+"&emsp;"+ name+"&emsp;"+ items.logtime
						})).append($('<hr>')).appendTo($('#reviewList'));
						
						if((index%10) == 9){
							$('<input/>',{
								type : 'button',
								id : 'nextView',
								value : '더보기'
							}).appendTo($('#reviewList'));
							listIndex = index;
							return false;
						}
						
						
					});//$.each
					i = i+10;
					//alert(i);
					//alert(listIndex);
					$('#nextView').on('click',function(){
						//alert(i);
						$('#nextView').hide();
						for(j = i; j<i+10; j++){
							//alert(dataListSize)//전체사이즈
							if(j >= dataListSize) return false;
							var email = dataList[j].email.split("@");
							var name = email[0];
							$('<li/>').append($('<div/>',{
								class : 'info_area',
								align : 'left',
								html : "["+dataList[j].service+"]"+dataList[j].reviewsubject+"&emsp;"+dataList[j].position+"&nbsp;"+dataList[j].designername//[서비스] + 리뷰제목 + 디자이너직책 + 디자이너이름 
							})).append($('<div/>',{
								colspan : 3,
								align : 'left',
								class : 'reviewcontent_area',
								text : dataList[j].reviewcontent//리뷰내용
							})).append($('<div/>',{
								class : 'star_name_logtime_area',
								align : 'left', 
								html : '<img style = "width : 13px; height : 13px; margin-top : -3px;" src = "/hairShopProject/hairShop/img/review/img_star.png" />' +
										'x'+dataList[j].designerstar+"&emsp;"+ name+"&emsp;"+ dataList[j].logtime
							})).append($('<hr>')).appendTo($('#reviewList'));
						}
						$('#nextView').show();
					});
					
					//alert(listIndex + 1);
					//alert(dataList.length);//리뷰리스트 개수
					
				},
				error : function(data){
					alert("error");
				}
			});
		});
	});
	
	</script>
