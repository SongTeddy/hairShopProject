<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<body>
<div align="center" style="padding: 100px;">

<font size="30" color="black">예약이 완료 되었습니다.</font>
<div style="padding: 100px;">
<button class="btn btn-lg btn-info" id="reserveCheckBtn">나의 예약 확인하기</button>
</div>
</div>
<script type="text/javascript">
	$('#reserveCheckBtn').on('click', function(){
		location.href='/hairShopProject/privatePage/reservationForm.do';
	});

</script>
</body>
