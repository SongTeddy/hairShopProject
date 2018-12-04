<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/hairShopProject/managementPage/privatePage/css/memberPage.css">
<link rel="stylesheet" href="/hairShopProject/managementPage/css/companyPage.css">

<div class="myPage">
   <div class="myPage_menu">
      <ul class="myPage_menu_ul">
        <li class="myPage_menu_li"><a class="modifyA" href="/hairShopProject/privatePage/modifyForm.do">회원정보수정</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/privatePage/heartList.do" onclick="heartList()">관심 헤어샵</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/privatePage/reservationForm.do">예약 확인</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/privatePage/usageDetailsInformationForm.do">이용내역안내</a></li>
        <li class="myPage_menu_li"><a href="/hairShopProject/privatePage/deleteForm.do">회원 탈퇴</a></li>
      </ul>
   </div>
   
   <div class="myPage_body" align="center">
      <jsp:include page="${memberPage}" />
   </div>
</div>

<script type="text/javascript">
$(document).ready(function(){
   $('.myPage_menu_li a').on('click',function(){
      $('.myPage_menu_li a').removeClass('myPage_menu_ul_active');
      $(this).addClass('myPage_menu_ul_active');
   });
});
</script>