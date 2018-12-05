<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/hairShopProject/managementPage/companyPage/css/totalReservation.css">

<input type="hidden" id="hairshopId" value="${hairshopId }">

<font size="6pt" style="color: #363636;">예약 현황</font><br>
<hr align="left" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 145px;
	    	  border-top: 2px solid #5A5A5A;"><br>
	    	  
<div class="totalReservation">
	<div class="total">
		<div class="totalReserve">예약 Total : </div>
		<div class="totalPrice">매출 Total : </div>
	</div><br>
	
	<div class="schedule_top">
		<div class="selecDesigner" style="float: left">
			<select id="designerSelect" name="selectDesigner" style="width: 70px;">
        	</select>
		</div>
		
		<div class="year" style="float: left"></div>
	</div>
	
	<div class="designer_reserve" style="clear: both;">
		<table id="designerTable" align="left" frame="hsides" rules="rows" align="center">
	
			<tr class="topTr" bgcolor="#484848">
				<td class="backslash" width="100px">
					<div>날짜</div>&emsp;시간
				</td>
			</tr>		
		</table>
	</div>
	
	<div class="changeWeek">
		<button class="changeWeekBtn">NEXT</button>
	</div>
</div>

<div class="white_content" id="open">
    <div style="line-height: 25px;">
        <div align="center"><i class="fa fa-info-circle"></i>&nbsp;예약 정보</div>
        <div id="reserveInfoClose"> <a href="#close"><i class="fa fa-times"></i></a></div><br>
        <div id="descriptionPrice" align="center"></div><br>
        <div id="bookerName"></div>
        <div id="bookerEmail"></div>
        <div id="bookerTel"></div>
        <div id="bookerRequests"></div>
    </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/companyPage/js/totalReservation.js"></script>
<script>
var todayAr = new Array(); // 년, 월, 일 배열
var dayOfWeekAr = new Array(); // 요일 배열

var bookerNameAr = new Array(); // 예약자 이름 배열
var bookerEmailAr = new Array(); // 예약자 이름 배열
var bookerTelAr = new Array(); // 예약자 이름 배열
var bookerRequestsAr = new Array(); // 예약자 이름 배열

var serviceAr = new Array(); // 서비스명 배열
var descriptionAr = new Array(); // 시술명 배열
var priceAr = new Array(); // 가격 배열
var requiredTimeAr = new Array(); // 요구시간 배열
var startEndTimeAr = new Array(); // 시작~끝 시간 배열

var tdClassAr = new Array(); // td클래스 배열
var startDay = 0;

