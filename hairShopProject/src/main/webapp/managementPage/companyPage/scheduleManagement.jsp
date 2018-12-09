<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.scheduleRegisterTable{
	width: 90%;
	color: black;
}

</style>
<body>
	<font size="6pt" style="color: #363636;">디자이너 스케줄 등록 | 변경</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 405px;
		    	  border-top: 2px solid #5A5A5A;"><br>

	<table class="table table-striped scheduleRegisterTable">
		<tr>
			<td>전체 디자이너 스케줄</td>
			<td>
				    <input type="text" name="totalStartDate" placeholder="시작 일자" autocomplete="off"/>
				    ~ <input type="text" name="totalEndDate" placeholder="종료 일자" autocomplete="off" />
				<button class="btn btn-default" id="totalScheduleBtn">등록</button>
			</td>
		</tr>
		<tr>
			<td>개인 휴가 신청</td>
			<td>
				<select id="vacationDesigners">
				<option value="">디자이너 선택</option>
				</select>
				<hr style="margin: 5px">
				    <input type="text" name="vacationStartDate" id="vacationStartDate" placeholder="시작 일자" autocomplete="off"/>
				    ~ <input type="text" name="vacationEndDate" id="vacationEndDate" placeholder="종료 일자" autocomplete="off" />
				<button class="btn btn-default" id="vacationScheduleBtn">등록</button>
			</td>
		</tr>
		<tr>
			<td>개인 추가근무 신청</td>
			<td>
				<select id="overworkDesigners">
				<option value="">디자이너 선택</option>
				</select>
				<hr style="margin: 5px">
				    <input type="text" name="overworkStartDate" id="overworkStartDate" placeholder="시작 일자" autocomplete="off"/>
				    ~ <input type="text" name="overworkEndDate" id="overworkEndDate" placeholder="종료 일자" autocomplete="off" />
				<button class="btn btn-default" id="overworkScheduleBtn">등록</button>
			</td>
		</tr>
	</table>
<input type="hidden" name="hairShopId" value="" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('input[name=totalStartDate]').datepicker({
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
	
	
	$('input[name=totalEndDate]').datepicker({
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
	
	
	$('input[name=vacationStartDate]').datepicker({
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
	
	
	$('input[name=vacationEndDate]').datepicker({
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
	
	$('input[name=overworkStartDate]').datepicker({
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
	
	
	$('input[name=overworkEndDate]').datepicker({
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
	
	var hairShopId = "";
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getInfoForScheduling.do',
		dataType: 'json',
		success : function(data){
			hairShopId = data.list[0].HAIRSHOPID;
			$.each(data.list, function(index, item){
				$('<option/>',{
					text : item.DESIGNER,
					value : item.DESIGNERID
				}).appendTo($('#vacationDesigners'));
				
				$('<option/>',{
					text : item.DESIGNER,
					value : item.DESIGNERID
				}).appendTo($('#overworkDesigners'));
			});
		},
		error : function(){
			alert("getInfoForScheduling 못받아유");
		}
	});
	
	$('#totalScheduleBtn').on('click', function(){
		if($('input[name=totalStartDate]').val()==""){
			alert("스케줄 시작 일자를 입력하세요.");
		}else if($('input[name=totalEndDate]').val()==""){
			alert("스케줄 종료 일자를 입력하세요.");
		}else{
			alert((new Date($('input[name=totalEndDate]').val()) - new Date($('input[name=totalStartDate]').val()))/86400000);
			var diffDate = (new Date($('input[name=totalEndDate]').val()) - new Date($('input[name=totalStartDate]').val()))/86400000;
			$.ajax({
				type : 'POST',
				data : {'iMax' : diffDate, 'totalStartDate': $('input[name=totalStartDate]').val(), 'hairShopId' : hairShopId },
				url : '/hairShopProject/companyPage/totalHairShopSchedule.do',
				success : function(){
					alert($('input[name=totalStartDate]').val() + " ~ " + $('input[name=totalEndDate]').val() + " 기간의 스케줄이 등록되었습니다.");
				},
				error : function(){
					alert("스케줄 등록에 실패하였습니다.");
				}
			});
		}
	});

	
	$('#vacationScheduleBtn').on('click', function(){
		if($('#vacationDesigners option:selected').val()==""){
			alert("휴가를 등록할 디자이너를 선택하세요.");
		}else if($('input[name=vacationStartDate]').val()==""){
			alert("휴가 시작 일자를 입력하세요.");
		}else if($('input[name=vacationEndDate]').val()==""){
			alert("휴가 종료 일자를 입력하세요.");
		}else{
			var diffDate = (new Date($('input[name=vacationEndDate]').val()) - new Date($('input[name=vacationStartDate]').val()))/86400000;
			alert(diffDate);
			$.ajax({
				type : 'POST',
				data : {'iMax' : diffDate, 'vacationStartDate': $('input[name=vacationStartDate]').val(), 'designerId' : $('#vacationDesigners option:selected').val() },
				url : '/hairShopProject/companyPage/vacationDesignerSchedule.do',
				success : function(){
					alert($('#vacationDesigners option:selected').text() + $('input[name=vacationStartDate]').val() + " ~ " + $('input[name=vacationEndDate]').val() + " 기간의 휴가가 등록되었습니다.");
				},
				error : function(){
					alert("휴가 등록에 실패하였습니다.");
				}
			});
		}
	});
	
	
	$('#overworkScheduleBtn').on('click', function(){
		if($('#overworkDesigners option:selected').val()==""){
			alert("추가 근무를 등록할 디자이너를 선택하세요.");
		}else if($('input[name=overworkStartDate]').val()==""){
			alert("추가 근무 시작 일자를 입력하세요.");
		}else if($('input[name=overworkEndDate]').val()==""){
			alert("추가 근무 종료 일자를 입력하세요.");
		}else{
			var diffDate = (new Date($('input[name=overworkEndDate]').val()) - new Date($('input[name=overworkStartDate]').val()))/86400000;
			alert(diffDate);
			$.ajax({
				type : 'POST',
				data : {'iMax' : diffDate, 'overworkStartDate': $('input[name=overworkStartDate]').val(), 'designerId' : $('#overworkDesigners option:selected').val(), 'hairShopId': hairShopId },
				url : '/hairShopProject/companyPage/overworkDesignerSchedule.do',
				success : function(){
					alert($('#overworkDesigners option:selected').text() + "의 "+ $('input[name=overworkStartDate]').val() + " ~ " + $('input[name=overworkEndDate]').val() + " 기간의 휴가가 등록되었습니다.");
				},
				error : function(){
					alert("추가 근무 등록에 실패하였습니다.");
				}
			});
		}
	});
	
});

</script>
</body>
