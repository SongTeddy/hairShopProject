<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
img.coupon:hover{
	cursor : pointer;
}
</style>
<div style="position: relative; width: 100%;" id="eventViewBody" >
	<div style="position: absolute; width: 60%; right:20%;" class="eventView" >
		<span style="font-size:20pt;"> ${eventSubject }</span><br/>
		<div style="position: absolute; width: 60%; bottom:10%; right:15%;" class="couponView" >
		</div>
	</div>
</div>

<script type="text/javascript" >
function addBannerAddress(address) {
	var addr = new String("/hairShopProject/main/assets/images/event/");
	return addr = addr + address;
}
function backBtn() {
	location.href="/hairShopProject/main/event.do";
}
function couponDownLoad(seq) {
	var memEmail = "<%=session.getAttribute("memEmail") %>";
	if(memEmail != "null") {
		if("${couponMap.EXPIRATIONOPTION }" =="0") {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/adminPage/couponDownExpire.do',
				data : {"memEmail" : memEmail , "seq" : seq},
				dataType: 'json',
				success : function(data) {
					if(data.success == 1) alert("이미 쿠폰을 다운 받으셨습니다.");
					else if(data.success == 0) alert("쿠폰을 다운 받으셨습니다.");
				}, error : function(){
					alert("쿠폰 다운 실패");
				}
			});
		} else {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/adminPage/couponDownTerm.do',
				data : {"memEmail" : memEmail , "seq" : seq},
				dataType: 'json',			
				success : function(data) {
					if(data.success == 1) alert("이미 쿠폰을 다운 받으셨습니다.");
					else if(data.success == 0) alert("쿠폰을 다운 받으셨습니다.");
				}, error : function(){
					alert("쿠폰 다운 실패");
				}
			});
		}
	} else {
		loginPop();
	}
}
$(document).ready(function(){
	var couponMap = "${couponMap.COUPONIMAGE}";
	$('<img />',{
		id : "eventImg",
		src : addBannerAddress("${eventImageName }"),
		style : "width:100%;",
	}).appendTo($('div.eventView'));
	if(couponMap != "") {
		$('<img />',{
			id : "couponImage",
			class : "coupon",
			src : addBannerAddress("${couponMap.COUPONIMAGE }"),
			onclick : 'couponDownLoad("${couponMap.SEQ }");',
		}).appendTo($('div.couponView'));
	}
	
	$('img#eventImg').each(function() {
        $(this).load(function(){ 
	      	var height = $(this).height();
			$('div#eventViewBody').css('height', height+100);
        	$('<button/>',{
        		id : 'backBtn',
        		type : 'button',
        		class : 'btn-warning',
        		style : 'width:50%; height: 60px; border-radius:2em; z-index: 4; font-size:20pt; margin-left:25%;',
        		text : "뒤로가기",
        		onclick : "backBtn()"
        	}).appendTo($('div.eventView'));
        });
   	});
});
</script>