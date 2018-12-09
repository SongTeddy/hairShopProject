<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.ui-corner-all{
	font-size: 8pt !important;
	text-align: left !important; 
/* 	width: 90%  !important; */
}

.currentEventListTable, .pastEventListTable{
	width: 90%;
	color: black;
	margin-top: 10px;
}
.btnDiv{
	width: 90%;
	color: black;
	text-align: right;
}

.eventRegisterTable caption{
	color: black;
	font-size: 20pt;
	margin-bottom: 20px;
}

.couponResiterTable td{
	padding: 10px;
}

</style>

<!--  date picker css-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<body>
<form name="currentEventUpdateOrDeleteForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/adminPage/eventUpdate.do">
<font size="6pt" style="color: #363636;">이벤트  리스트</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 210px;
		    	  border-top: 2px solid #5A5A5A;"><br>
	<div class="btnDiv">
		<input type="button" class="btn btn-default" id="insertNewEvent" value="이벤트 추가" onclick="location.href='/hairShopProject/adminPage/eventRegister.do'">
	</div>

	<br/>
	<font size="5pt" color="black">진행중인 이벤트</font>
	<table class="table table-striped currentEventListTable">
	<thead>
		<tr>
			<th><input type="checkbox" id="selectAllCurrentEvent"/></th>
			<th>번호</th>
			<th>이벤트 제목</th>
			<th>이벤트 배너 이미지</th>
			<th>이벤트 기간</th>
			<th>쿠폰 정보</th>
			<th>쿠폰 이미지</th>
			<th>쿠폰 적용 금액</th>
		</tr>
	</thead>
	<tbody id="currentEventTbody">
	</tbody>
	</table>
	<div class="btnDiv">
		<input type="button" class="btn btn-default" id="deleteCurrentEvent" value="선택한 이벤트 삭제">
		<input type="button" class="btn btn-default" id="updateCurrentEvent" value="선택한 이벤트 수정">
	</div>
<input type="hidden" name="updateOrDelete" value="">
</form>
	<br/>
	<br/>
<form name="pastEventUpdateOrDeleteForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/adminPage/eventUpdate.do">
	<font size="5pt" color="black">종료된 이벤트</font>
	<table class="table table-striped pastEventListTable">
	<thead>
		<tr>
			<th><input type="checkbox" id="selectAllPastEvent"/></th>
			<th>번호</th>
			<th>이벤트 제목</th>
			<th>이벤트 배너 이미지</th>
			<th>이벤트 기간</th>
			<th>쿠폰 정보</th>
			<th>쿠폰 이미지</th>
			<th>쿠폰 적용 금액</th>
		</tr>
	</thead>
	<tbody id="pastEventListTbody">
	</tbody>
	</table>
	<div class="btnDiv">
		<input type="button" class="btn btn-default" id="deletePastEvent" value="선택한 이벤트 삭제">
		<input type="button" class="btn btn-default" id="updatePastEvent" value="선택한 이벤트 수정">
	</div>
<input type="hidden" name="updateOrDelete" value="">
</form>

