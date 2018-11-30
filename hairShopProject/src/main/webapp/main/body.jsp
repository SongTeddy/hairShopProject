<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- review swiper start -->
<!-- 스와이퍼 css -->
<style>
.swiper-container{
	width: 50%;
	height: 300px;
}
.swiper-slide{
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #fff;
	border: 5px solid silver;
	border-radius: 5px;
	box-shadow: 0 0 10px silver inset;
	box-sizing: border-box;
}
.name1{
	font-size: 13pt;
	margin-top: 3px;
}
.name2{
	font-size: 16pt;
	margin-top: 5px;
}
.beautysalon{
	font-size: 16pt;
	margin-left: 10px;
	margin-right: 20px;
	float: left;

}
.testimonial-person-star{
	margin-top: -8px;
	float: left;

}
.testimonial-person{
	margin-top: -80px;
}
.testimonial-comment{
	margin-top: 25px;
}
.testimonial-description{
	float: left;
}
.testimonial-img{
	float: left;
}
</style>
<!-- review swiper end -->


<section id="display">
	<!--welcome-hero start -->
	<section id="home" class="welcome-hero">
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
				<div>
				<!-- 슬라이드 추가시 img 만 추가하면 됩니다.-->
					<img data-u="image" src="/hairShopProject/main/assets/images/welcome-hero/banner.jpg" />
				</div>
				<div>
					<img data-u="image" src="/hairShopProject/main/assets/img/002.jpg" />
				</div>
				<div>
					<img data-u="image" src="/hairShopProject/main/assets/img/003.jpg" />
				</div>
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
		<!-- #endregion Jssor Slider End -->
		
 <!-- welcome-hero-search-box start -->
 		<!-- service, date, day, latitud, longitude 좌표만보냄 -->
        <form name="searchingForm" method="post" action="/hairShopProject/hairShop/search.do">
        <div class="welcome-hero-search-box">
           <div class="welcome-hero-form">
               <div class="single-welcome-hero-form">
                     <img class="serviceCategory" src="assets/images/welcome-hero/ic_service-category.png" style="cursor: pointer;"></img>
                     <input type="text" name="service" id="service" class="serviceCategory" placeholder="서비스 유형" autocomplete="off"/>
                     <div class="welcome-hero-form-icon">
                   <div class="sub-menu serviceMenu">
                     <table class="sub-menuTable">
                        <tr>
                           <td><img src="assets/images/welcome-hero/haircut.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">컷트</button>
                           </td>
                           <td><img src="assets/images/welcome-hero/perm.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">펌</button>
                           </td>
                           <td><img src="assets/images/welcome-hero/dye.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">염색</button>
                           </td>
                        </tr>
                        <tr>
                           <td><img src="assets/images/welcome-hero/styling.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">스타일링</button>
                           </td>
                           <td><img src="assets/images/welcome-hero/clinic.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">클리닉</button>
                           </td>
                           <td></td>
                        </tr>
                     </table>
                  </div>
               </div>
                  </div>
                  <div class="single-welcome-hero-form">
                     <img class="ic_calendar" src="assets/images/welcome-hero/ic_calendar.png" style="cursor: pointer;"></img>
                        <input type="text" name="date" id="date" placeholder="예약 날짜 지정" autocomplete="off"/>
                        <input type="hidden" name="day" id="day" />
                     <div class="welcome-hero-form-icon">
                     </div>
                  </div>
                  
            <div class="single-welcome-hero-form">
               <img class="locationCategory" src="assets/images/welcome-hero/ic_place.png" style="cursor: pointer;"/> 
               
               <input type="text" class="locationCategory" placeholder="지역 선택" autocomplete="off" />
               <input type="hidden" name="latitud" id="latitud"/>
               <input type="hidden" name="longitude" id="longitude"/>
               
               <div class="welcome-hero-form-icon">
                  <div class="sub-menu locationMenu" style="width: 400px;">
                     <div class="location-picker-panel-current-location" id="gpsIndicator">
                        <p >
                           <img alt="위치" src="assets/images/welcome-hero/ic-location.png">
                         	 현재 위치로 찾기
                        </p>
                     </div>
                     <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab">서울/강남</a></li>
                        <li><a href="#tab2" data-toggle="tab">서울/강북</a></li>
                        <li><a href="#tab3" data-toggle="tab">서울 이외</a></li>
                     </ul>
            
                     <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                           <p>
                              <button type="button" class="btn btn-default btn-sm locationOption">가로수길/압구정/신사</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">강남역/신논현</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">역삼/선릉/삼성</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">반포/방배/서초/교대</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">논현/청담</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">잠실/송파/강동</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">목동/영등포/강서/김포</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">양재/도곡/대치</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">동작/관악</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">구로/금천/광명</button>
                           </p>
                        </div>
                        <div class="tab-pane" id="tab2">
                           <p>
                              <button type="button" class="btn btn-default btn-sm locationOption">홍대/합정/마포/상수</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">건대/강변/광진</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">명동/종로/신당/약수</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">용산/한남/이태원</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">왕십리/성수/성동</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">성신여대/대학로</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">서대문/이대/신촌</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">노원/강북/의정부</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">중랑/동대문</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">은평/응암/연신내   </button>
                           </p>
                        </div>
                        <div class="tab-pane" id="tab3">
                           <p>
                              <button type="button" class="btn btn-default btn-sm locationOption">분당/판교/용인</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">일산</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">부천/인천/송도</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">안양/군포/안산</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">경기도</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">충청도/대전</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">전라도/광주</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">경상도/부산</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">강원도</button>
                              <button type="button" class="btn btn-default btn-sm locationOption">제주도</button>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </div>
               <div class="welcome-hero-search">
                  <button class="welcome-hero-btn">
                      search  <i data-feather="search"></i> 
                  </button>
               </div>
            </div>
      </form>
   </section>
   <!--/.welcome-hero-->
   
	<!--welcome-hero end -->
	<!--explore start -->
	<section id="explore" class="explore">
		<div class="container">
			<div class="section-header">
				<h2>explore</h2>
				<p>Explore New place, food, culture around the world and many
					more</p>
			</div>
			<!--/.section-header-->
			<div class="explore-content">
				<div class="row">
					<div class=" col-md-4 col-sm-6">
						<div class="single-explore-item">
							<div class="single-explore-img" onclick="location.href='/hairShopProject/hairShop/hairShop_index.do?hairShopId=juno'">
								<img src="/hairShopProject/main/assets/images/explore/e1.jpg"
									alt="explore image" >
								<div class="single-explore-img-info">
									<button onclick="window.location.href='#'">best rated</button>
									<div class="single-explore-image-icon-box">
										<ul>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-arrows-alt"></i>
												</div>
											</li>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-bookmark-o"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="single-explore-txt bg-theme-1">
								<h2>
									<a href="#">tommy helfinger bar</a>
								</h2>
								<p class="explore-rating-price">
									<span class="explore-rating">5.0</span> <a href="#"> 10
										ratings</a> <span class="explore-price-box"> form <span
										class="explore-price">5$-300$</span>
									</span> <a href="#">resturent</a>
								</p>
								<div class="explore-person">
									<div class="row">
										<div class="col-sm-2">
											<div class="explore-person-img">
												<a href="#"> <img
													src="/hairShopProject/main/assets/images/explore/person.png"
													alt="explore person">
												</a>
											</div>
										</div>
										<div class="col-sm-10">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incid ut labore et dolore magna
												aliqua....</p>
										</div>
									</div>
								</div>
								<div class="explore-open-close-part">
									<div class="row">
										<div class="col-sm-5">
											<button class="close-btn" onclick="window.location.href='#'">close
												now</button>
										</div>
										<div class="col-sm-7">
											<div class="explore-map-icon">
												<a href="#"><i data-feather="map-pin"></i></a> <a href="#"><i
													data-feather="upload"></i></a> <a href="#"><i
													data-feather="heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-explore-item">
							<div class="single-explore-img">
								<img src="/hairShopProject/main/assets/images/explore/e2.jpg"
									alt="explore image">
								<div class="single-explore-img-info">
									<button onclick="window.location.href='#'">featured</button>
									<div class="single-explore-image-icon-box">
										<ul>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-arrows-alt"></i>
												</div>
											</li>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-bookmark-o"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="single-explore-txt bg-theme-2">
								<h2>
									<a href="#">swim and dine resort</a>
								</h2>
								<p class="explore-rating-price">
									<span class="explore-rating">4.5</span> <a href="#"> 8
										ratings</a> <span class="explore-price-box"> form <span
										class="explore-price">50$-500$</span>
									</span> <a href="#">hotel</a>
								</p>
								<div class="explore-person">
									<div class="row">
										<div class="col-sm-2">
											<div class="explore-person-img">
												<a href="#"> <img
													src="/hairShopProject/main/assets/images/explore/person.png"
													alt="explore person">
												</a>
											</div>
										</div>
										<div class="col-sm-10">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incid ut labore et dolore magna
												aliqua....</p>
										</div>
									</div>
								</div>
								<div class="explore-open-close-part">
									<div class="row">
										<div class="col-sm-5">
											<button class="close-btn open-btn"
												onclick="window.location.href='#'">open now</button>
										</div>
										<div class="col-sm-7">
											<div class="explore-map-icon">
												<a href="#"><i data-feather="map-pin"></i></a> <a href="#"><i
													data-feather="upload"></i></a> <a href="#"><i
													data-feather="heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-explore-item">
							<div class="single-explore-img">
								<img src="/hairShopProject/main/assets/images/explore/e3.jpg"
									alt="explore image">
								<div class="single-explore-img-info">
									<button onclick="window.location.href='#'">best rated</button>
									<div class="single-explore-image-icon-box">
										<ul>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-arrows-alt"></i>
												</div>
											</li>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-bookmark-o"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="single-explore-txt bg-theme-3">
								<h2>
									<a href="#">europe tour</a>
								</h2>
								<p class="explore-rating-price">
									<span class="explore-rating">5.0</span> <a href="#"> 15
										ratings</a> <span class="explore-price-box"> form <span
										class="explore-price">5k$-10k$</span>
									</span> <a href="#">destination</a>
								</p>
								<div class="explore-person">
									<div class="row">
										<div class="col-sm-2">
											<div class="explore-person-img">
												<a href="#"> <img
													src="/hairShopProject/main/assets/images/explore/person.png"
													alt="explore person">
												</a>
											</div>
										</div>
										<div class="col-sm-10">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incid ut labore et dolore magna
												aliqua....</p>
										</div>
									</div>
								</div>
								<div class="explore-open-close-part">
									<div class="row">
										<div class="col-sm-5">
											<button class="close-btn" onclick="window.location.href='#'">close
												now</button>
										</div>
										<div class="col-sm-7">
											<div class="explore-map-icon">
												<a href="#"><i data-feather="map-pin"></i></a> <a href="#"><i
													data-feather="upload"></i></a> <a href="#"><i
													data-feather="heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class=" col-md-4 col-sm-6">
						<div class="single-explore-item">
							<div class="single-explore-img">
								<img src="/hairShopProject/main/assets/images/explore/e4.jpg"
									alt="explore image">
								<div class="single-explore-img-info">
									<button onclick="window.location.href='#'">most view</button>
									<div class="single-explore-image-icon-box">
										<ul>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-arrows-alt"></i>
												</div>
											</li>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-bookmark-o"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="single-explore-txt bg-theme-4">
								<h2>
									<a href="#">banglow with swiming pool</a>
								</h2>
								<p class="explore-rating-price">
									<span class="explore-rating">5.0</span> <a href="#"> 10
										ratings</a> <span class="explore-price-box"> form <span
										class="explore-price">10k$-15k$</span>
									</span> <a href="#">real estate</a>
								</p>
								<div class="explore-person">
									<div class="row">
										<div class="col-sm-2">
											<div class="explore-person-img">
												<a href="#"> <img
													src="/hairShopProject/main/assets/images/explore/person.png"
													alt="explore person">
												</a>
											</div>
										</div>
										<div class="col-sm-10">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incid ut labore et dolore magna
												aliqua....</p>
										</div>
									</div>
								</div>
								<div class="explore-open-close-part">
									<div class="row">
										<div class="col-sm-5">
											<button class="close-btn" onclick="window.location.href='#'">close
												now</button>
										</div>
										<div class="col-sm-7">
											<div class="explore-map-icon">
												<a href="#"><i data-feather="map-pin"></i></a> <a href="#"><i
													data-feather="upload"></i></a> <a href="#"><i
													data-feather="heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-explore-item">
							<div class="single-explore-img">
								<img src="/hairShopProject/main/assets/images/explore/e5.jpg"
									alt="explore image">
								<div class="single-explore-img-info">
									<button onclick="window.location.href='#'">featured</button>
									<div class="single-explore-image-icon-box">
										<ul>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-arrows-alt"></i>
												</div>
											</li>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-bookmark-o"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="single-explore-txt bg-theme-2">
								<h2>
									<a href="#">vintage car expo</a>
								</h2>
								<p class="explore-rating-price">
									<span class="explore-rating">4.2</span> <a href="#"> 8
										ratings</a> <span class="explore-price-box"> form <span
										class="explore-price">500$-1200$</span>
									</span> <a href="#">automotion</a>
								</p>
								<div class="explore-person">
									<div class="row">
										<div class="col-sm-2">
											<div class="explore-person-img">
												<a href="#"> <img
													src="/hairShopProject/main/assets/images/explore/person.png"
													alt="explore person">
												</a>
											</div>
										</div>
										<div class="col-sm-10">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incid ut labore et dolore magna
												aliqua....</p>
										</div>
									</div>
								</div>
								<div class="explore-open-close-part">
									<div class="row">
										<div class="col-sm-5">
											<button class="close-btn open-btn"
												onclick="window.location.href='#'">open now</button>
										</div>
										<div class="col-sm-7">
											<div class="explore-map-icon">
												<a href="#"><i data-feather="map-pin"></i></a> <a href="#"><i
													data-feather="upload"></i></a> <a href="#"><i
													data-feather="heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<div class="single-explore-item">
							<div class="single-explore-img">
								<img src="/hairShopProject/main/assets/images/explore/e6.jpg"
									alt="explore image">
								<div class="single-explore-img-info">
									<button onclick="window.location.href='#'">best rated</button>
									<div class="single-explore-image-icon-box">
										<ul>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-arrows-alt"></i>
												</div>
											</li>
											<li>
												<div class="single-explore-image-icon">
													<i class="fa fa-bookmark-o"></i>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="single-explore-txt bg-theme-5">
								<h2>
									<a href="#">thailand tour</a>
								</h2>
								<p class="explore-rating-price">
									<span class="explore-rating">5.0</span> <a href="#"> 15
										ratings</a> <span class="explore-price-box"> form <span
										class="explore-price">5k$-10k$</span>
									</span> <a href="#">destination</a>
								</p>
								<div class="explore-person">
									<div class="row">
										<div class="col-sm-2">
											<div class="explore-person-img">
												<a href="#"> <img
													src="/hairShopProject/main/assets/images/explore/person.png"
													alt="explore person">
												</a>
											</div>
										</div>
										<div class="col-sm-10">
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incid ut labore et dolore magna
												aliqua....</p>
										</div>
									</div>
								</div>
								<div class="explore-open-close-part">
									<div class="row">
										<div class="col-sm-5">
											<button class="close-btn" onclick="window.location.href='#'">close
												now</button>
										</div>
										<div class="col-sm-7">
											<div class="explore-map-icon">
												<a href="#"><i data-feather="map-pin"></i></a> <a href="#"><i
													data-feather="upload"></i></a> <a href="#"><i
													data-feather="heart"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.container-->

	</section>
	<!--/.explore-->
	<!--explore end -->
	
	<!--reviews start -->
	<section id="reviews" class="reviews">
		<div class="section-header">
			<h2>DESIGNERS</h2>
			<p>About the designers</p>
		</div><!--/.section-header-->
		<br><br>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<!-- 리뷰1 -->
			    <div class="swiper-slide">
					<!-- 사진 -->
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/리나.png" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">리나</div>
					</div><!--/.testimonial-img-->	
						<div class="testimonial-description">
							<div class="testimonial-info">
							<!-- 이름 , 미용실, 별점 -->
							<div class="testimonial-person">
								<div class="beautysalon">헤어코코</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<!-- 글 -->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								헤어코코의 디자이너 리나<br>
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰2 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/혜성.png" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">혜성</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">JDS헤어디자인</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								JDS헤어디자인의 디자이너 혜성<br>
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰3 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/미코.png" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">미코</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">레드스토리</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								레드스토리의 디자이너 미코
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰4 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/하울.png" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">하울</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">리헤어</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								리헤어의 디자이너 하울<br>	
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰5 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/혜미.PNG" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name">혜미</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">헤어앤타쿠미</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								헤어앤타쿠미의 디자이너 혜미<br>
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰6 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/동우.PNG" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">동우</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">헤어스테이지</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								헤어스테이지의 디자이너 동우<br>
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰7 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/보나.PNG" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">보나</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">청담동미용실</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								청담동미용실의 디자이너 보나<br>
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
				<!-- 리뷰8 -->
			    <div class="swiper-slide">
					<div class="testimonial-img">
						<img class="photo" src="/hairShopProject/main/assets/images/clients/하성.PNG" alt="clients">
						<div class="name1">디자이너</div>
						<div class="name2">하성</div>
					</div><!--/.testimonial-img-->
					<div class="testimonial-description">
						<div class="testimonial-info">
							<div class="testimonial-person">
								<div class="beautysalon">프리베헤어</div>
								<div class="testimonial-person-star">
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
									<i class="fa fa-star"></i>
								</div>
							</div><!--/.testimonial-person-->
						</div><!--/.testimonial-info-->
						<div class="testimonial-comment">
							<p style="font-size: 13pt;">
								프리베헤어의 디자이너 하성<br>
							</p>
						</div><!--/.testimonial-comment-->
					</div><!--/.testimonial-description-->
				</div><!--/.swiper-slide-->
			</div>
			<!-- 네비게이션 버튼 지정 -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>

		</section><!--/.reviews-->
		<!--reviews end -->

	<!--subscription strat -->
	<section id="contact" class="subscription">
		<div class="container">
			<div class="subscribe-title text-center">
				<h2>do you want to add your business listing with us?</h2>
				<p>Listrace offer you to list your business with us and we very
					much able to promote your Business.</p>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="subscription-input-group">
						<form action="#">
							<input type="email" class="subscription-input-form"
								placeholder="Enter your email here">
							<button class="appsLand-btn subscribe-btn"
								onclick="window.location.href='#'">creat account</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/subscription-->
	<!--subscription end -->
