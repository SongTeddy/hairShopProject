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
		var designerid = $('.addDesignerid').val();
		var hairshopId = $('#hairshopId').val();
		var position = $('.addPosition').val();
		var dayoff = $('.addDayoff').val();
		
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/managementPage/designerAdd.do',
			data : {'designername':designername,
					'designerid':designerid,
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
		    	url : '/hairShopProject/managementPage/designerDelete.do',
		    	data : {'seq':$('#seq').val()},
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
				url : '/hairShopProject/managementPage/designerCheckedDelete.do',
				data : {ar:ar},
				success : function() {
					alert("삭제되었습니다");
					location.reload();
				}
			});
		}else
			alert("디자이너를 선택해주세요");
	});
	
	// 수정
	
	// 수정완료 버튼
	$('#designerTable').on('click', '.designerModify', function() {
		if (confirm("수정하시겠습니까?")==true){
			var seq = $('.seq').val();
			var designerimage = $('.designerimage').val();
			var designername = $('.designername').val();
			var designerid = $('.designerid').val();
			var position = $('.position').val();
			var dayoff = ($('.dayoff').val()).replace('월 ', '1')
											 .replace('화 ', '2')
											 .replace('수 ', '3')
											 .replace('목 ', '4')
											 .replace('금 ', '5')
											 .replace('토 ', '6')
											 .replace('일 ', '7');
			
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/managementPage/designerModify.do',
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
		var seq = $(this).attr('class');
		
		$('input[id='+seq+']').removeAttr('readonly').css('border', '1px solid #ABABAB');
		$('input[id=seq]').addClass('seq'); // seq 값을 가지고 있는 hidden에 클래스 추가
		$('input[class='+seq+']').val('수정완료');
		$('input[class='+seq+']').addClass('designerModify');
	});
});