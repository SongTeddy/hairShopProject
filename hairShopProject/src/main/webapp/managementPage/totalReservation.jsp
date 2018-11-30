<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/css/totalReservation.css">

<input type="hidden" id="hairshopId" value="${hairshopId }">

<font size="6pt" style="color: #363636;">예약 현황</font><br>
<hr style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 145px;
	    	  border-top: 2px solid #5A5A5A;"><br>
	    	  
<div class="totalReservation">
	<div class="total">
		<div class="totalReserve">예약 Total : </div>
		<div class="totalPrice">매출 Total : </div>
	</div><br>
	
	<div class="year"></div>
	
	<div class="designer_reserve">
		<table id="designerTable" frame="hsides" rules="rows" align="center">
	
			<tr class="topTr" bgcolor="#484848">
				<td class="backslash" width="100px">
					<div>날짜</div>&emsp;시간
				</td>
			</tr>		
		</table>
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/js/totalReservation.js"></script>
<script>
$(document).ready(function() {
	/* 총 예약 수 */
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/managementPage/getTotalReservation.do',
		data : {'hairshopId':$('#hairshopId').val()},
		dataType : 'text',
		success : function(data) {
			$('.totalReserve').append(data+'건');
		}
	});
	
	/* 총 예약 금액 */
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/managementPage/getTotalReservePrice.do',
		data : {'hairshopId':$('#hairshopId').val()},
		dataType : 'text',
		success : function(data) {
			$('.totalPrice').append(data+"원");
		}
	});
	
	/* 현재부터 7일치 년,월,일 구하기  */
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/managementPage/reserveCalender.do',
		dataType : 'json',
		success : function(data) {
			var today = new Array();
			
			$.each(data.list, function(index, items) {
				today[index] = items; // [0]=년, [1]=월, [2]=일 ... [18]=년, [19]=월, [20]=일
			});
			
			$('.year').text(today[0]);
			
			for(var i=1; i<=19; i+=3) { // 월 / 일 형식으로 최상단 tr에 td 추가 
				$('.topTr').append($('<td/>', {
					text : today[i]+' / '+today[i+1],
					style : 'width: 120px; color: white;'
				}));
			}
		}
	});
	
	/* 헤어샵의 오픈,클로징 타임으로 시간 하나의 tr태그 생성 */
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/managementPage/getMemberInfo.do',
		data : {'hairshopId':$('#hairshopId').val()},
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items) {
				var openTime = (items.opentime).split(':');
				var closeTime = (items.closetime).split(':');
				
				var hour = Number(openTime[0]); // 오픈시간의 시 저장
				var minute = Number(openTime[1]); // 오픈시간의 분 저장
				
				for(var i=0; i<=(Number(closeTime[0])-Number(openTime[0]))*2; i++) {
					
					if(minute==0) { // 분이 0이면 00으로 변환
						minute='00';
					}
						
					$('<tr/>', {
						// 시간의 시와 분을 합친 숫자로 클래스를 지정해줌
						class : Number(hour)+Number(minute)
						
					}).append($('<td/>', {
						text : hour+' : '+minute,
						style : 'height: 25px;'
						
						// 각각의 td를 제어하기 위해 class를 부여함
						// td의 부모인 tr의 클래스를 이용해 각 td 제어
					})).append($('<td/>', {
						class : '1',
						style : 'height: 25px;'
						
					})).append($('<td/>', {
						class : '2',
						style : 'height: 25px;'
						
					})).append($('<td/>', {
						class : '3',
						style : 'height: 25px;'
						
					})).append($('<td/>', {
						class : '4',
						style : 'height: 25px;'
						
					})).append($('<td/>', {
						class : '5',
						style : 'height: 25px;'
						
					})).append($('<td/>', {
						class : '6',
						style : 'height: 25px;'
						
					})).append($('<td/>', {
						class : '7',
						style : 'height: 25px;'
						
					})).appendTo($('#designerTable'));
					
					minute = Number(minute); // 분이 문자열 00이면 30이 더해질 수 있게 int형변환
					
					if(i==0) { // 첫바퀴 땐 (분+30)
						minute += 30;
					
					}else {
						// 두바퀴부턴 i가 짝수일 때 (분+30) 홀수일 때 (시+1, 분-30)
						if(i%2==0){ 
							minute += 30;
						}
						
						if(i%2!=0) {
							minute -= 30;
							hour += 1;
						}
					}
				}
			});
		}
	});
	
	var cnt = 1;
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/managementPage/getReserveTime.do',
		data : {'designername':'도비', 'cnt':cnt},
		dataType : 'json',
		success : function(data) {
			// td클래스를 가진 배열 생성
			var tdClassAr = new Array();
			$.each(data.tdClassList, function(index, items) {
				tdClassAr[index] = items;
			});
			
			// 요구시간을 가진 배열 생성
			var requiredTimeAr = new Array();
			$.each(data.requiredTimeList, function(index, items) {
				requiredTimeAr[index] = items;
			});
			
			// 요구시간을 가진 배열 생성
			var bookerNameAr = new Array();
			$.each(data.bookerNameList, function(index, items) {
				bookerNameAr[index] = items;
			});
			
			// 시술명을 가진 배열 생성
			var serviceAr = new Array();
			$.each(data.serviceList, function(index, items) {
				serviceAr[index] = items;
			});
			
			// each문이 연달아 일어나다 보니 생략이 되는 경우가 생겨 약간의 딜레이를 줌
			setTimeout(function() {
				$.each(data.startList, function(index, items) {
					// ex) 11:30
					// startTime[0]=11
					// startTime[1]=30
					var startTime = items.split(':');
					
					// 시작시간의 시와 분을 합쳐서 추가할 tr의 클래스와 동일하게 만들어 저장
					var trClass = Number(startTime[0])+Number(startTime[1]);
					
					$('.'+trClass+' .'+tdClassAr[index]).append($('<div/>', {
						style : 'height: 100%;'+
								'background-color: #DBDBDB;'
						
						}).append($('<div/>', {
							text : '예약자 : '+bookerNameAr[index],
							style : 'height: 10px;'+
									'color: #000000;'+
									'text-align: center;'+
									'padding-top: 30px;'
									
						})).append($('<div/>', {
							text : '시술명 : '+serviceAr[index],
							style : 'height: 10px;'+
									'color: #000000;'+
									'text-align: center;'+
									'padding-top: 30px;'
					}))).attr('rowspan', Number(requiredTimeAr[index])/30+1);
					
				});
			}, 500);
		}
	});
});
</script>