</section>
<!-- main banner slider -->
<script src="/hairShopProject/main/assets/js/slider.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// banner slide start!!
		jssor_1_slider_init();
        // 현재위치로 검색
        
        var latitud = 0;
        var longitude = 0;
        
	   $('#gpsIndicator').on('click', function(){
	      function getLocation(position) {
	           latitud = position.coords.latitude; //위도
	           longitude = position.coords.longitude; //경도
	           alert(latitud +"    " +longitude);
	       
	           var geocoder = new daum.maps.services.Geocoder();
	           var callback = function(result, status) {
	               if (status === daum.maps.services.Status.OK) {
	
	                  $('.locationCategory').val(result[0].address_name);
	                  $('.locationMenu').fadeOut(300,function(){
	     			     $('.sub-menu').css('transition-delay', '0s, 0s, 0.3s');
	     			     $('.locationMenu').css('visibility', 'hidden');
	     			  });
	                  $('#latitud').val(latitud);
	                  $('#longitude').val(longitude);
	               }
	           };
	           geocoder.coord2RegionCode(longitude, latitud, callback);
	       }
	
	       if(navigator.geolocation) {
	           navigator.geolocation.getCurrentPosition(getLocation, function(error) {
	               consol.log(error.message);    
	           });
	       } else {
	           consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
	       }
	   });
	  
       //서비스 선택
	   $('.serviceCategory').on('click', function(){
	      $('.serviceMenu').fadeIn(500,function(){
	    	  $('.serviceMenu').css('visibility', 'visible');
	    	  $('.serviceMenu').css('opacity', '1');
		      $('.serviceMenu').css('z-index', '1');
		      $('.serviceMenu').css('transform', 'translateY(0%)');
		      $('.serviceMenu').css('transition-delay', '0s, 0s, 0.3s');
		  });
	   
	   });
	   
	   $('.serviceIcon').on('click', function(){
	   	 $('.serviceCategory').val($(this).nextAll().filter('button').text());
	     $('.serviceOption').removeClass('btn-info');
	     $('.serviceOption').addClass('btn-default');
	     $(this).nextAll().filter('button').addClass('btn-info');
	     $(this).nextAll().filter('button').removeClass('btn-default');
	     $('.serviceMenu').fadeOut(300,function(){
		     $('.sub-menu').css('transition-delay', '0s, 0s, 0.3s');
		     $('.serviceMenu').css('visibility', 'hidden');
	     });
	   });
	   
	   $('.serviceOption').on('click', function(){
	      $('.serviceCategory').val($(this).text());
	      $('.serviceOption').removeClass('btn-info');
	      $('.serviceOption').addClass('btn-default');
	      $(this).addClass('btn-info');
	      $(this).removeClass('btn-default');
	      $('.serviceMenu').fadeOut(300,function(){
		     $('.sub-menu').css('transition-delay', '0s, 0s, 0.3s');
		     $('.serviceMenu').css('visibility', 'hidden');
		  });
	   
	   });
	   // 지역 선택
       $('.locationCategory').on('click', function(){
    	   $('.serviceMenu').fadeIn(500,function(){
	           $('.locationMenu').css('visibility', 'visible');
	           $('.locationMenu').css('opacity', '1');
	           $('.locationMenu').css('z-index', '1');
	           $('.locationMenu').css('transform', 'translateY(0%)');
	           $('.locationMenu').css('transition-delay', '0s, 0s, 0.3s');
    	   });
        });
		   
		   $('.locationOption').on('click', function(){
		      $('.locationCategory').val($(this).text());
		      $('.locationOption').removeClass('btn-info');
		      $('.locationOption').addClass('btn-default');
		      $(this).addClass('btn-info');
		      
		      $('hidden #latitud').val(37.521236);
		      $('hidden #longitude').val(127.023021);
		      
		      $(this).removeClass('btn-default');
		      $('.locationMenu').fadeOut(300,function(){
			     $('.sub-menu').css('transition-delay', '0s, 0s, 0.3s');
			     $('.locationMenu').css('visibility', 'hidden');
			  });
		   
		   });
		   
		   
		    //날짜 선택
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
		   
		  $('.welcome-hero-btn').on('click', function(){
			  if($('#date').val().trim()==""){
				  alert("날짜를 선택하세요.");				  
			  } else if($('.locationCategory').val().trim()==""){
				  alert("지역을 선택하세요.");				  
			  } else if($('#service').val().trim()==""){
				  alert("서비스를 선택하세요.");
			  } else{
				  $('input[name=searchingForm]').submit();
			  }
		  });
   	});
</script>