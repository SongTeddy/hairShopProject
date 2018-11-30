<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<form id="hairShopPost">
    <head>
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        
        <!-- title of site -->
        <title>Directory Landing Page</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="/hairShopProject/main/assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/font-awesome.min.css">

        <!--linear icon css-->
		<link rel="stylesheet" href="/hairShopProject/main/assets/css/linearicons.css">

		<!--animate.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/animate.css">

		<!--flaticon.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/flaticon.css">

		<!--slick.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/slick.css">
		<link rel="stylesheet" href="/hairShopProject/main/assets/css/slick-theme.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="/hairShopProject/main/assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="/hairShopProject/main/assets/css/responsive.css">
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
	
	<body>
      
      
	<input type="hidden" id="pg" value="${pg}" />
	<
	<!--header-top start -->
		<header id="header-top" class="header-top">
		<jsp:include page="../../../member/loginModal.jsp"/>
		</header><!--/.header-top-->
		<!--header-top end -->

		<!-- top-area Start -->
		<section class="top-area">
			<div class="header-area">
				<!-- Start Navigation -->
			    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

			        <div class="container">

			            <!-- Start Header Navigation -->
			            <div class="navbar-header">
			                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
			                    <i class="fa fa-bars"></i>
			                </button>
			                <a class="navbar-brand" href="index.html">메인<span>화면으로</span></a>

			            </div><!--/.navbar-header-->
			            <!-- End Header Navigation -->

			            <!-- Collect the nav links, forms, and other content for toggling -->
			            <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
			                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
			                    <li class=" scroll"><a href="#home">home</a></li>
			                    <li class="scroll"><a href="#works">how it works</a></li>
			                    <li class="scroll active"><a href="#explore">베스트 헤어샵</a></li>
			                    <li class="scroll"><a href="#reviews">review</a></li>
			                    <li class="scroll"><a href="#blog">blog</a></li>
			                    <li class="scroll"><a href="#contact">contact</a></li>
			                    <li class="scroll" style="padding-left:100px;"><a id="loginA" href="#">sign in / register</a></li>
			                </ul><!--/.nav -->
			            </div><!-- /.navbar-collapse -->
			        </div><!--/.container-->
			    </nav><!--/nav-->
			    <!-- End Navigation -->
			</div><!--/.header-area-->
		    <div class="clearfix"></div>

		</section><!-- /.top-area-->
		<!-- top-area End -->
		
		
		<!--welcome-hero start -->
      <section id="home" class="hairShop-list">
         <div class="container">
            <div class="hairShop-list-txt">
               <h2>에디터가 선정한 인기 추천 베스트 헤어샵!<br>마음에 드시는 헤어샵을 찾으시고 예약을 해보세요!</h2>
            </div>
         </div>
      </section>
	<!--explore start -->
	
	
		<section id="explore" class="explore">
			<div class="container">
				<div class="section-header">
					<!-- <img src="/hairShopProject/main/assets/images/icon/hairShopPostTitle.jpg"><br><br>
					<p>에디터가 선정한 인기 추천 베스트 헤어샵!</p>
					<p>마음에 드시는 헤어샵을 찾으시고 예약을 해보세요!</p><br>
					글쓰기 버튼 -->
					<div>
						<c:if test="${memId!=null}">
						<a id="registShop" style="color:gray; font-family:sans-serif; text-decoration:none" href="/hairShopProject/main/assets/post/hairShopPostWriteForm.jsp">
							<img src="/hairShopProject/main/assets/images/icon/hairicon.png"><br>
							등록하기!
						</a>
						</c:if>
					</div>
					<!-- 글쓰기 끝 -->
				</div><!--/.section-header-->
				<div class="explore-content">
					<div class="row">
					
					
					<!-- 1번 -->
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e1.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이번달 추천!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt" href="#"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-1">
									<h2><a href="#">박준뷰티렙</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.8</span>
										<a href="#"> 89 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">5.1원-8.5원</span>
										</span>
										 <a href="#">서울 청담동</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person1.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													스타일의 변화뿐만 아니라 건강한 머릿결과 수준높은 서비스를 받고 싶다면 가장 인지도 높고 손꼽히는 헤어샵 박준뷰티랩!
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">09:30 - 21:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<!-- 2번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e2.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이벤트 할인!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-2">
									<h2><a href="#">스테이415 헤어샵</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">5.0</span>
										<a href="#"> 31 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">1.8원-3.9원</span>
										</span>
										 <a href="#">서울 봉천동</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person2.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													<span>이벤트 내용</span><br>
													1. 펌+염색 시술 시 무코타 클리닉 2단계 서비스<br>
													2. 염색 시술시 컷트 무료!!<br>
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">11:00 - 21:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<!-- 3번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e3.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이번달 인기!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-3">
									<h2><a href="#">로젠탈헤어샵</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.7</span>
										<a href="#"> 54 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">1.5원-3.7원</span>
										</span>
										 <a href="#">서울 영등포</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person3.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													모던한 컨셉의 미니멀한 인테리어 갤러리 분위기를 내는 헤어샵입니다. 
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">10:00 - 20:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						<!-- 4번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e4.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이번주 추천!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-3">
									<h2><a href="#">박준뷰티렙(세종)</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.8</span>
										<a href="#"> 3 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">4.8원-7.9원</span>
										</span>
										 <a href="#">서울 세종시</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person4.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													오로지 미용이 삶이었고, 일이며, 목적 이었던 박준이라는 디자이너, 박준뷰티랩만의 아름다움으로 고객님의 옆에서 항상 동행하겠습니다.
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">10:00 - 20:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						
						<!-- 5번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e5.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이벤트 추천!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-4">
									<h2><a href="#">SM프로헤어</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.9</span>
										<a href="#"> 28 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">2.1원-5.3원</span>
										</span>
										 <a href="#">서울 동대문구</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person5.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													각종 매체에도 소개된 동대문구 우수 미용업소! 예약 방문시에 훨씬 저렴하게 시술하실 수 있습니다!
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">10:00 - 20:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<!-- 6번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e6.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이벤트 추천!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-5">
									<h2><a href="#">화미주</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.7</span>
										<a href="#"> 45 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">1.9원-4.2원</span>
										</span>
										 <a href="#">서울 종로3가</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person6.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													오랜전통과 입소문이 자자한 화미주미용실! 연제구 머리 잘하는 미용실 화미주에서 특별한 이벤트! 
													무려~ 무료염색시술권!!!

												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">10:00 - 20:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						
						<!-- 1번 -->
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e1.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이번달 추천!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-1">
									<h2><a href="#">박준뷰티렙</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.8</span>
										<a href="#"> 89 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">5.1원-8.5원</span>
										</span>
										 <a href="#">서울 청담동</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person1.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													스타일의 변화뿐만 아니라 건강한 머릿결과 수준높은 서비스를 받고 싶다면 가장 인지도 높고 손꼽히는 헤어샵 박준뷰티랩!
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">09:30 - 21:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<!-- 2번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e2.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이벤트 할인!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-2">
									<h2><a href="#">스테이415 헤어샵</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">5.0</span>
										<a href="#"> 31 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">1.8원-3.9원</span>
										</span>
										 <a href="#">서울 봉천동</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person2.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													<span>이벤트 내용</span><br>
													1. 펌+염색 시술 시 무코타 클리닉 2단계 서비스<br>
													2. 염색 시술시 컷트 무료!!<br>
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">11:00 - 21:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<!-- 3번 -->
						
						<div class=" col-md-4 col-sm-6">
							<div class="single-explore-item">
								<div class="single-explore-img">
									<img src="/hairShopProject/main/assets/images/explore/e3.jpg" alt="explore image" >
									<div class="single-explore-img-info">
										<button onclick="">이번달 인기!</button>
										<div class="single-explore-image-icon-box">
											<ul>
												<li>
													<div class="single-explore-image-icon">
														<i class="fa fa-arrows-alt"></i>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="single-explore-txt bg-theme-3">
									<h2><a href="#">로젠탈헤어샵</a></h2>
									<p class="explore-rating-price">
										<span class="explore-rating">4.7</span>
										<a href="#"> 54 리뷰</a> 
										<span class="explore-price-box">
											가격
											<span class="explore-price">1.5원-3.7원</span>
										</span>
										 <a href="#">서울 영등포</a>
									</p>
									<div class="explore-person">
										<div class="row">
											<div class="col-sm-2">
												<div class="explore-person-img">
													<a href="#">
														<img src="/hairShopProject/main/assets/images/explore/person3.png" alt="explore person">
													</a>
												</div>
											</div>
											<div>
												<p class="col-sm-10">
													모던한 컨셉의 미니멀한 인테리어 갤러리 분위기를 내는 헤어샵입니다. 
												</p>
											</div>
										</div>
									</div>
									<div class="explore-open-close-part">
										<div class="row">
											<div class="col-sm-5">
												<button class="close-btn open-btn" onclick="window.location.href='#'">10:00 - 20:00</button>
											</div>
											<div class="col-sm-7">
												<div class="explore-map-icon">
													<a href="#"><i data-feather="map-pin"></i></a>
													<input type="hidden" src="#">
													<a href="#"><i data-feather="upload"></i></a>  <!-- 주소 카피 가능한 버튼 -->
													<a href="#"><i data-feather="heart"></i></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						</div>
							<div id="boardPagingDiv" style="float: left; width: 700px; text-align: center;">
							</div>
							
							<br><br><br>
							<div style="width: 750px; text-align: center;">
								<select id="searchOption">
									<option value="subject">샵 이름</option>
									<option value="id">지역</option>
								</select>
								<input type="text" id="keyword" width="30px">
								<input type="button" value="검색" id="searchBtn">
							</div>
						</div>
						</div>
						<!--/.container-->

		</section><!--/.explore-->
		<!--explore end -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function boardSearch(pg){
	$('#pg').val(pg);
	$('#searchBtn').trigger('click','trigger');
}
</script>
<script type="text/javascript">
//검색
$(document).ready(function(){
	$('#searchBtn').click(function(event, str){
		if(str!='trigger')
			$('#pg').val(1);
		
		if($('#keyword').val()=="")
			alert("검색어를 입력하세요");
		else{
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/main/assets/post/hairShopSearch.do',
				data : {
					'pg':$('#pg').val(),
					'searchOption': $('#searchOption').val(),
					'keyword': $('#keyword').val()
				},
				dataType : 'json',
				success : function(data){
					$('#hairShopListTable tr:gt(0)').remove();
					
					$.each(data.list, function(index, items){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : items.seq
						})).append($('<td/>',{
							
							}).append($('<a/>',{
								class : 'subjectA',
								href : 'javascript:void(0)',
								text : items.subject
							})
						)).append($('<td/>',{
							align : 'center',
							text : items.id
						})).append($('<td/>',{
							align : 'center',
							/*text : new Date(items.logtime).toLocaleDateString("lt-LT")*/
							text : items.logtime
						})).append($('<td/>',{
							align : 'center',
							text : items.hit
						})).appendTo($('#hairShopListTable'));                            
					});
					
					$('#hairShopPagingDiv').html(data.hairShopPaging.pagingHTML);
				}
			});
		}
	});
	
	//검색
	$('#searchBtn').on('click',function(){
		var searchOption = $('#searchOption').val();
		var keyword = encodeURIComponent($('#keyword').val(),"UTF-8");
		var pg = $('#pg').val();
		//alert(keyword);

		if(keyword.length==0)
			alert("검색어를 입력해주세요");
		else
			location.href='hairShopSearch.do?searchOption='+searchOption+'&keyword='+keyword+"&pg="+pg;     
	});
});
</script>
</body>
</form>
</html>