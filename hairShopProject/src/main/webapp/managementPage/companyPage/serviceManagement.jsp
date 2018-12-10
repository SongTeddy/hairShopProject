<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.serviceListTable{
	width: 70%;
	color: black;
}
.serviceListTable th{
	font:bold; 
}
.btnDiv{
	width: 70%;
	color: black;
	text-align: right;
}
</style>
<body>
	<font size="6pt" style="color: #363636;">서비스 리스트</font><br>
	<hr align="left" style="color: black; margin-top: 10px; margin-bottom: 0px; width: 205px; border-top: 2px solid #5A5A5A;">
	<br>
	<div class="btnDiv" >
		<button class="btn btn-default" onclick="location.href='/hairShopProject/companyPage/serviceRegister.do'">서비스 등록</button>
		<button class="btn btn-default" id="deleteServiceBtn" >선택 서비스 삭제</button>
	</div>
		<form name="serviceDeleteForm" method="post" action="/hairShopProject/companyPage/serviceDeleted.do">
		<table class="table table-striped serviceListTable">
		<thead>
			<tr>
				<th><input type="checkbox" id="selectAllService" /></th>
				<th>
				<select name="serviceCategory" id="serviceCategory">
					<option value="" selected="selected">분류</option>					
					<option value="커트">커트</option>
					<option value="펌">펌</option>
					<option value="클리닉">클리닉</option>
					<option value="스타일링">스타일링</option>
					<option value="염색">염색</option>
				</select>
				</th>
				<th>서비스명</th>
				<th>이용 요금</th>
				<th>소요 시간</th>
			</tr>
		</thead>
		<tbody id="result">
		<c:if test="${list != null }">
			<c:forEach var="eachService" items="${requestScope.list }">
				<tr>
					<td>
						<input type="hidden" name="hairShopId" value="${eachService.HAIRSHOPID }">
						<input type="checkbox" name="descriptions" class="selectOne" value="${eachService.DESCRIPTION }"/>					
					</td>
					<td>
						${eachService.SERVICE }
					</td>
					<td>
						${eachService.DESCRIPTION }
					</td>
					<td class="priceTd">
						<fmt:formatNumber value="${eachService.PRICE }" type="number"/>원
					</td>
					<td>
						${eachService.TIMEREQUIRED }분
					</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
		</table>
		</form>
		<script type="text/javascript">		
		if('${serviceCategory}' != "") {
			$('#serviceCategory').val('${serviceCategory}');
		}
		
		$('#selectAllService').on('click', function(){
			if($('input#selectAllService').prop("checked")){
				$('input:checkbox[class="selectOne"]').prop('checked', true);
			}else {
				$('.selectOne:checked').each(function(index, item){
					item.checked=false;
				});
			}
		});
		
		
		$(".serviceListTable").on('change', '.selectOne', function(){
			var length = $(".selectOne").length;
			var c =0;
			$(".selectOne:checked").each(function (index, item) {
				c+=1;
			});
			if(!$(this).is(":checked")){
				$("#selectAllService").prop("checked", false);
			} else if(c==length){
				$("#selectAllService").prop("checked", true);
			}
		});
		
		$('#deleteServiceBtn').on('click', function(){
			var count = $('.selectOne').length;
			if(count>0){
				$('form[name=serviceDeleteForm]').submit();			
			} else{
				alert("삭제할 서비스를 선택해주세요.");
			}
		});
		
		$('#serviceCategory').on('change', function(){
			location.href = "/hairShopProject/companyPage/serviceManagement.do?serviceCategory=" + $('#serviceCategory option:selected').val();
		});
		
		</script>
		
	</body>
    
    