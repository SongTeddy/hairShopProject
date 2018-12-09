<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.serviceRegisterTable{
	width: 70%;
	color: black;
}
.btnDiv{
	width: 70%;
	color: black;
	text-align: right;
}
</style>
<body>
	<font size="6pt" style="color: #363636;">서비스 등록하기</font><br>
	<hr align="left" style="color: black; margin-top: 10px; margin-bottom: 0px; width: 235px; border-top: 2px solid #5A5A5A;">
	<br>
	<form name="serviceRegisterForm" method="post" action="/hairShopProject/companyPage/serviceRegistered.do">
		<table class="table table-striped serviceRegisterTable">
			<tr>
				<td>서비스 분류</td>
				<td>
					<select name="service">
						<option value="커트">커트</option>
						<option value="펌">펌</option>
						<option value="클리닉">클리닉</option>
						<option value="스타일링">스타일링</option>
						<option value="염색">염색</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>서비스 내용</td>
				<td>
					<input type="text" name="description" size="40" maxlength="40" />
				</td>
			</tr>
			<tr>
				<td>이용 요금</td>
				<td>
					<input type="number" name="price" placeholder="이용요금(원)" autocomplete="off"  min="0" max="100000000000" step="5000" />
				</td>
			</tr>
			<tr>
				<td>소요 시간<br/>
				<span style="font-size: 8pt; margin-top: -20px;">&nbsp;*30분 단위로 입력</span>
				</td>
				<td> 
					<input type="number" name="timeRequired" placeholder="소요시간(분)" autocomplete="off"  min="0" max="100000000000" step="30" />
				</td>
			</tr>
		</table>
		<div class="btnDiv">
		<input type="button" class="btn btn-default" id="serviceRegisterBtn" value="서비스 등록">
		<input type="button" class="btn" onclick="location.href='/hairShopProject/companyPage/serviceManagement.do'" value="취소">
		</div>
		<input type="hidden" name="hairShopId" value="${map.HAIRSHOPID }" />
	</form>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('#serviceRegisterBtn').on('click', function(){
			if($('input[name=description]').val()==""){
				alert("서비스에 대한 설명을 입력하세요.");
			}else if($('input[name=price]').val()==""){
				alert("이용 요금을 입력하세요.");	
			}else if($('input[name=timeRequired]').val()%30!=0){
				alert("소요시간을 30분 단위로 입력하세요.");
			}else{
				$('form[name=serviceRegisterForm]').submit();
			}
		});
	});	
	
</script>
</body>