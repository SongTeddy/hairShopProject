<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<body>
<div align="center" style="padding: 100px;">

<font size="30" color="black">������ �Ϸ� �Ǿ����ϴ�.</font>
<div style="padding: 100px;">
<button class="btn btn-lg btn-info" id="reserveCheckBtn">���� ���� Ȯ���ϱ�</button>
</div>
</div>
<script type="text/javascript">
	$('#reserveCheckBtn').on('click', function(){
		location.href='/hairShopProject/privatePage/reservationForm.do';
	});

</script>
</body>
