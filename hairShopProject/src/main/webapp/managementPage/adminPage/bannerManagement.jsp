<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style type="text/css">
#bannereResisterBtn{
	margin-left: 730px;
}
</style>

<body>
<form name="bannerRegisterForm" method="post" action="/hairShopProject/adminPage/bannerRegister.do">
<font size="6pt" style="color: #363636;">���  ����ϱ�</font><br><hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 205px;
		    	  border-top: 2px solid #5A5A5A;"><br>
<table  class="table table-striped eventRegisterTable">
	<tr>
		<td>��� ����</td>
		<td>
			<select id="bannerOption" name="bannerOption"></select>
		</td>
	</tr>
	<tr>
		<td id="btnId" colspan="2">
			<input type="submit" class="btn btn-default" id="bannereResisterBtn" value="��� ���">
			<input type="button" class="btn" value="���">
		</td>
	</tr>
</table>
</form>
<br/>
<script type="text/javascript">
$(document).ready(function(){
	//�̺�Ʈ ����Ʈ
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/banner_eventList.do',
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.eventList,function(index,items){
				$('<option value="'+items.EVENTBANNERIMAGE+'">'+items.EVENTSUBJECT+'</option>').appendTo($('#bannerOption'));
			});	
		},
		error : function(data){
			alert("error");
		}
	});
});
</script>
</body>

