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
	<form name="serviceRegisterForm" method="post" action="/hairShopProject/adminPage/serviceRegistered.do">
		<font size="6pt" style="color: #363636;">서비스 등록하기</font><br>
		<hr align="left" style="color: black; margin-top: 10px; margin-bottom: 0px; width: 235px; border-top: 2px solid #5A5A5A;">
		<br>
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
					<input type="text" name="description" size="40"/>
				</td>
			</tr>
			<tr>
				<td>이용 요금</td>
				<td>
					<input type="number" name="price" placeholder="이용 금액(원)" autocomplete="off"  min="0" max="100000000000" step="5000" />
				</td>
			</tr>
			<tr>
				<td>소요 시간<br/>
				<span style="font-size: 8pt;">*30분 단위로 입력</span>
				</td>
				<td>
					<input type="number" name="timeRequired" placeholder="소요시간(분)" autocomplete="off"  min="0" max="600" step="30" />
				</td>
			</tr>
		</table>
		<div class="btnDiv">
		<input type="button" class="btn btn-default" id="eventRegisterBtn" value="서비스 등록">
		<input type="button" class="btn" onclick="location.href='/hairShopProject/adminPage/serviceManagement.do'" value="취소">
		</div>
	</form>
	
	<script type="text/javascript">
	
	
	
	
	</script>
</body>