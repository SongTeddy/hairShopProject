<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="position: relative; width: 100%;" id="eventViewBody" >
	<div style="position: absolute; width: 60%; right:20%;" class="eventView" >
	<span style="font-size:20pt;"> ${eventSubject }</span><br/>
	</div>
	
</div>

<script type="text/javascript" >
function addBannerAddress(address) {
	var addr = new String("/hairShopProject/main/assets/images/event/");
	return addr = addr + address;
}

$(document).ready(function(){
	$('<img />',{
		id : "eventImg",
		src : addBannerAddress("${eventImageName }"),
	}).appendTo($('div.eventView'));
	
	$('img#eventImg').each(function() {
        $(this).load(function(){ //이미지를 다 불러온후 확인하기 위해
	      	//var height = this.naturalHeight; //이미지 크키가 정해져 있지 않을때
	      	var height = $(this).height();
			$('div#eventViewBody').css('height', height+100);
        	$('<button/>',{
        		id : 'backBtn',
        		type : 'button',
        		class : 'btn-primary',
        		style : 'width:50%; height: 60px; border-radius:2em; z-index: 4; font-size:20pt;',
        		text : "뒤로가기",
        		onclick : "backBtn()"
        	}).appendTo($('div.eventView'));
        });
   	});
});
function backBtn() {
	location.href="/hairShopProject/main/event.do";
}
</script>