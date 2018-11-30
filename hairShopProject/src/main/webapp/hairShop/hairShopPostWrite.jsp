<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                <a class="navbar-brand" href="index.html">list<span>race</span></a>

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
	
	<!--explore start -->
	<section id="explore" class="explore">
		<div class="container">
			<div class="section-header">
				<img width="250px" src="/hairShopProject/main/assets/images/icon/hairShopIcon.png">
				<h2>축하합니다!</h2>
				<h1>헤어샵 등록을 완료하였습니다!</h1><br>
				<a href="/hairShopProject/main/index.do" style="color:gray; font-family:sans-serif; text-decoration:none">[ 메인으로 돌아가기 ]</a>
			</div><!--/.section-header-->
		</div>
	</section>
</body>
</form>
</html>