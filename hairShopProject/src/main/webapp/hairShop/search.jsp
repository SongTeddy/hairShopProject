<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<!-- meta data -->
<meta charset="utf-8">
<title>hairShop</title>
<!-- For favicon png -->
<link rel="shortcut icon" type="image/icon" href="/hairShopProject/main/assets/logo/favicon.png"/>

<!--style.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/style.css">

<!--flaticon.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/flaticon.css">

<!--bootstrap.min.css-->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet" href="/hairShopProject/main/assets/css/bootsnav.css">

<!--  date picker css-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<style type="text/css">
.logo-img:hover {
	cursor:pointer;
}
html, body{
	max-height: 100%;
}
#searchResultTableBody td{
	width: 7%;
	padding: 10px;
}

#searchResultTableBody span{
	margin-left: 10px;
}
.distanceDiv{
	padding-top: 30px;
	padding-right: 10px;
	font-size: 18px;
	text-align: right;
	color: gray;
}


/* 	다음 지도 관련 css */
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 15px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    .goToReserve { color: #fff; background-color: #337ab7; border-color: #2e6da4; display: inline-block; padding: 6px 12px; margin-bottom: 0; font-size: 12px; font-weight: 400; line-height: 1.42857143; text-align: center; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; margin-right: 8px; padding: 2px;}
	.goToReserve:hover {color: #fff; background-color: #337ab7; border-color: #2e6da4; display: inline-block; padding: 6px 12px; margin-bottom: 0; font-size: 12px; font-weight: 400; line-height: 1.42857143; text-align: center; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none; border: 1px solid transparent; border-radius: 4px; margin-right: 8px; padding: 2px;}

</style>
</head>
<body>
<header>
 <!-- welcome-hero-search-box start -->
 <section style="margin-bottom: 20px;">
 		<!-- service, date, day, latitud, longitude 좌표만보냄 -->
        <form name="searchingForm" method="post" action="/hairShopProject/hairShop/search.do">
			<img class="navbar-brand logo-img" src="/hairShopProject/main/assets/logo/logo.png" style="position:absolute; top:13px; width:130px; height: auto;" onclick="location.href='/hairShopProject/main/index.do'" />
        <div class="welcome-hero-search-box" style="margin: 8px 135px -10px 135px;">
           <div class="welcome-hero-form" >
               <div class="single-welcome-hero-form">
                     <img class="serviceCategory" src="/hairShopProject/main/assets/images/welcome-hero/ic_service-category.png" style="cursor: pointer;"></img>
                     <input type="text" name="service" id="service" class="serviceCategory" placeholder="서비스 유형" autocomplete="off"/>
                     <div class="welcome-hero-form-icon">
                   <div class="sub-menu serviceMenu" id="serviceMenu">
                     <table class="sub-menuTable">
                        <tr>
                           <td><img src="/hairShopProject/main/assets/images/welcome-hero/haircut.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">컷트</button>
                           </td>
                           <td><img src="/hairShopProject/main/assets/images/welcome-hero/perm.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">펌</button>
                           </td>
                           <td><img src="/hairShopProject/main/assets/images/welcome-hero/dye.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">염색</button>
                           </td>
                        </tr>
                        <tr>
                           <td><img src="/hairShopProject/main/assets/images/welcome-hero/styling.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">스타일링</button>
                           </td>
                           <td><img src="/hairShopProject/main/assets/images/welcome-hero/clinic.png" class="serviceIcon" width="70" /><br />
                              <button type="button" class="btn btn-default btn-sm serviceOption">클리닉</button>
                           </td>
                           <td></td>
                        </tr>
                     </table>
                  </div>
               </div>
                  </div>
                  <div class="single-welcome-hero-form">
                     <img class="ic_calendar" src="/hairShopProject/main/assets/images/welcome-hero/ic_calendar.png" style="cursor: pointer;"></img>
                        <input type="text" name="date" id="date" placeholder="예약 날짜 지정" autocomplete="off"/>
                        <input type="hidden" name="day" id="day" />
                     <div class="welcome-hero-form-icon">
                     </div>
                  </div>
                  
            <div class="single-welcome-hero-form">
               <img class="locationCategory" src="/hairShopProject/main/assets/images/welcome-hero/ic_place.png" style="cursor: pointer;"/> 
               
               <input type="text" class="locationCategory" placeholder="지역 선택" autocomplete="off" />
               <input type="hidden" name="latitud" id="latitud"/>
               <input type="hidden" name="longitude" id="longitude"/>
               
               <div class="welcome-hero-form-icon">
                  <div class="sub-menu locationMenu" style="width: 400px;">
                     <div class="location-picker-panel-current-location" id="gpsIndicator">
                        <p >
                           <img alt="위치" src="/hairShopProject/main/assets/images/welcome-hero/ic-location.png">
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
                  <button class="welcome-hero-btn" type="button">
                      search  <i data-feather="search"></i> 
                  </button>
               </div>
            </div>
      </form>
   </section>
   <!--/.welcome-hero--> 
	<!--welcome-hero end -->
</header>

<div style="height: 80%;">
   <div style="position: absolute; width: 40%; height: 85%;">
      <div style="padding: 0px 30px;">
         <div style="width: 40%; float: left;"><strong>총 <span id="listSize"></span>개</strong></div>
         <div style="text-align: right; width: 50%;  float: right;">
            <input name="sortOption" type="radio" value="0" />추천순&emsp; 
            <input name="sortOption" type="radio" value="1" />거리순
         </div>
      </div>
      <div style="padding: 30px 30px 0px 30px; height: 100%;">
         <div id="searchResultDiv" style="overflow-y: scroll; overflow-x:hidden; height: 100%; border-top: 3px gray solid;">
            <table id="searchResultTable" class="table table-hover">
            <thead></thead>
            <tbody id="searchResultTableBody">
         </tbody>
         </table>
      </div>
   </div>
</div>
	<div id="map" style="position: absolute; margin-left: 40%; margin-right: 30px; width: 60%; height: 85%;"></div>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bdcc4d7ca1e01a2e5d822a148f1f8aa&libraries=services"></script>

<!-- date picker -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript">
var latitud = 0;
var longitude = 0;
var i = 0;
var c = 0;
var listSearch;
var listLength = 0;
var overlays = [];
var markers = [];
var contents = [];
var map;
	
	$("input:radio[name ='sortOption']:input[value='${sortOption }']").attr("checked", true);

	/* 현재위치 띄우기 */
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 
	        center: new daum.maps.LatLng('${latitud }', '${longitude }'), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

	map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var currentImageSrc = '/hairShopProject/hairShop/img/현재위치아이콘.png', // 마커이미지의 주소입니다    
	imageSize = new daum.maps.Size(32, 45), // 마커이미지의 크기입니다
	imageOption = {offset: new daum.maps.Point(20, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var currentMarkerImage = new daum.maps.MarkerImage(currentImageSrc, imageSize, imageOption), 
	currentMarkerPosition = new daum.maps.LatLng('${latitud }', '${longitude }'); // 마커가 표시될 위치입니다

	// 지도에 마커를 표시합니다 
	var currentMarker = new daum.maps.Marker({
		position: currentMarkerPosition, 
	    image: currentMarkerImage
	});

	currentMarker.setMap(map);

	//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay(index) {
	    overlays[index].setMap(null);     
	}

	daum.maps.event.addListener(currentMarker, 'click', function() {
		map.setCenter(currentMarker.getPosition());
	});
	
	getSearchList();
$(document).ready(function() {
	
	$('input[name=sortOption]').on('click', function(){
		alert("sort 옵션 선택" + $('input[name=sortOption]:checked').val());
		var params = {'service' : '${service }', 'date' : '${date }', 'day' : '${day }', 'latitud' : '${latitud }', 'longitude': '${longitude }', 'sortOption': $('input[name=sortOption]:checked').val()};
		var path = "/hairShopProject/hairShop/search.do";
		var method = 'post';
		post_to_url(path, params, method);
	});	

	
	/*ajax end  */
	/* scroll function start */
 	$('#searchResultDiv').scroll(function(){
		var scrollT = $('#searchResultDiv').scrollTop(); //스크롤바의 상단위치
		var scrollH = $('#searchResultDiv').height(); //스크롤바를 갖는 div의 높이
		var contentH = $('#searchResultDiv').prop('scrollHeight'); //문서 전체 내용을 갖는 div의 높이
		if(scrollT + scrollH + 1 >= contentH ) { // 스크롤바가 맨 아래에 위치할 때			
			c = c + 10;
 			for(var j = c; j< c+10; j++){
 				if(j >= listLength) {
 					return false;
 				}
 				markers[j].setMap(map);
				$('<tr/>', {
					id : j
				}).append($('<td/>',{
					
				}).append($('<div/>',{
					
				}).append($('<img/>',{
					src:'/hairShopProject/main/assets/images/explore/e1.jpg',
					alt:"explore image"
				})))).append($('<td/>',{
					
				}).append($('<div/>',{
					class:"single-explore-search-txt bg-theme-1"
				}).append($('<span/>',{
					
				}).append($('<a/>',{
					href: "javascript:moveTo('"+listSearch[j].HAIRSHOPID+"');",
					html: listSearch[j].NAME
				})).append($('<span/>',{
					class:"explore-rating",
					html : "<img src='/hairShopProject/hairShop/img/star2.png' style='width:13px; height:13px; padding-right: 2px;' /><span style='vertical-align: top; margin-left: 0px;'>"+listSearch[j].AVGSTAR+"</span>"
				})).append($('<span/>',{
					text: '리뷰 '+ listSearch[j].REVIEWCNT + ' 개'
				}))).append($('<p/>',{
					class:"explore-rating-search-price"
				}).append($('<span/>',{
					class:"explore-price-box",
					text: '${service }' + "      "
				}).append($('<span/>',{
					class:"explore-price",
					text: listSearch[j].MINPRICE.toLocaleString() + " - " + listSearch[j].MAXPRICE.toLocaleString() + "원"
				})).append($('<div/>',{
					class:"row"
				}).append($('<span/>',{
					text:"영업시간    "
				})).append($('<span/>',{
					class : "close-btn open-btn",
					text : listSearch[j].OPENTIME + "~" + listSearch[j].CLOSETIME
				}))))).append($('<div/>', {
					class : 'distanceDiv',
					text : listSearch[j].DISTANCE >=1 ? listSearch[j].DISTANCE  + "km" : listSearch[j].DISTANCE*1000 + "m"
				})))).appendTo($('#searchResultTableBody'));
			}
		}
	});
	
	$('table').on('click', 'tr', function(){
		for(i=0; i<overlays.length; i++){
			overlays[i].setMap(null); 
		}
		overlays[$(this).prop('id')].setMap(map);
		map.setCenter(markers[$(this).prop('id')].getPosition());
	});
	
	/* scroll function end  */
    
	$('#gpsIndicator').on('click', function(){
		function getLocation(position) {
			latitud = position.coords.latitude; //위도
			longitude = position.coords.longitude; //경도
       
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
			$('.serviceMenu').css('z-index', '2');
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
			$('.locationMenu').css('z-index', '2');
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
			$('form[name=searchingForm]').submit();
		}
  	});
});
function getSearchList(){
	alert($('input[name=sortOption]:checked').val());
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/getSearchList.do',
		data : {'service' : '${service }', 'day': '${day }', 'latitud' : '${latitud }', 'longitude' : '${longitude }', 'sortOption' : $('input[name=sortOption]:checked').val()},
		dataType: 'json',
		success : function(data){
			listSearch = data.list;
			listLength = data.listSize;
			$('#listSize').text(listLength);
			
			$.each(data.list, function(index, item){
				var imageSrc = '/hairShopProject/hairShop/img/미용실아이콘.png', // 마커이미지의 주소입니다    
				imageSize = new daum.maps.Size(32, 45), // 마커이미지의 크기입니다
				imageOption = {offset: new daum.maps.Point(16, 37)}; 
				// 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				  
				//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니당!
				var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new daum.maps.LatLng(item.LATITUD, item.LONGITUDE); // 마커가 표시될 위치입니다
				
				markers.push(new daum.maps.Marker({
					position: markerPosition, 
				    image: markerImage
				}));
				
				   
				markers[index].setMap(map);
				contents.push('<div class="wrap">' + 
				            '    <div class="info">' + 
				            '        <div class="title">' + item.NAME  +
				            '            <div class="close" onclick="closeOverlay(' + index + ')" title="닫기"></div>' + 
				            '        </div>' + 
				            '        <div class="body">' + 
				            '            <div class="img">' +
				            '                <img src="../hairShop'+ item.HAIRSHOPIMAGE1 +'" width="73" height="70">' +
				            '           </div>' + 
				            '            <div class="desc">' + 
				            '                <div class="ellipsis">'+ item.HAIRSHOPCONTENT +'</div>' + 
				            '                <div class="jibun ellipsis">' + item.ADDR1 + " " + item.ADDR2 + '</div>' + 
				            '                <div class="jibun ellipsis">' +  item.TEL1 + '-' + item.TEL2 + '-' + item.TEL3 + '</div>' + 
				            '                <div align="right"><a class="goToReserve" href="/hairShopProject/hairShop/hairShop_index.do?hairShopId='+ item.HAIRSHOPID + '#tab2">예약하기</a></div>' + 
				            '            </div>' + 
				            '        </div>' + 
				            '    </div>' +
				            '</div>');
	
				// 마커 위에 커스텀오버레이를 표시합니다
				// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
				overlays.push(new daum.maps.CustomOverlay({
				    content: contents[index],
				    map: map,
				    position: markers[index].getPosition()       
				}));
				
				overlays[index].setMap(null);
						
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
				daum.maps.event.addListener(markers[index], 'click', function() {
					for(i=0; i<overlays.length; i++){
						overlays[i].setMap(null); 
					}
				    overlays[index].setMap(map);
				});
			});
			
			
			$.each(data.list, function(index, item){
				if(index>=i && index<i+10){
					markers[index].setMap(map);
					$('<tr/>', {
						id : index
					}).append($('<td/>',{
						
					}).append($('<div/>',{
						
					}).append($('<img/>',{
						src:'/hairShopProject/main/assets/images/explore/e1.jpg',
						alt:"explore image"
					})))).append($('<td/>',{
						
					}).append($('<div/>',{
						class:"single-explore-search-txt bg-theme-1"
					}).append($('<span/>',{
						
					}).append($('<a/>',{
						href:"#",
						html: item.NAME
					})).append($('<span/>',{
						class:"explore-rating",
						html : "<img src='/hairShopProject/hairShop/img/star2.png' style='width:13px; height:13px; padding-right: 2px;' /><span style='vertical-align: top; margin-left: 0px;'>"+item.AVGSTAR+"</span>"
					})).append($('<span/>',{
						text: '리뷰 ' + item.REVIEWCNT + ' 개'
					}))).append($('<p/>',{
						class:"explore-rating-search-price"
					}).append($('<span/>',{
						class:"explore-price-box",
						text: '${service }' + "      "
					}).append($('<span/>',{
						class:"explore-price",
						text: item.MINPRICE.toLocaleString() + " - " + item.MAXPRICE.toLocaleString() + "원"
					})).append($('<div/>',{
						class:"row"
					}).append($('<span/>',{
						text:"영업시간    "
					})).append($('<span/>',{
						class:"close-btn open-btn",
						text:item.OPENTIME + "~" +item.CLOSETIME
					}))))).append($('<div/>', {
						class : 'distanceDiv',
						text : item.DISTANCE >=1 ? item.DISTANCE  + "km" : item.DISTANCE*1000 + "m"
					})))).appendTo($('#searchResultTableBody'));
				}
			});
		},
		error : function(){
			alert("getSearchList 에러에러!");
		}
	});
}

function post_to_url(path, params, method) {
    method = method || "post";
    var searchOptionForm = document.createElement("form");
    searchOptionForm.setAttribute("method", method);
    searchOptionForm.setAttribute("action", path);
    for (var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        searchOptionForm.appendChild(hiddenField);
    }
    document.body.appendChild(searchOptionForm);
    searchOptionForm.submit();
    return false;
}



/* 
var subMenu1 = document.getElementById('serviceMenu');
// var subMenu2 = document.getElementsByClassName('sub-menu')[1];

window.onclick = function(event) {
	alert("찍어봥"+event.target+subMenu1);
    if (event.target != subMenu1) {
		alert("안쪽 찍어봥");
    	$('.serviceMenu').fadeOut(300,function(){
			$('.sub-menu').css('transition-delay', '0s, 0s, 0.3s');
			$('.serviceMenu').css('visibility', 'hidden');
		});
    	$('.locationMenu').fadeOut(300,function(){
			$('.sub-menu').css('transition-delay', '0s, 0s, 0.3s');
			$('.serviceMenu').css('visibility', 'hidden');
		});
    }
}
 
*/
 
function moveTo(hairShopId) {
	window.location.href = '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+hairShopId;
}
</script>
