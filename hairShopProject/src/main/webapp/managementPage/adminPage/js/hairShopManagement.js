$(document).ready(function() {
	// 헤어샵 리스트 토글
	$('.hairShopManagement').on('click', '.hairShopListToggle', function() {
		var hairShopName = $(this).parent().parent().parent().parent().attr('id');

		$('.hairShopManagement .'+hairShopName).slideToggle(400);
	});
	
	// 헤어샵 삭제 버튼
	$('.hairShopManagement').on('click', '.hairShopDeleteBtn', function() {
		if (confirm("정말 삭제하시겠습니까?")==true){
		    $.ajax({
		    	type : 'POST',
		    	url : '/hairShopProject/adminPage/hairShopDelete.do',
		    	data : {'email':$(this).attr('id')},
		    	success : function() {
		    		location.reload();
		    	}
		    });
		}else{
		    return;
		}
	});
	
	// 헤어샵 수정 버튼
	$('.hairShopManagement').on('click', '.hairShopModifyBtn', function() {
		// 모든 i태그, input태그, div태그 초기화
		if($(this).children().attr('class')!='fa fa-check')
			$('.hairShopListForm')[0].reset()
		$('.hairShopManagement div').removeClass('pwdModify');
		$('.hairShopManagement i:not(.hairShopDeleteBtn)').attr('class', 'fa fa-pencil');
		$('.hairShopManagement input').attr('readonly', 'readonly');
		
		// 해당 i태그와 input태그의 속성을 변경
		$(this).children().attr('class', 'fa fa-check');
		$(this).prev().children().removeAttr('readonly').focus();
		
		// 해당 버튼에 클래스 추가
		$(this).addClass('pwdModify');
	});
	
	// 헤어샵 수정 완료
	$('.hairShopManagement').on('click', '.pwdModify', function() {
		if (confirm("수정하시겠습니까?")==true){
			$.ajax({
		    	type : 'POST',
		    	url : '/hairShopProject/adminPage/hairShopPwdModify.do',
		    	data : {'email':$(this).children().attr('id'), 'modifyPwd':$(this).prev().children().val()},
		    	async: false,
		    	success : function() {
		    		location.reload();
		    	}
			});
		}else{
		    return;
		}
	});
});