// 일정표에 예약들을 표시해주는 함수
function showDesignerSchedule() {
	$('.1, .2, .3, .4, .5, .6, .7').empty().removeAttr('rowspan');
	var selectedDesigner = $("#designerSelect option:selected").val();
	
	var cnt = 1;
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getReserveTime.do',
		data : {'designername':selectedDesigner, 'cnt':cnt, 'startDay':startDay},
		dataType : 'json',
		success : function(data) {
			// 예약자 이름 배열 초기화
			$.each(data.bookerNameList, function(index, items) {
				bookerNameAr[index] = items;
			});
			
			// 예약자 이메일 배열 초기화
			$.each(data.bookerEmailList, function(index, items) {
				bookerEmailAr[index] = items;[index] = items;
			});
			
			// 예약자 연락처 배열 초기화
			$.each(data.bookerTelList, function(index, items) {
				bookerTelAr[index] = items;[index] = items;
			});
			
			// 예약자 이메일 배열 초기화
			$.each(data.bookerRequestsList, function(index, items) {
				bookerRequestsAr[index] = items;[index] = items;
			});
			

			// 서비스명을 가진 배열 초기화
			$.each(data.serviceList, function(index, items) {
				serviceAr[index] = items;
			});
			
			// 시술명을 가진 배열 초기화
			$.each(data.descriptionList, function(index, items) {
				descriptionAr[index] = items;
			});
			
			// 가격을 가진 배열 초기화
			$.each(data.priceList, function(index, items) {
				priceAr[index] = items;
			});
			
			// 요구시간을 가진 배열 초기화
			$.each(data.requiredTimeList, function(index, items) {
				requiredTimeAr[index] = items;
			});
			
			// 시작~끝 시간 배열 초기화
			$.each(data.startEndTimeList, function(index, items) {
				startEndTimeAr[index] = items;
			});
			
			// td클래스를 가진 배열 초기화
			$.each(data.tdClassList, function(index, items) {
				tdClassAr[index] = items;
			});
			
			// 사양이 안 좋은 컴퓨터에서는 each문이 연달아 일어나다 보니 생략이 되는 경우가 생겨 약간의 딜레이를 줌
			setTimeout(function() {
				$.each(data.startList, function(index, items) {
					// ex) 11:30 = startTime[0]=11, startTime[1]=30
					var startTime = items.split(':');
					
					// 시작시간의 시와 분을 합쳐서 추가할 tr의 클래스와 동일하게 만들어 저장
					var trClass = Number(startTime[0])+Number(startTime[1]);
					
					if(serviceAr[index]=='커트'){
						$('.'+trClass+' .'+tdClassAr[index]).append($('<div/>', {
							id : 'reserveInfoOpen',
							class : 'reserveInfoOpen'+index, // 예약정보 모달을 구분하기 위한 클래스
							style : 'position: absolute;'+
									'margin-top: -12px;'+
									'height: '+String((25*Number(requiredTimeAr[index])/30)+24)+'px;'+
									'width: 119px;'+
									'background-color: #B1B1B1;'+
									'cursor: pointer;'+
									'text-align : center'
							
								}).append($('<div/>', {
									text : startEndTimeAr[index],
									style : 'height: 17px;'+
											'color: #000000;'+
											'font-size: 14px;'+
											'text-align: center;'+
											'padding-top: 0%;'
											
								})).append($('<div/>', {
									text : '예약자 : '+bookerNameAr[index],
									style : 'height: 17px;'+
											'color: #000000;'+
											'font-size: 14px;'+
											'text-align: center;'+
											'padding-top: 0px;'
											
								})).append($('<div/>', {
									text : '서비스 : '+serviceAr[index],
									style : 'height: 17px;'+
											'color: #000000;'+
											'font-size: 14px;'+
											'text-align: center;'+
											'padding-top: 0px;'
								}))
							);
					}else {
						$('.'+trClass+' .'+tdClassAr[index]).append($('<div/>', {
							id : 'reserveInfoOpen',
							class : 'reserveInfoOpen'+index,
							style : 'position: absolute;'+
									'margin-top: -12px;'+
									'height: '+String((25*Number(requiredTimeAr[index])/30)+24)+'px;'+
									'width: 119px;'+
									'background-color: #B1B1B1;'+
									'cursor: pointer;'+
									'text-align : center'
							
								}).append($('<div/>', {
									text : startEndTimeAr[index],
									style : 'height: 35px;'+
											'color: #000000;'+
											'text-align: center;'+
											'padding-top: 25%;'
											
								})).append($('<div/>', {
									text : '예약자 : '+bookerNameAr[index],
									style : 'height: 35px;'+
											'color: #000000;'+
											'text-align: center;'+
											'padding-top: 20px;'
											
								})).append($('<div/>', {
									text : '서비스 : '+serviceAr[index],
									style : 'height: 35px;'+
											'color: #000000;'+
											'text-align: center;'+
											'padding-top: 10px;'
								}))
							);
					} // else
				}); // each
			}, 0); // setTimeout
		} // success
	}); // ajax
} // showDesignerSchedule()

