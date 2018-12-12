<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form name="recommendHairshopForm" method="post" action="/hairShopProject/adminPage/recommendHairShopUpdate.do">
<table  class="table table-striped" >
	<tr>
		<td style="width:30%;">추천 헤어샵 선택</td>
		<td style="text-align:right;">
			<span>
				<select id="recommendHairShopSelect" name="recommendHairShopSelect" multiple style="width:100%;height:300px;">
					<c:forEach var="list" items="${recommendHairShopList }">
						<option value=${list.HAIRSHOPID }>${list.HAIRSHOPID }</option>
					</c:forEach>
				</select>
			</span>
		</td>
	</tr>
	<tr>
		<td id="btnId" colspan="2" style="text-align:right;">
			<input type="button" class="btn btn-default" id="recommendHairShopResisterBtn" value="추천 헤어샵 등록">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('#recommendHairShopResisterBtn').on('click',function(){
		if($('select#recommendHairShopSelect option:selected').length ==6) {
			$('form[name=recommendHairshopForm]').submit();	
		} else {
			alert('헤어샵 6곳을 선택해 주세요.');
		}
	});	
	
});
</script>