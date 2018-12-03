<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<!-- meta data -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- title of site -->
<title>hairShop</title>


<!-- 스와이퍼 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!--  date picker css-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--font-family-->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- For favicon png -->
<link rel="shortcut icon" type="image/icon"	href="/hairShopProject/main/assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/font-awesome.min.css">

<!--linear icon css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/linearicons.css">

<!--animate.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/animate.css">

<!--flaticon.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/flaticon.css">

<!--bootstrap.min.css-->
<link rel="stylesheet"
	href="/hairShopProject/main/assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet"
	href="/hairShopProject/main/assets/css/bootsnav.css">

<!--style.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/style.css">

<!--responsive.css-->
<link rel="stylesheet"
	href="/hairShopProject/main/assets/css/responsive.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300italic,regular,italic,700,700italic&subset=latin-ext,greek-ext,cyrillic-ext,greek,vietnamese,latin,cyrillic"
	rel="stylesheet" type="text/css" />

<!-- banner style start-->
<link rel="stylesheet"
	href="/hairShopProject/main/assets/css/banner.css">

<!-- 우리가 준 스타일 css -->
<style type="text/css">
.photo{
	width: 120px; 
	height: 120px;
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
}
.single-testimonial-box {
	cursor : pointer;
}
</style>
</head>
<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!--header-top start -->
	<!-- top-area Start -->
	<header class="top-area">
		<jsp:include page="../member/loginModal.jsp" />
		
		<div class="header-area">
			<!-- Start Navigation -->
			<nav
				class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"
				data-minus-value-desktop="70" data-minus-value-mobile="55"
				data-speed="1000">
				<div class="container">
					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-menu">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="/hairShopProject/main/index.do">Hair<span>Shop</span></a>
					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=" scroll" style="padding-left: 35px;"><a href="javascript:void(0)" class="searchHairShopByName">미용실찾기</a></li>
							<li class="scroll"style="padding-left: 165px;"><a href="javascript:void(0)">스타일찾기</a></li>
							<li class="scroll" style="padding-left: 165px;"><a href="javascript:void(0)">이벤트</a></li>
							<li class="scroll" style="padding-left: 165px;">
								<input type="hidden" id="loginVal" value="${login }" />
								<c:if test="${memEmail==null }">
									<a id="loginA" href="javascript:void(0)">sign in / register</a>
								</c:if>
								<c:if test="${memEmail!=null }">
									<a id="loggedinA" href="javascript:void(0)">${memName } 님</a>
									<input type="hidden" id="memEmail" value="${memEmail }" />
									<button type="button" class="logoutBtn">
										로그아웃
									</button>
								</c:if>
							</li>
						</ul>
						<!--/.nav -->
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!--/.container-->
			</nav>
			<!--/nav-->
			<!-- End Navigation -->
		</div>
		<!--/.header-area-->
		<div class="clearfix"></div>
	</header>
	<!-- /.top-area-->
	<!-- top-area End -->
	
	<!--/.header-top-->
	<!--header-top end -->
	
	<!-- Display Section Start!!! -->
	<section>
		<jsp:include page="${display }" />
	</section>
	<!-- Display Section end!!! -->
	<!-- TOP Section end!!!!!! -->

	<!--footer start-->
	<footer id="footer" class="footer" style="clear: both; position:relative;">
		<div class="container">
			<div class="footer-menu">
				<div class="row">
					<div class="col-sm-3">
						<div class="navbar-header">
							<a class="navbar-brand" href="index.do">Hair<span>Shop</span></a>
						</div>
						<!--/.navbar-header-->
					</div>
				</div>
			</div>
			<div class="hm-footer-copyright">
				<div class="row">
					<div class="col-sm-5">
						<p>
							&copy;copyright. designed and developed by <a
								href="index.do">우리동네 HairShop</a>
						</p>
						<!--/p-->
					</div>
					<div class="col-sm-7">
						<div class="footer-social">
							<span><i class="fa fa-phone"> +82 (10) 8564 1358</i></span> <a
								href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-linkedin"></i></a> <a href="#"><i
								class="fa fa-google-plus"></i></a>
						</div>
					</div>
				</div>

			</div>
			<!--/.hm-footer-copyright-->
		</div>
		<!--/.container-->

		<div id="scroll-Top">
			<div class="return-to-top">
				<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip"
					data-placement="top" title="" data-original-title="Back to Top"
					aria-hidden="true"></i>
			</div>

		</div>
		<!--/.scroll-Top-->

	</footer>
	<!--/.footer-->
	<!--footer end-->

	<!-- Include all js compiled plugins (below), or include individual files as needed -->

	<script src="/hairShopProject/main/assets/js/jquery.js"></script>

	<!--modernizr.min.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

	<!--bootstrap.min.js-->
	<script src="/hairShopProject/main/assets/js/bootstrap.min.js"></script>

	<!-- bootsnav js -->
	<script src="/hairShopProject/main/assets/js/bootsnav.js"></script>

	<!--feather.min.js-->
	<script src="/hairShopProject/main/assets/js/feather.min.js"></script>

	<!-- counter js -->
	<script src="/hairShopProject/main/assets/js/jquery.counterup.min.js"></script>
	<script src="/hairShopProject/main/assets/js/waypoints.min.js"></script>

	<!--`.min.js-->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<!-- main banner slider -->
	<script src="/hairShopProject/main/assets/js/slider.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	
	<!-- swiper js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
	
	<!-- 로그인 -->
   <script src="/hairShopProject/main/assets/js/login.js"></script>
    
	<!--Custom JS-->
	<script src="/hairShopProject/main/assets/js/custom.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bdcc4d7ca1e01a2e5d822a148f1f8aa&libraries=services"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// banner slide start!!
			jssor_1_slider_init();
			//.flaticon-gps-fixed-indicator start!
			$('.flaticon-gps-fixed-indicator').on('click', function() {
				//getLocation start
				function getLocation(position) {
					var latitud = position.coords.latitude;
					var longitude = position.coords.longitude;
	
					var geocoder = new daum.maps.services.Geocoder();
					var callback = function(result, status) {
						if (status === daum.maps.services.Status.OK) {
							$('#location').val(result[0].address_name);
						}
					};
					geocoder.coord2RegionCode(longitude, latitud,callback);
				} //getLocation end
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(getLocation,function(error) {
						consol.log(error.message);
					});
				} else {
					consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
				}
			});//.flaticon-gps-fixed-indicator end!
			
		});//document.ready end!
	</script>
	<!-- 모달모달모달  -->
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	
	<!-- date picker -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	
	<script type="text/javascript">
		jQuery(document).ready(function() {
			$(".searchHairShopByName").on('click',function(){
				location.href="searchHairShop.do";
			});
			
			$(".z-tabs").on('click','li',function(){
				var classztab ="";
				$('li.active').removeClass('active');
				$('div.active').removeClass('active');
				classztab = $(this).attr('class');
				var x = document.getElementsByClassName(classztab);
				var i;
				for (i = 0; i < x.length; i++) {
				    x[i].classList.add('active');
				}
			});
			
			$("#date").datepicker({
				todayHighlight: true,
				minDate: "0", 
				maxDate: "+14D", 
				changeMonth: true, 
		        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        onSelect: function(value){
		        	var date = new Date(value);
		        	var day = date.getDay();
		        	$('#day').val(day); //0일요일, 6 토요일
		        },
		        onClose: function(value){
		        	var date = new Date(value);
		        	var day = date.getDay();
		        	$('#day').val(day);
		        }
		  });
			
			$('#loginA').on('click', function() {
				//화면의 높이와 너비를 구한다.
				var maskHeight = $(document).height();
				var maskWidth = $(window).width();

				//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
				$('#myModal').css({
					'width' : maskWidth,
					'height' : maskHeight
				});

				//애니메이션 효과
				$('#myModal').fadeIn(500);

				/* $('#myModal').show(); */
			});
		});	
		//팝업 Close 기능
		function close_pop(flag) {
			$('#myModal').hide();
		};
	</script>
</body>
</html>