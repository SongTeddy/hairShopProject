<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#bannereResisterBtn{
	right : 50px;
	text-align : right;
}
.bannerAddDiv{
	background: gray;
	border-radius: 5em;
	width: 50px;
	height: 50px;
	text-align: center;
	cursor:pointer;
}
.plusSpan{
	font-size: 25pt;
	color : white;
}

.minusSpan{
	border :1px solid gray;
	border-radius: 10em;
	font-size: 10pt;
	color : red;
	cursor:pointer;
}
</style>

<body>
<form name="bannerRegisterForm" method="post" action="/hairShopProject/adminPage/bannerRegister.do">
<font size="6pt" style="color: #363636;">배너  등록하기</font><br><hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 205px;
		    	  border-top: 2px solid #5A5A5A;"><br>
<table  class="table table-striped" >
	<tr>
		<td>배너 선택</td>
		<td style="text-align:right;">
			<span class="eventImageSpan1"></span>
			<span>
				<select id="bannerOption1" name="bannerOption">
					<option value='hairShop1.png' selected >배너를 선택하세요</option>
				</select>
			</span>
		</td>
	</tr>
	<tr>
		<td>배너 선택</td>
		<td style="text-align:right;">
			<span class="eventImageSpan2"></span>
			<span>
				<select id="bannerOption2" name="bannerOption">
					<option value='hairShop2.png' selected >배너를 선택하세요</option>
				</select>
			</span>
		</td>
	</tr>
	<tr class="btnTr">
		<td id="btnAdd" colspan="2" stye="text-align:center;" >
			<div class="bannerAddDiv" style="margin-left:43%" onclick=plusTr();><span class="plusSpan">&plus;</span></div>
		</td>
	</tr>
	<tr>
		<td id="btnId" colspan="2" style="text-align:right;">
			<input type="submit" class="btn btn-default" id="bannereResisterBtn" value="배너 등록">
		</td>
	</tr>
</table>
</form>
<br/>
<script type="text/javascript">
$(document).ready(function(){
	//이벤트 리스트
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/banner_eventList.do',
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.eventList,function(index,items){
				$('<option value="'+items.EVENTBANNERIMAGE+'">'+items.EVENTSUBJECT+'</option>').appendTo($('#bannerOption1'));
				$('<option value="'+items.EVENTBANNERIMAGE+'">'+items.EVENTSUBJECT+'</option>').appendTo($('#bannerOption2'));
			});	
		},
		error : function(data){
			alert("error");
		}
	});
	
	$(document).on('change','select.bannerSelect',function(){
		var bannerAddr = addBannerAddress($(this).val());
		$(this).parent().prev().empty();
		$('<img/>',{
			src: bannerAddr,
			alt: '배너이미지',
			style : 'width:300px; height:auto;'
		}).appendTo($(this).parent().prev());
	});
	$('select#bannerOption1').on('change',function(){
		$('span.eventImageSpan1').empty();
		$('<img/>',{
			src: addBannerAddress($(this).val()),
			alt: '배너이미지1',
			style : 'width:300px; height:auto;'
		}).appendTo($('span.eventImageSpan1'));
	});
	$('select#bannerOption2').on('change',function(){
		$('span.eventImageSpan2').empty();
		$('<img/>',{
			src: addBannerAddress($(this).val()),
			alt: '배너이미지1',
			style : 'width:300px; height:auto;'
		}).appendTo($('span.eventImageSpan2'));
		alert($(this).val());
	});
});

function addBannerAddress(address) {
	var addr = new String("/hairShopProject/main/assets/images/event/");
	return addr = addr + address;
}
var bannerSize = 3;
function plusTr(){
	$('.btnTr').before("<tr id='bannerTr"+bannerSize+"'><td>배너 선택</td><td style='text-align:right;'>"+
					   "<span class='minusSpan' onclick=minusTr("+bannerSize+");>&minus;</span>"+
					   "<span class='eventImageSpan"+bannerSize+"'></span>"+
					   "<span><select id='bannerOption"+bannerSize+"'class='bannerSelect' name='bannerOption'>"+
					   "<option value='hairShop2.png' selected >배너를 선택하세요</option></select></span></td></tr>");
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/banner_eventList.do',
		dataType : 'json',
		success : function(data){
			$.each(data.eventList,function(index,items){
				$('<option value="'+items.EVENTBANNERIMAGE+'">'+items.EVENTSUBJECT+'</option>').appendTo($('.bannerSelect:last-child'));
			});	
		},
		error : function(data){
			alert("error");
		}
	});
	bannerSize++;
}
function minusTr(i){
	$('tr#bannerTr'+i).remove();
}
</script>
</body>