<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getEventAndCouponList.do',
		dataType : 'json',
		success : function(data){
			$.each(data.currentEventAndList, function(index, item){
				if(item.DISCOUNTOPTION == null) {
					item.DISCOUNTAMOUNT = "쿠폰 없음";
					item.COUPONIMAGE = "";
				}else if(item.DISCOUNTOPTION == '0'){
					item.DISCOUNTAMOUNT = item.DISCOUNTAMOUNT + "% 할인";	
					item.COUPONIMAGE = '<img src="/hairShopProject/main/assets/images/event/'+ item.COUPONIMAGE + '" width="100"/>';
				}else if(item.DISCOUNTOPTION == '1'){
					item.DISCOUNTAMOUNT = (item.DISCOUNTAMOUNT).toLocaleString() + "원 할인";						
					item.COUPONIMAGE = '<img src="/hairShopProject/main/assets/images/event/'+ item.COUPONIMAGE + '" width="100"/>';
				}
				if(item.MINPRICE != "0"){
					item.MINPRICE = (item.MINPRICE).toLocaleString() + "원 이상"
				}else{
					item.MINPRICE = "";
				}
				
				$('<tr/>').append($('<td/>', {
				}).append($('<input/>', {
					type : 'checkbox',
					value : item.SEQ,
					name : 'seqs',
					class : 'selectCurrentOne'
				})))
				.append($('<td/>', {
					text : item.SEQ
				}))
				.append($('<td/>', {
					text : item.EVENTSUBJECT
				}))
				.append($('<td/>', {
					html : '<img src="/hairShopProject/main/assets/images/event/'+ item.EVENTBANNERIMAGE + '" width="150"/>'
				}))
				.append($('<td/>', {
					text : new Date(item.EVENTSTARTDATE).toLocaleDateString("lt-Lt")  + " ~ " +  new Date(item.EVENTENDDATE).toLocaleDateString("lt-Lt")
				}))
				.append($('<td/>', {
					text : item.DISCOUNTAMOUNT
				}))
				.append($('<td/>', {
					html : item.COUPONIMAGE
				}))
				.append($('<td/>', {
					text : item.MINPRICE
				}))
				.appendTo($('#currentEventTbody'));
			});
			
			$.each(data.pastEventAndList, function(index, item){
				if(item.DISCOUNTOPTION == null) {
					item.DISCOUNTAMOUNT = "쿠폰 없음";
					item.COUPONIMAGE = "";
				}else if(item.DISCOUNTOPTION == '0'){
					item.DISCOUNTAMOUNT = item.DISCOUNTAMOUNT + "% 할인";	
					item.COUPONIMAGE = '<img src="/hairShopProject/main/assets/images/event/'+ item.COUPONIMAGE + '" width="100"/>';
				}else if(item.DISCOUNTOPTION == '1'){
					item.DISCOUNTAMOUNT = (item.DISCOUNTAMOUNT).toLocaleString() + "원 할인";						
					item.COUPONIMAGE = '<img src="/hairShopProject/main/assets/images/event/'+ item.COUPONIMAGE + '" width="100"/>';
				}
				
				$('<tr/>').append($('<td/>', {
				}).append($('<input/>', {
					type : 'checkbox',
					value : item.SEQ,
					name : 'seqs',
					class : 'selectPastOne'
				})))
				.append($('<td/>', {
					text : item.SEQ
				}))
				.append($('<td/>', {
					text : item.EVENTSUBJECT
				}))
				.append($('<td/>', {
					html : '<img src="/hairShopProject/main/assets/images/event/'+ item.EVENTBANNERIMAGE + '" width="150"/>'
				}))
				.append($('<td/>', {
					text : new Date(item.EVENTSTARTDATE).toLocaleDateString("lt-Lt")  + " ~ " +  new Date(item.EVENTENDDATE).toLocaleDateString("lt-Lt")
				}))
				.append($('<td/>', {
					text : item.DISCOUNTAMOUNT
				}))
				.append($('<td/>', {
					html : item.COUPONIMAGE
				}))
				.append($('<td/>', {
					text : item.MINPRICE
				}))
				.appendTo($('#pastEventListTbody'));
			});
		},
		error : function(){
			alert("이벤트 리스트 못받아와요");
		}
	});
	
	
	$('#selectAllCurrentEvent').on('change', function(){
		if($('input#selectAllCurrentEvent').prop("checked")){
			$('input:checkbox[class="selectCurrentOne"]').prop('checked', true);
		}else {
			$('.selectCurrentOne:checked').each(function(index, item){
				item.checked=false;
			});
		}
	});
	

	$(".currentEventListTable").on('change', '.selectCurrentOne', function(){
		var length = $(".selectCurrentOne").length;
		var c =0;
		$(".selectCurrentOne:checked").each(function (index, item) {
			c+=1;
		});
		if(!$(this).is(":checked")){
			$("#selectAllCurrentEvent").prop("checked", false);
		} else if(c==length){
			$("#selectAllCurrentEvent").prop("checked", true);
		}
	 });
	
	

	$('#selectAllPastEvent').on('click', function(){
		if($('input#selectAllPastEvent').prop("checked")){
			$('input:checkbox[class="selectPastOne"]').prop('checked', true);
		}else {
			$('.selectPastOne:checked').each(function(index, item){
				item.checked=false;
			});
		}
	});
	
	
	$(".pastEventListTable").on('change', '.selectPastOne', function(){
		var length = $(".selectPastOne").length;
		var c =0;
		$(".selectPastOne:checked").each(function (index, item) {
			c+=1;
		});
		if(!$(this).is(":checked")){
			$("#selectAllPastEvent").prop("checked", false);
		} else if(c==length){
			$("#selectAllPastEvent").prop("checked", true);
		}
	});
	
	
	// 삭제 버튼 이벤트
	$('#deleteCurrentEvent').on('click', function(){
		var count = $('.selectCurrentOne').length;
		if(count>0){
			$('input[name=updateOrDelete]').val('doDelete');
 			$('form[name=currentEventUpdateOrDeleteForm]').submit();			
		} else{
			alert("삭제할 이벤트를 선택해주세요.");
		}
	});
	
	
	// 수정 버튼 이벤트
	$('#updateCurrentEvent').on('click', function(){
		var count = $('.selectCurrentOne:checked').length;
		if(count==1){
			$('input[name=updateOrDelete]').val('doUpdate');
			$('form[name=currentEventUpdateOrDeleteForm]').submit();			
		} else if(count>1) {
			alert("수정할 이벤트를 하나만 선택해주세요.");			
		} else {
			alert("삭제할 이벤트를 선택해주세요.");			
		}
	});
	
	
	$('#deletePastEvent').on('click', function(){
		var count = $('.selectPastOne').length;
		if(count>0){
			$('input[name=updateOrDelete]').val('doDelete');
			$('form[name=pastEventUpdateOrDeleteForm]').submit();			
		} else{
			alert("삭제할 이벤트를 선택해주세요.");
		}
	});
	
	$('#updatePastEvent').on('click', function(){
		var count = $('.selectPastOne:checked').length;
		if(count==1){
			$('input[name=updateOrDelete]').val('doUpdate');
			$('form[name=pastEventUpdateOrDeleteForm]').submit();			
		} else if(count>1) {
			alert("수정할 이벤트를 하나만 선택해주세요.");			
		} else {
			alert("삭제할 이벤트를 선택해주세요.");
		}
	});
});
</script>
</body>