// 현재부터~7일치 년, 월, 일, 요일 구하기
function addReserveDate() {
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/reserveCalender.do',
		data : {'startDay':startDay},
		dataType : 'json',
		success : function(data) {
			// 7일치 년,월,일 데이터 추가
			$.each(data.list, function(index, items) {
				todayAr[index] = items; // [0]=년, [1]=월, [2]=일 ... [18]=년, [19]=월, [20]=일
			});
			
			// 요일 배열 초기화
			$.each(data.dayOfWeekList, function(index, items) {
				dayOfWeekAr[index] = items;
			});
			
			// 년도 적용
			$('.year').text(todayAr[0]);
			
			// 월, 일, 요일 적용
			var j = 0; // 요일 배열 카운트
			for(var i=1; i<=19; i+=3) { // 월 / 일 형식으로 최상단 tr에 td 추가 
				$('.topTr').append($('<td/>', {
					text : todayAr[i]+' / '+todayAr[i+1]+' ('+dayOfWeekAr[j]+')',
					style : 'width: 120px; color: white;'
				}));
			
				j++;
			} // for
		} // success
	}); // ajax
} // reserveDate()

$(document).ready(function() {
	// 예약정보 모달
	$('#designerTable').on('click', '#reserveInfoOpen', function() {
		var i = $(this).attr('class').replace('reserveInfoOpen', '');

		$('#descriptionPrice').html('시술명 : '+descriptionAr[i]+'&ensp;/&ensp;가격 : '+priceAr[i]+'원');
		$('#bookerName').html('<i class="fa fa-user"></i>  : '+bookerNameAr[i]);
		$('#bookerEmail').html('<i class="fa fa-envelope-square"></i> : '+bookerEmailAr[i]);
		$('#bookerTel').html('<i class="fa fa-phone"></i> : '+bookerTelAr[i]);
		$('#bookerRequests').html('<i class="fa fa-commenting-o"></i> : '+bookerRequestsAr[i]);
		
		$(location).attr('href', '#open');
		
	});
	
	// 디자이너가 바뀌면 일정표를 다시 불러옴
	$('#designerSelect').change(function() {
		$('.changeWeekBtn').text('NEXT');
		
		$('.topTr td:not(.backslash)').remove();
		
		startDay = 0; // 현재
		showDesignerSchedule();
		addReserveDate()
	});

	// 총 예약 수
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getTotalReservation.do',
		data : {'hairshopId':$('#hairshopId').val()},
		dataType : 'text',
		success : function(data) {
			$('.totalReserve').append(data+'건');
		}
	});
	
	// 총 예약 금액
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getTotalReservePrice.do',
		data : {'hairshopId':$('#hairshopId').val()},
		dataType : 'text',
		success : function(data) {
			$('.totalPrice').append(data+"원");
		}
	});
	
	// select 태그에 디자이너 입력
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getHairShopDesigner.do',
		data : {'hairshopId':$('#hairshopId').val()},
		dataType : 'json',
		success : function(data) {
			// 디자이너 이름들이 저장된 배열 생성
			var designerName = new Array();
			
			$.each(data.list, function(index, items) {
				designerName[index] = items;
				
				// select에 option태그 추가
				$('#designerSelect').append($('<option/>', {
					value : designerName[index],
					text : designerName[index]
				}));
			});
			
			// 일정표에 예약 정보 표시
			showDesignerSchedule();
		}
	});
	
	// 헤어샵의 오픈,클로징 타임으로 시간 하나의 tr태그 생성
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getMemberInfo.do',
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
					} // if ~ else
				} // for
			}); // each
		} // success
	}); // ajax
	
	addReserveDate()
	
	// 다음주 버튼
	$('.changeWeekBtn').on('click', function() {
		if($('.changeWeekBtn').text()=='NEXT') {
			$('.changeWeekBtn').text('LAST');
			
			// topTr에 시간/요일 td를 제외한 모든 td를 제거 후 다음주 날짜로 다시 생성해줌
			$('.topTr td:not(.backslash)').remove();
			
			startDay = 7; // 7일 후
			showDesignerSchedule();
			addReserveDate()
			
		}else {
			$('.changeWeekBtn').text('NEXT');
			
			$('.topTr td:not(.backslash)').remove();
			
			startDay = 0; // 현재
			showDesignerSchedule();
			addReserveDate()
		}
	});
});
</script>