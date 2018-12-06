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
<font size="6pt" style="color: #363636;">이벤트  리스트</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 235px;
		    	  border-top: 2px solid #5A5A5A;"><br>

	<table class="table table-striped eventListTable">
	<thead>
		<tr>
			<th><input type="checkbox" id="selectAll"/></th>
			<th>번호</th>
			<th>이벤트 제목</th>
			<th>이벤트 배너 이미지</th>
			<th>이벤트 상세 이미지</th>
			<th rowspan="2">이벤트 기간</th>
			<th>쿠폰 정보</th>
			<th>쿠폰 이미지</th>
		</tr>
	</thead>
	<tbody id="eventListTbody">
	
	
	
	</tbody>
	</table>
	<div class="btnDiv">
		<input type="button" class="btn btn-default" id="deleteThisEvent" value="이벤트 삭제">
		<input type="button" class="btn btn-default" id="modifyThisEvent" value="이벤트 수정">
	</div>
</form>
	
</body>
