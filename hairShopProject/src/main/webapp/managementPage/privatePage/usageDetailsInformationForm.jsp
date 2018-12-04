<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/css/memberPage.css">
<style type="text/css">
.starR{
	background: url("/hairShopProject/managementPage/img/star.png") no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}
.starR.on{
	background-position:0 0;
}
</style>
<div class="usageDetailsInformationForm">
	<div class="usageDetailsInformationTitle">
		<h3>이용 내역 안내</h3>
	</div><br><br>
	<div class="usageDetailsInformationTableDiv">
		<table class="usageDetailsInformationTable">
			<thead>
				<tr>
					<td width="150px" align="center">헤어샾</td>
					<td width="130px" align="center">디자이너</td>
					<td width="100px" align="center">서비스</td>
					<td width="170px" align="center">상세서비스</td>
					<td width="100px" align="center">가격</td>
					<td width="500px" align="center">날짜</td>
					<td width="150px" align="center">결제날짜</td>
					<td width="100px" align="center">리뷰작성</td>
				</tr>
			</thead>
			<tbody>
				<div id="myInfoModal" class="infoModal">
					<div class="infoModal-content">
						<span class="closeReviewModal">&times;</span>
						<p style="font-size: 15pt; font-weight: bold; color: blue;">리뷰를 작성해 주시면 포인트 xxx만큼 드립니다.</p><br><br>
						<div class="input-container">
							<span style="font-weight: bold; margin-right: 50px; color:black;">리뷰 제목</span>
							<input type="text" class="designerSubject" style="margin-top: 10px; color: black;" size="34" placeholder="리뷰 제목 입력">
							<div class="designerSubjectDiv"></div>
						</div>
						<div class="input-container" style="margin-top: 10px;">
							<span style="font-weight: bold; margin-right: 50px; color:black;">리뷰 내용</span>
							<textarea class="designerContent" cols="36" rows="8" style="overflow-y:scroll; resize:none; vertical-align:middle; color: black;" placeholder="리뷰  내용 입력"></textarea>
							<div class="designerContentDiv"></div>
						</div>
						<div class="input-container hairShopStarRev">
							<span class="hairshop_star_title" style="font-weight: bold; margin-right: 73px; color:black;">미용실 별점</span>
							<span class="starR on hairshop_star">1</span>
							<span class="starR hairshop_star" style="margin-left: 15px;">2</span>
							<span class="starR hairshop_star" style="margin-left: 15px;">3</span>
							<span class="starR hairshop_star" style="margin-left: 15px;">4</span>
							<span class="starR hairshop_star" style="margin-left: 15px;">5</span>
						</div>
						<div class="button-container" style="margin-top: 50px;">
							<input type="button" class="reviewWriteBtn" style="width: 80px; margin-right: 10px; color:black;" value="리뷰 작성">
							<input type="reset" style="width: 80px; color:black;" value="다시 작성">
						</div>
					</div>
				</div>
			</tbody>
		</table>
	</div>
</div>
<input type="hidden" class="usageDetailsInformationEmail" value="${memEmail}">
<input type="hidden" class="hiddenTheDay" value="">
<input type="hidden" class="hairShopStar" value="1">
<script>
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};
</script>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '../managementPage/usageDetailsInformation.do',
		data : {'email':$('.usageDetailsInformationEmail').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				var startTime = new Date(items.STARTTIME).format("yyyy-MM-dd a/p hh:mm");
				var endTime = new Date(items.ENDTIME).format("yyyy-MM-dd a/p hh:mm");
				var reviewButton = document.createElement("a");
				var theday = items.THEDAY;
				
				if(items.DIDORDIDNOT==0){
					reviewButton.innerHTML='<input type="button" class="serviceCheck" value="Review" disabled>'
				} else {
					reviewButton.innerHTML='<input type="button" onclick="reviewPop(\''+theday+'\')" class="serviceCheck" value="Review">'
				}
				
				$('<tr/>').append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : items.NAME
				})) .append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : items.DESIGNERNAME
				})).append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : items.SERVICE
				})).append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : items.DESCRIPTION
				})).append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : items.PRICE.toLocaleString()+"원"
				})).append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : startTime+" ~ "+endTime
				})).append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					text : items.THEDAY,
					class : 'reservation_theday'
				})).append($('<td/>',{
					style : 'font-size:12pt; font-weight:initial;',
					html : reviewButton
				})).appendTo($('tbody'));
			});
			
		}
	});
	
	$('.closeReviewModal').on('click',function(){
		$('.infoModal').css("display","none");
	});
	
	$('.hairShopStarRev').on('click','.hairshop_star',function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		alert("미용실 별점 = "+$(this).text());
		$('.hairShopStar').val($(this).text());
	
		return false;
		
	});
	
	$('.reviewWriteBtn').on('click',function(){
		$('.designerSubjectDiv, .designerContentDiv').empty();
		if($('.designerSubject').val()==""){
			$('.designerSubjectDiv').text('제목을 작성해주세요.').css('font-size','9pt').css('color','red').css('font-weight','bold');
		} else if($('.designerContent').val()==""){
			$('.designerContentDiv').text('내용을 작성해주세요.').css('font-size','9pt').css('color','red').css('font-weight','bold');
		} else {
			$.ajax({
				type : 'POST',
				url : '../hairShop/reviewWrite.do',
				data : {'email':$('.usageDetailsInformationEmail').val(), 'theday':$('.hiddenTheDay').val(), 'starScope':$('.hairShopStar').val(), 'designerSubject':$('.designerSubject').val(), 'designerContent':$('.designerContent').val()},
				dataType : 'text',
				success : function(data){
					alert(data);
					if(data=="success"){
						alert("리뷰 글을 작성! 무료 XXX포인트를 지급받으셨습니다.");
						window.location.reload();
					}
				},
				error : function(){
					alert("error");
				}
			});
		}
	});
});
function reviewPop(theday) {
	$('#myInfoModal').css("display","block").css("background-color","rgba(0,0,0,0.1)");
	$('.hiddenTheDay').val(theday);
}
</script>
