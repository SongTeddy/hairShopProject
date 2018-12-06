<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.ui-corner-all{
	font-size: 8pt !important;
	text-align: left !important; 
/* 	width: 90%  !important; */
}

.eventRegisterTable{
	width: 70%;
	color: black;
}
.btnDiv{
	width: 70%;
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
<form name="eventRegisterForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/adminPage/eventRegister.do">
<font size="6pt" style="color: #363636;">이벤트  등록하기</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 235px;
		    	  border-top: 2px solid #5A5A5A;"><br>


	<table class="table table-striped eventRegisterTable" id="">
		<tr>
			<td>이벤트 제목</td>
			<td><input type="text" name="eventSubject" size="40"/></td>
		</tr>
		<tr>
			<td style="height: 70px;">
			<span>이벤트 배너 이미지</span><br/>
			</td>
			<td>				
				<input type="file" name="eventBannerImage" id="eventBannerImage" />
			</td>
		</tr> 
		<tr>
			<td style="height: 70px;">
			<span>이벤트 상세 이미지</span><br/>
			</td>
			<td>				
				<input type="file" name="eventDetailImage" id="eventDetailImage" />
			</td>
		</tr>
		<tr>
			<td>이벤트 기간</td>
			<td>
				<p id="jqueryExample">
				    <input type="text" name="eventStartDate" id="startDate" placeholder="시작 일자" autocomplete="off"/>
				    ~ <input type="text" name="eventEndDate" id="endDate" placeholder="종료 일자" autocomplete="off" />
				</p>
			</td>			
		</tr>
		<tr>
			<td>쿠폰 등록</td>
				<td>
					할인 방법&emsp;
					<select id="discountOption" name="discountOption" >
						<option value="0">비율 할인 </option>
						<option value="1">차감 할인</option>
					</select>
					<input name="discountAmount" type="number" placeholder="할인율(%)" min="0" max="100" />
					<br/>
					<hr style="margin: 5px">
					종료 시점&emsp;
					<select id="expirationOption" name="expirationOption" >
						<option value="0">일자 지정</option>
						<option value="1">기간 지정</option>
					</select>
					<span id="limitDateOrDurationTd">
					<input type="text" name="expirationDate" placeholder="종료 일자" autocomplete="off" />
					</span>
				</td>
		</tr>
		<tr>
			<td style="height: 70px;">
				<span>쿠폰 이미지</span><br/>
			</td>
			<td>				
				<input type="file" name="couponImage" id="couponImage" />
			</td>
		</tr>
	</table>
	<div class="btnDiv">
		<input type="button" class="btn btn-default" id="eventRegisterBtn" value="이벤트 등록">
		<input type="button" class="btn" value="취소">
	</div>
</form>

<!-- date picker -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script type="text/javascript">
$(document).ready(function(){
	
	$('#discountOption').on('change', function(){
		if($('#discountOption option:selected').val()==0){
			$('input[name=discountAmount]').prop('placeholder', '할인율(%)');
			$('input[name=discountAmount]').prop('max', 100);
			$('input[name=discountAmount]').prop('min', 0);
			$('input[name=discountAmount]').val("");
		}else{			
			$('input[name=discountAmount]').removeProp('max');
			$('input[name=discountAmount]').prop('max', 1000000);
			$('input[name=discountAmount]').prop('min', 0);
			$('input[name=discountAmount]').prop('placeholder', '할인액(원)');	
			$('input[name=discountAmount]').val("");
		}
	});
	
	$('#expirationOption').on('change', function(){
		$('#limitDateOrDurationTd').empty();
		if($('#expirationOption option:selected').val()==0){
 			$('<input/>',{
 				name : 'expirationDate',
 				placeholder : '종료 일자'
 			}).appendTo($('#limitDateOrDurationTd'));
 			$('input[name=expirationDate]').datepicker({
 				todayHighlight: true,
 				minDate: "0", 
 				changeMonth: true, 
 			       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
 			       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
 			       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
 			       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
 			       onSelect: function(value){
 					var date = new Date(value);
 					var day = date.getDay();
 				},
 				onClose: function(value){
 					var date = new Date(value);
 					var day = date.getDay();
 				}
 			});
		}else{
			$('<input/>',{
				name : 'termOfValidity',
				placeholder : '적용 기간'
			}).appendTo($('#limitDateOrDurationTd'));
			alert($('#limitDateOrDurationTd').children(':first').attr('name'));
		}
	});
	
	$('#eventRegisterBtn').on('click', function(){
		$('form[name=eventRegisterForm]').submit();
	});
});

	//날짜 선택
	$("#startDate").datepicker({
		todayHighlight: true,
		minDate: "0", 
		changeMonth: true, 
	       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	       onSelect: function(value){
			var date = new Date(value);
			var day = date.getDay();
		},
		onClose: function(value){
			var date = new Date(value);
			var day = date.getDay();
		}
	});
	
	
	$("#endDate").datepicker({
		todayHighlight: true,
		minDate: "0", 
		changeMonth: true, 
	       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	       onSelect: function(value){
			var date = new Date(value);
			var day = date.getDay();
		},
		onClose: function(value){
			var date = new Date(value);
			var day = date.getDay();
		}
	});

	$('input[name=expirationDate]').datepicker({
			todayHighlight: true,
			minDate: "0", 
			changeMonth: true, 
		       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		       onSelect: function(value){
				var date = new Date(value);
				var day = date.getDay();
			},
			onClose: function(value){
				var date = new Date(value);
				var day = date.getDay();
			}
		});
	
</script>
</body>
