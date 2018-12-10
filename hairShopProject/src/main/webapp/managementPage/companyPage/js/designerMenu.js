$(document).ready(function(){
	$('.designerAddToggle').on('click', function() {
		$('input[name=dayoff]').val("");
		$('#thisIsTitle').text("디자이너 등록");
		$('#designername').val("");
		$('#positioncode').val("");
		$('input[name=insertOrUpdate]').val("insert");
		for(var i=1; i<=7; i++){
	       		$('#' + i).attr("checked", true);
	    }
       	$('#doIt').html("등&emsp;&emsp;록");
		$('.dayOptionDiv').css('visibility', 'visible');
		$('.positioncode').css('visibility', 'visible');
		$('.fileUpload').css('visibility', 'visible');
		$('.designerMenu').stop().addClass('designerAdd');
	});
	
	$('.close').on('click', function() {
		$('.dayOptionDiv').css('visibility', 'hidden');
		$('.positioncode').css('visibility', 'hidden');
		$('.fileUpload').css('visibility', 'hidden');
		$('.designerMenu').stop().removeClass('designerAdd');
	});
	
	$('#selectAll').on('change', function(){
		if($('input#selectAll').prop("checked")){
			$('input:checkbox[class="selectOne"]').prop('checked', true);
		}else {
			$('.selectOne:checked').each(function(index, item){
				item.checked=false;
			});
		}
	});
	

	$("#designerTable").on('change', '.selectOne', function(){
		var length = $(".selectOne").length;
		var c =0;
		$(".selectOne:checked").each(function (index, item) {
			c+=1;
		});
		if(!$(this).is(":checked")){
			$("#selectAll").prop("checked", false);
		} else if(c==length){
			$("#selectAll").prop("checked", true);
		}
	 });
	
	
	/* 수정, 삭제 */
	
	// 선택 삭제
	$('#checkAllDelete').on('click', function() {
		var count = 0;
		var designerIds = [];
		$('input[class=selectOne]:checked').each(function(i) {
			designerIds.push($(this).val());
			count++
		});
		if(count>0) {
			if (confirm("정말 삭제하시겠습니까?")==true){
				$.ajax({
					type : 'POST',
					url : '/hairShopProject/companyPage/designerCheckedDelete.do',
					data : {designerIds:designerIds},
					dataType : 'json',
					success : function(data) {
						alert(JSON.stringify(data));
						var cannotDeleteDesingers ="";
						if(data.cannotDeletelist.length > 0){							
							for(var i=0; i<data.cannotDeletelist.length; i++){
								cannotDeleteDesingers = cannotDeleteDesingers + data.cannotDeletelist[i] + ", ";
							}
							alert("예약이 잡혀있는 디자이너인 " + cannotDeleteDesingers + "는 삭제할 수 없습니다.");
						}
						if(data.list.length > 0){
							alert("예약이 없는 디자이너 삭제가 완료되었습니다.");							
						}
						location.reload();
					}
				});
			}
		}else
			alert("디자이너를 선택해주세요.");
	});
});

