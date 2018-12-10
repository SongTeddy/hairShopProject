<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/reservationManagement.css">

<font size="6pt" style="color: #363636;">예약 관리</font><br>
<hr align="left" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 130px;
	    	  border-top: 2px solid #5A5A5A;"><br>

<div class="reservationManagement" style="width: 100%; height: 660px; text-align: center;">
	<div class="reservationTotalIcon">
		<i class="fa fa-calendar-check-o"></i>
	</div>
	
	<div class="reservationTotal">
		<div class="reservationTotal_top" style="height: 70%; color: #363636; font-size: 70px; padding-top: 20px;"></div>
		<div class="reservationTotal_bottom"style="height: 30%; color: #7E7E7E; ">All</div>	
	</div>
	
	<div class="reservationTodayTotal">
		<div class="reservationTodayTotal_top" style="height: 70%; color: #363636; font-size: 70px; padding-top: 20px; "></div>
		<div class="reservationTodayTotal_bottom"style="height: 30%; color: #7E7E7E;">Today</div>	
	</div>
	
	<div class="reservationListDiv" style="clear: both; position: relative; top: 70px;">
		<div class="searchDiv" align="left" style="margin-bottom: 5px;">
			<form name="searchForm" id="searchForm" method="post">
				<select name="searchOption" id="searchOption">
					<option value="hairshopid" selected="selected">헤어샵</option>
					<option value="bookername">고객명</option>
				</select>
				
				<input type="text" name="keyword" id="keyword" style="position: relative; right: 7px; height: 25px;"/>
				<button type="button" id="searchBtn" style="position: relative; right: 42px; width: 25px; height: 25px;">
					<i class="fa fa-search" style="font-size: 20px;"></i>
				</button>
				
				<input type="hidden" name="pg" id="pg" value="${pg }" />
			</form>
		</div>
	
		<table class="reservationListTable">
			<tr>
				<th width="150px">헤어샵ID</th>
				<th width="150px">고객명</th>
				<th width="150px">고객 연락처</th>
				<th width="150px">시술종류</th>
				<th width="140px">가격</th>
				<th width="100px">요구시간</th>
				<th width="150px">D-day</th>
				<th width="150px">예약날</th>
			</tr>
		</table>
		
		<div class="reservationPaging" style="position: relative; top: 20px; width: 1200px; text-align: center;"></div>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/adminPage/js/reservationManagement.js"></script>
<script>
function reservationSearch(pg){
	$('#pg').val(pg);
	$('#searchBtn').trigger('click', 'trigger'); //다른 이벤트 호출 (강제 이벤트 발생)
}

$(document).ready(function() {
	// 예약 토탈 조회
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getReservationTotal.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			var reservationTotalAr = new Array();
			
			$.each(data.ReservationTotalList, function(index, items) {
				reservationTotalAr[index] = items;
			});
			
			$('.reservationTotal_top').text(reservationTotalAr[0]);
			$('.reservationTodayTotal_top').text(reservationTotalAr[1]);
		}
	});
	
	var search = 0;
	
	if('${searchOption }' != ""){
		$('#searchOption').val('${searchOption }');	
	}

	if ('${keyword }' != "") {
		$('#keyword').val('${keyword }');
		search=1;
	}
	
	// 예약 검색
	$('#searchBtn').on('click',function(event, str){	
		if(str!='trigger'){
			$('#pg').val(1);			
		}
		
		if($('input[name=keyword]').val()=="") {
			alert("검색어를 입력해주세요");
			
		} else {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/adminPage/reservationSearch.do',
				data : $('#searchForm').serializeArray(),
				dataType : 'json',
				success : function(data){
					$('.reservationListTable .reservationListTr').hide();
					
					$.each(data.reservationSearchList, function(index, items) {
						$('<tr/>', {
							class : 'reservationListTr'
							
							}).append($('<td/>', {
								align : 'center',
								text : items.hairshopid
							
							})).append($('<td/>', {
								align : 'center',
								text : items.bookername
								
							})).append($('<td/>', {
								align : 'center',
								text : items.bookertel1+'-'+items.bookertel2+'-'+items.bookertel3
								
							})).append($('<td/>', {
								align : 'center',
								text : items.service+'('+items.description+')'
								
							})).append($('<td/>', {
								align : 'center',
								text : (items.price).toLocaleString()+'원'
								
							})).append($('<td/>', {
								align : 'center',
								text : items.timerequired+'분'
								
							})).append($('<td/>', {
								align : 'center',
								text : items.starttime
								
							})).append($('<td/>', {
								align : 'center',
								text : items.logtime
								
							})).appendTo($('.reservationListTable'));			
					}); // each
					
					// 페이징
					$('.reservationPaging').html(data.reservationPaging);
				}
			});
		}
		search = 1;
	});
	
	// 예약 리스트
	if($('#keyword').val()=="" && search==0) {
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/adminPage/getReservationList.do',
			data : {'pg':$('#pg').val()},
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				$.each(data.reservationList, function(index, items) {
					$('<tr/>', {
						class : 'reservationListTr'
						
						}).append($('<td/>', {
								align : 'center',
								text : items.hairshopid
						
						})).append($('<td/>', {
							align : 'center',
							text : items.bookername
							
						})).append($('<td/>', {
							align : 'center',
							text : items.bookertel1+'-'+items.bookertel2+'-'+items.bookertel3
							
						})).append($('<td/>', {
							align : 'center',
							text : items.service+'('+items.description+')'
							
						})).append($('<td/>', {
							align : 'center',
							text : (items.price).toLocaleString()+'원'
							
						})).append($('<td/>', {
							align : 'center',
							text : items.timerequired+'분'
							
						})).append($('<td/>', {
							align : 'center',
							text : items.starttime
							
						})).append($('<td/>', {
							align : 'center',
							text : items.logtime
							
						})).appendTo($('.reservationListTable'));			
				}); // each
				
				// 페이징
				$('.reservationPaging').html(data.reservationPaging);
			} // success
		}); // ajax
	}
});
</script>