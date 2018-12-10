$(document).ready(function(){
	$('.designerAddToggle').on('click', function() {
		$('.designerMenu').stop().addClass('designerAdd');
	});
	
	$('.close').on('click', function() {
		$('.designerMenu').stop().removeClass('designerAdd');
	});
	
	$("#checkAll").on('click', function() {
		if($("#checkAll").is(":checked")){
			$("input[id=checkbox]").prop('checked', true);
        }else{
        	$("input[id=checkbox]").prop('checked', false);
        }
	});
	
	/* 추가 */
	$('#designerAdd').on('click', function() {
		var designername = $('.addDesignername').val();
		var hairshopId = $('#hairshopId').val();
		var position = $('.addPosition').val();
		var dayoff = $('.addDayoff').val();
		
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/companyPage/designerAdd.do',
			data : {'designername':designername,
					'hairshopid':hairshopId,
					'position':position,
					'dayoff':dayoff},
			success : function() {
				location.reload();
			}
		});
	});
	
	/* 수정, 삭제 */
	
	// 삭제
	$('#designerTable').on('click', '.designerDelete', function() {
		if (confirm("정말 삭제하시겠습니까?")==true){
		    $.ajax({
		    	type : 'POST',
		    	url : '/hairShopProject/companyPage/designerDelete.do',
		    	data : {'seq':$(this).parent().prev().prev().prev().prev().prev().prev().children().val()},
		    	success : function() {
		    		location.reload();
		    	}
		    });
		}else{
		    return;
		}
	});
	
	// 선택 삭제
	$('#checkAllDelete').on('click', function() {
		var count = 0;
		var ar = [];
		
		$('input[id=checkbox]:checked').each(function(i) {
			ar.push($(this).val());
			count++
		});
		
		if(count>0) {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/companyPage/designerCheckedDelete.do',
				data : {ar:ar},
				success : function() {
					alert("삭제되었습니다");
					location.reload();
				}
			});
		}else
			alert("디자이너를 선택해주세요");
	});
	
	// 수정완료 버튼
	$('#designerTable').on('click', '.designerModify', function() {
		if (confirm("수정하시겠습니까?")==true){
			var seq = $(this).parent().parent().prev().prev().prev().prev().prev().prev().children().val();
			var designerimage = $(this).parent().parent().prev().prev().prev().prev().prev().children().val();
			var designername = $(this).parent().parent().prev().prev().prev().prev().children().val();
			var designerid = $(this).parent().parent().prev().prev().prev().children().val();
			var position = $(this).parent().parent().prev().prev().children().val();
			var dayoff = ($(this).parent().parent().prev().children().val()).replace('월 ', '1')
											 .replace('화 ', '2')
											 .replace('수 ', '3')
											 .replace('목 ', '4')
											 .replace('금 ', '5')
											 .replace('토 ', '6')
											 .replace('일 ', '7');
			
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/companyPage/designerModify.do',
				data : {'designerimage':designerimage,
						'designername':designername,
						'designerid':designerid,
						'position':position,
						'dayoff':dayoff,
						'seq':seq},
				success : function() {
					location.reload();
				}
			});
		}else{
		    return;
		}
	});
	
	// 수정 버튼
	$('#designerTable').on('click', '#designerModify', function() {
		//alert($('#designerTable input[type=text]').val());
		$('#designerTable input[type=text]').attr('readonly', 'readonly');
		var seq = $(this).attr('class');
		
		// 모든 input의 readonly 삭제하고 border 설정
		$('input[id='+seq+']').removeAttr('readonly').css('border', '1px solid #ABABAB');
		$('input[id=seq]').addClass('seq'); // seq 값을 가지고 있는 hidden에 클래스 추가
		$('button[class='+seq+']') // 수정버튼
			.text('')
			.addClass('designerModify')
			.css('border-right', '1px solid #484848')
			.append($('<i/>', {
				class : 'fa fa-check'
			}));
		
		$(this).parent().css('width', '50%').after($('<div/>', {
			class: 'designerModifyCancelDiv',
			style: 'float: left; width: 50%; height: 50%; border-bottom: 1px solid #484848;'
				
			}).append($('<button/>', {
				type : 'button',
				id : 'designerModifyCancel',
				class : seq,
				style : 'width: 100%; height: 100%;'
		
			}).append($('<i/>', {
				class : 'fa fa-times'
					
		}))));
	});
	
	// 수정 취소 버튼
	$('#designerTable').on('click', '#designerModifyCancel', function() {
		var seq = $(this).attr('class');
		
		$('input[id='+seq+']').attr('readonly', 'readonly').css('border', '0px');
		$('button[class='+seq+']').remove('i');
		$(this).parent().prev().children().text('수정').css('border-right', '0px').removeClass('designerModify');
		$(this).parent().prev().css('width', '100%');
		$(this).parent().remove();
	});
});