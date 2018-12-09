<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/hairShopProject/managementPage/companyPage/css/companyPage.css">

<div class="myPage">
   <div class="myPage_menu">
      <ul class="myPage_menu_ul">
		<li class="myPage_menu_li"><a href="/hairShopProject/managementPage/companyPage.do">예약 현황</a></li>
		<li class="myPage_menu_li"><a href="/hairShopProject/companyPage/designerMenu.do">디자이너 관리</a></li>
		<li class="myPage_menu_li"><a href="/hairShopProject/companyPage/stylebookManagement.do">스타일 찾기 추가 | 관리</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/companyPage/hairShopInfoInput.do">헤어샵 정보 등록 | 수정</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/companyPage/scheduleManagement.do">디자이너 스케줄 등록 | 변경</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/companyPage/serviceManagement.do">서비스 등록 | 변경</a></li>
      </ul>
   </div>
   <div class="myPage_body">
      <jsp:include page="${myPageBody }" />
   </div>
</div>


<script>
$(document).ready(function() {
	
	$('.myPage_menu_li a').on('click',function(){
		$('.myPage_menu_li a').removeClass('myPage_menu_ul_active');
		$(this).addClass('myPage_menu_ul_active');
	});
	
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getHairShopInfo.do',
		dataType: 'json',
		success : function(data){
			if(data.map.HAIRSHOPID != null)
				$('<li/>', {
					class : 'myPage_menu_li'
				}).append($('<a/>', {
					href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId=' + data.map.HAIRSHOPID,
					text : data.map.NAME + " 홈 바로가기"
				})).appendTo('.myPage_menu_ul');
		}, 
		error : function(){
			alert("홈페이지 링크 못받았대...");
		}
	});
});
</script>