<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/companyPage/css/stylebookManagement.css">

<input type="hidden" class="stylebookMenagement-hairShopId" value="${hairShopId }">

<font size="6pt" clss="modifyFormTitle" style="color: #363636;">스타일 찾기 추가 | 관리</font><br>
<hr align="left" clss="modifyFormTitle" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 340px;
	    	  border-top: 2px solid #5A5A5A;"><br>
<div class="stylebookMenagementFormDiv">
</div>

<script>
$(document).ready(function(){
	alert($('.stylebookMenagement-hairShopId').val());
	$.ajax({
		type : 'POST',
		url : '../companyPage/getStylebookImage.do',
		data : {'hairShopId':$('.stylebookMenagement-hairShopId').val()},
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<div/>',{
					class : 'stylebookMenagement-section'
				}).append($('<div/>',{
					class : 'stylebookMenagement-image'
					}).append($('<img/>',{
						src : '/hairShopProject/storage/'+items.PERMIMAGE
					}))
				).append($('<div/>',{
					class : 'stylebookMenagement-subject'
					}).append($('<span/>',{
						text : items.DISCRIPTION
					}))
				).append($('<div/>',{
					class : 'stylebookMenagement-hairShopName'
					}).append($('<span/>',{
						text : items.NAME
					}))
				).appendTo($('div.stylebookMenagementFormDiv'));
			});
		}
	});
});
</script>