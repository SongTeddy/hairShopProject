/*$(document).ready(function(){
	$('.perm').on('click',function(){
		$.ajax({
			type : 'GET',
			url : '../stylebook/perm.do',
			success : function(data){
				$.each(data.list,function(index, items){
					$('<div/>',{
						class : 'style-section'
					}).append($('<div/>',{
						class : 'style-image',
						}).append($('<img/>',{
							src : '/hairShopProject/storage/'+items.PERMIMAGE
						}))
					).append($('<div/>',{
						class : 'stylebook-hashTag'
						}).append($('<a/>',{
							href : 'javascript:void(0)',
							text : items.DISCRIPTION
						}))
					).append($('<div/>',{
						
					})).
				});
			}
		});
	});
});*/