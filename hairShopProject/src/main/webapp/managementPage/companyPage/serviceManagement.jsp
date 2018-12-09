<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.serviceListTable{
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
	<font size="6pt" style="color: #363636;">서비스 리스트</font><br>
	<hr align="left" style="color: black; margin-top: 10px; margin-bottom: 0px; width: 235px; border-top: 2px solid #5A5A5A;">
	<br>
	<select name="service">
		<option value="커트">커트</option>
		<option value="펌">펌</option>
		<option value="클리닉">클리닉</option>
		<option value="스타일링">스타일링</option>
		<option value="염색">염색</option>
	</select>
	<button onclick="location.href='/hairShopProject/companyPage/serviceRegister.do'"></button>
		<table class="table table-striped serviceListTable">
		<thead>
			<tr>
				<th>분류</th>
				<th>서비스명</th>
				<th>이용 요금</th>
				<th>소요 시간</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${list != null }">
			<c:forEach var="eachService" items="${requestScope.list }">
				<tr>
					<td>
						${eachService.DESCRIPTION }
					</td>
					<td>
						${eachService.PRICE }
					</td>
					<td>
						${eachService.TIMEREQUIRED }
					</td>
				</tr>
			</c:forEach>	
		</c:if>
		</tbody>
		</table>
	</body>
    
    