$(document).ready(function() {
	$('#memberListTable').on('click', '.memberDeleteBtn', function() {
		if (confirm("정말 삭제하시겠습니까?")==true){
		    $.ajax({
		    	type : 'POST',
		    	url : '/hairShopProject/adminPage/memberDelete.do',
		    	data : {'email':$(this).attr('id')},
		    	success : function() {
		    		location.reload();
		    	}
		    });
		}else{
		    return;
		}
	});
	
	// 비밀번호 수정 버튼
	$('#memberListTable').on('click', '.memberModifyBtn', function() {
		// 모든 i태그, input태그, div태그 초기화
		$('#memberListTable div').removeClass('pwdModify');
		$('#memberListTable i:not(.memberDeleteBtn)').attr('class', 'fa fa-pencil');
		$('#memberListTable input').attr('readonly', 'readonly');
		$('.memberListForm')[0].reset()
		
		// 해당 i태그와 input태그의 속성을 변경
		$(this).children().attr('class', 'fa fa-check');
		$(this).prev().children().removeAttr('readonly').focus();
		
		// 해당 버튼에 클래스 추가
		$(this).addClass('pwdModify');
	});
	
	$('#memberListTable').on('click', '.pwdModify', function() {
		if (confirm("수정하시겠습니까?")==true){
		    $.ajax({
		    	type : 'POST',
		    	url : '/hairShopProject/adminPage/memberPwdModify.do',
		    	data : {'email':$(this).attr('id'), 'modifyPwd':$(this).prev().children().val()},
		    	success : function() {
		    		location.reload();
		    	}
		    });
		}else{
		    return;
		}
	});
});