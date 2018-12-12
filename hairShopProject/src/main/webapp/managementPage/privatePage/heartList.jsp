<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#cancel_heart {
	display:inline-block;
	font-size: 25pt;
	margin-left : 100px;
}
#cancel_heart:hover {
	cursor: pointer;
}
#searchResultTable {
	width:50%;
}
#searchResultTableBody td {
	width: 7%;
	padding: 10px;
}

#searchResultTableBody span {
	margin-left: 10px;
}
</style>

<font size="6pt" clss="modifyFormTitle" style="color: #363636;">관심 헤어샵</font><br>
<hr align="left" clss="modifyFormTitle" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 213px;
	    	  border-top: 2px solid #5A5A5A;"><br><br><br>
<div id="searchResultDiv" style="overflow-x:hidden; height: 100%; ">
	<table id="searchResultTable" class="table table-hover">
		<thead></thead>
		<tbody id="searchResultTableBody">
		</tbody>
	</table>
</div>
    
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/privatePage/getHeartList.do',
		dataType: 'json',
		success : function(data){
			if(data.heartListSize === 0) {
				$('<tr/>', {
					
				}).append($('<td/>',{
					
				}).append($('<div/>',{
					align : "center",
					text : "관심 헤어샵이 없습니다."
				}))).appendTo($('#searchResultTableBody'));
			} else {
				$.each(data.heartList, function(index, item){
					$('<tr/>', {
						id : index
					}).append($('<td/>',{
						
					}).append($('<div/>',{
						
					}).append($('<img/>',{
						src:'/hairShopProject/hairShop/img/banner/'+item.HAIRSHOPIMAGE1,
						alt:"explore image"
					})))).append($('<td/>',{
						
					}).append($('<div/>',{
						class:"single-explore-search-txt bg-theme-1"
					}).append($('<span/>',{
						
					}).append($('<a/>',{
						href: "javascript:moveTo('"+item.HAIRSHOPID+"');",
						html: item.NAME
					})).append($('<span/>',{
						class:"explore-rating",
						html : '<img src="/hairShopProject/hairShop/img/star2.png" style="width:13px; height:13px; padding-right: 2px;" />'+item.STARSCOPE
					})).append($('<span/>',{
						text:"Review "+item.REVIEWCOUNT,
					})).append($('<span/>',{
						html : "&times;",
						id : "cancel_heart",
						onclick : "cancel_heart('"+item.HAIRSHOPID+"');",
					}))).append($('<p/>',{
						class:"explore-rating-search-price"
					}).append($('<div/>',{
						class:"row",
						html : "<br/>"+item.ADDR+"<br/><br/>",
						style : "padding-left: 10%; width:100%;font-size:13pt"
					}).append($('<span/>',{
						class:"explore-price-box",
					}).append($('<span/>',{
						text:"영업시간    "
					})).append($('<span/>',{
						class:"close-btn open-btn",
						text:item.OPENTIME + "~" +item.CLOSETIME
					}))))))).appendTo($('#searchResultTableBody'));
				});
			}
		}
	});
});

function cancel_heart(hairShopId) {
	var memEmail = "<%=session.getAttribute("memEmail") %>";
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/deleteHeart.do',
		data : {'memEmail' : memEmail, 'hairShopId' : hairShopId},			
		dataType : 'json',
		success : function(data) {
			alert("좋아요 취소");
		}
	});
	location.reload();
}
function moveTo(hairShopId) {
	window.location.href = '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+hairShopId;
}
</script>