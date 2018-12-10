<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<style type="text/css">
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
<header>
 <!-- welcome-hero-search-box start -->
	<section style="margin-bottom: 20px;">
 		<!-- service, date, day, latitud, longitude 좌표만보냄 -->
		<form id="searchForm" name="searchForm" action="/hairShopProject/main/searchHairShop.do" method="get">
		<div class="welcome-hero-search-box">
       		<div class="single-welcome-hero-form" style="width: 100%;">
				<img class="serviceCategory" src="/hairShopProject/main/assets/images/welcome-hero/ic_service-category.png" style="cursor: pointer;"></img>
                	<input type="text" style="width: 100%;" name="service" id="service" class="serviceCategory" placeholder="찾으시는 미용실 이름을 입력하세요" autocomplete="off"/>
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

<section style="margin-bottom: 20px;">
<div style="height: 80vh; position: relative;">
   <div style="width: 40%; height: 85vh; position: absolute;">
      <div style="padding: 0px 30px;">
         <div style="width: 40%; float: left;"><strong>총 <span id="listSize"></span>개</strong></div>
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
	<div id="map" style="position: absolute; margin-left: 40%; margin-right: 30px; width: 60%; height: 85vh;"></div>
</div>
</section>
</header>
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

/* 현재위치 띄우기 */
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new daum.maps.LatLng(37.571040, 126.992400), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var currentImageSrc = '/hairShopProject/hairShop/img/현재위치아이콘.png', // 마커이미지의 주소입니다    
imageSize = new daum.maps.Size(32, 45), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(20, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var currentMarkerImage = new daum.maps.MarkerImage(currentImageSrc, imageSize, imageOption), 
currentMarkerPosition = new daum.maps.LatLng(37.571040, 126.992400); // 마커가 표시될 위치입니다

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
	
$(document).ready(function() {
	$('.welcome-hero-btn').on('click',function(){
		if($('#service').val() === '') {
			alert("검색어를 입력하세요");
		} else {
			$('form#searchForm').submit();
		}
	});
	if('${service }' != '') {
		$('input#service').val('${service }');
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/hairShop/getSearchHairShopList.do',
			data : {'hairShopName' : '${service }'},
			dataType: 'json',
			success : function(data){
				$('table#searchResultTable tbody#searchResultTableBody').empty();
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
					            '                <img src="/hairShopProject/hairShop/img/banner/'+ item.HAIRSHOPIMAGE1 +'" width="73" style="height: -webkit-fill-available;">' +
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
							src:'/hairShopProject/hairShop/img/banner/' + item.HAIRSHOPIMAGE1,
							alt:"explore image"
						})))).append($('<td/>',{
							
						}).append($('<div/>',{
							class:"single-explore-search-txt bg-theme-1"
						}).append($('<span/>',{
							
						}).append($('<a/>',{
							href: "javascript:moveTo('"+item.HAIRSHOPID+"');",
							html: item.NAME
						})).append($('<div/>',{
							class:"row",
							style:"text-align:right;"
						})).append($('<div/>',{
							style:"text-align:right;"
						}).append($('<span/>',{
							class:"explore-rating",
							html : "<img src='/hairShopProject/hairShop/img/star2.png' style='width:13px; height:13px; padding-right: 2px;' /><span style='vertical-align: top; margin-left: 0px;'>"+item.AVGSTAR+"</span>"
						})).append($('<span/>',{
							text:"리뷰수 "+item.REVIEWCNT
						})))).append($('<p/>',{
						}).append($('<span/>',{
							text : item.ADDR1+" "+item.ADDR2
						}).append($('<div/>',{
							class:"row"
						}).append($('<p/>',{
							style : "margin-left: 25px; padding-bottom: -5px;",
							text:"영업시간    "
						}).append($('<span/>',{
							class:"close-btn open-btn",
							text:item.OPENTIME + "~" +item.CLOSETIME
						})))))))).appendTo($('#searchResultTableBody'));
					}
				});
			},
			error : function(){
				alert("getSearchList 에러에러!");
			}
		});
		/*ajax end  */
	}

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
					src: '/hairShopProject/hairShop/img/banner/' + listSearch[j].HAIRSHOPIMAGE1,
					alt:"explore image"
				})))).append($('<td/>',{
					
				}).append($('<div/>',{
					class:"single-explore-search-txt bg-theme-1"
				}).append($('<span/>',{
					
				}).append($('<a/>',{
					href: "javascript:moveTo('"+ listSearch[j].HAIRSHOPID+"');",
					html: listSearch[j].NAME
				})).append($('<span/>',{
					class:"explore-rating",
					text : "별점"
				})).append($('<span/>',{
					text:"리뷰수"
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
					text : listSearch[j].DISTANCE + "km"
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
  
});
function moveTo(hairShopId) {
	window.location.href = '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+hairShopId;
}
</script>
