$(document).ready(function(){
	$('.perm').on('click',function(){
		$('.stylebook-body').empty();
		$.ajax({
			type : 'GET',
			url : '../stylebook/perm.do?perm='+"펌",
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, items){
					$('<div/>',{
						class : 'stylebook-section'
					}).append($('<div/>',{
						class : 'stylebook-image'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID
							}).append($('<img/>',{
								src : '/hairShopProject/storage/'+items.PERMIMAGE,
							}))
						)
					).append($('<div/>',{
						class : 'stylebook-subject'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : items.DISCRIPTION
						}))
					).append($('<div/>',{
						class : 'stylebook-hashTag'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : '#'+items.NAME
						}))
					).appendTo($('div.stylebook-body'));
				});
			}
		});
	});
	$('.cut').on('click',function(){
		$('.stylebook-body').empty();
		$.ajax({
			type : 'GET',
			url : '../stylebook/cut.do?cut='+"커트",
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, items){
					alert(items);
					$('<div/>',{
						class : 'stylebook-section'
					}).append($('<div/>',{
						class : 'stylebook-image'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID
							}).append($('<img/>',{
								src : '/hairShopProject/storage/'+items.CUTIMAGE
							}))
						)
					).append($('<div/>',{
						class : 'stylebook-subject'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : items.DISCRIPTION
						}))
					).append($('<div/>',{
						class : 'stylebook-hashTag'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : '#'+items.NAME
						}))
					).appendTo($('div.stylebook-body'));
				});
			}
		});
	});
	$('.style').on('click',function(){
		$('.stylebook-body').empty();
		$.ajax({
			type : 'GET',
			url : '../stylebook/style.do?style='+"스타일",
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, items){
					$('<div/>',{
						class : 'stylebook-section'
					}).append($('<div/>',{
						class : 'stylebook-image'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID
							}).append($('<img/>',{
								src : '/hairShopProject/storage/'+items.STYLEIMAGE
							}))
						)
					).append($('<div/>',{
						class : 'stylebook-subject'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : items.DISCRIPTION
						}))
					).append($('<div/>',{
						class : 'stylebook-hashTag'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : '#'+items.NAME
						}))
					).appendTo($('div.stylebook-body'));
				});
			}
		});
	});
	$('.dyeing').on('click',function(){
		$('.stylebook-body').empty();
		$.ajax({
			type : 'GET',
			url : '../stylebook/dyeing.do?dyeing='+"염색",
			dataType : 'json',
			success : function(data){
				$.each(data.list, function(index, items){
					$('<div/>',{
						class : 'stylebook-section'
					}).append($('<div/>',{
						class : 'stylebook-image'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID
							}).append($('<img/>',{
								src : '/hairShopProject/storage/'+items.DYEINGIMAGE
							}))
						)
					).append($('<div/>',{
						class : 'stylebook-subject'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : items.DISCRIPTION
						}))
					).append($('<div/>',{
						class : 'stylebook-hashTag'
						}).append($('<a/>',{
							href : '/hairShopProject/hairShop/hairShop_index.do?hairShopId='+items.HAIRSHOPID,
							text : '#'+items.NAME
						}))
					).appendTo($('div.stylebook-body'));
				});
			}
		});
	});
});
