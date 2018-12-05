<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/privatePage/css/memberPage.css">
<form name="reservationForm" method="post">
<div class="reservationForm">
	<div class="reservationTitle">
		<h3>예약 안내</h3>
	</div><br><br>
	<div class="reservationTableDiv">
		<table class="reservationTable">
			<thead> 
				<tr>
					<td width="150px" align="center">헤어샾</td>
					<td width="130px" align="center">디자이너</td>
					<td width="100px" align="center">서비스</td>
					<td width="170px" align="center">상세서비스</td>
					<td width="100px" align="center">가격</td>
					<td width="500px" align="center">날짜</td>
					<td width="100px" align="center">예약취소</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
<input type="hidden" name="memEmail" class="reservationEmail" value="${memEmail}">
</form>
<script src="js/memberPage.js"></script>
<script>
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};
</script>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '../privatePage/reservation.do',
		data : {'email':$('.reservationEmail').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				var startTime = new Date(items.STARTTIME).format("yyyy-MM-dd a/p hh:mm");
				var endTime = new Date(items.ENDTIME).format("yyyy-MM-dd a/p hh:mm");
				var reservationCancelButton = document.createElement("a");
				
				reservationCancelButton.innerHTML='<input type="button" class="reservationCheck" value="예약취소">'
				
				if(new Date() < items.STARTTIME && items.DIDORDIDNOT==0){
					$('<tr/>').append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						text : items.NAME
					})).append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						text : items.DESIGNERNAME
					})).append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						text : items.SERVICE
					})).append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						text : items.DESCRIPTION
					})).append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						text : items.PRICE.toLocaleString()+"원"
					})).append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						text : startTime+" ~ "+endTime
					})).append($('<td/>',{
						style : 'font-size:12pt; font-weight:initial;',
						html : reservationCancelButton
					})).appendTo($('tbody'));
				}
			});
		}
	});
});
</script>