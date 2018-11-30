$(document).ready(function(){
	"use strict";

/*=========== TABLE OF CONTENTS ===========
1. Scroll To Top 
2. slick carousel
3. welcome animation support
4. feather icon
5. counter
======================================*/
    // 1. Scroll To Top 
		$(window).on('scroll',function () {
			if ($(this).scrollTop() > 600) {
				$('.return-to-top').fadeIn();
			} else {
				$('.return-to-top').fadeOut();
			}
		});
		$('.return-to-top').on('click',function(){
				$('html, body').animate({
				scrollTop: 0
			}, 1500);
			return false;
		});
	
	// 2. swiper support
		//리뷰
		var coverflowSetting = {
			 slideShadows : true,
			 rotate : 50,
			 stretch: 0,
			 depth : 100,
			 modifier: 1,
		}
		var myswiper = null;

		function init(){
			if(myswiper != null) myswiper.destroy();
			
			myswiper = new Swiper('.swiper-container',{
				effect: 'coverflow',
				coverflowEffect : coverflowSetting,
				loop: true,
				
				autoplay: {
					delay: 0,
				},
				speed : 3000,
				
				navigation :{
					nextEl :'.swiper-button-next',
					prevEl :'.swiper-button-prev',
				},
				
				pagination :{
					el: '.swiper-pagination',
					clickable:true,
				},
			});
		}
		init();

		
    // 3. welcome animation support
        $(window).load(function(){
        	$(".welcome-hero-txt h2,.welcome-hero-txt p").removeClass("animated fadeInUp").css({'opacity':'0'});
            $(".welcome-hero-serch-box").removeClass("animated fadeInDown").css({'opacity':'0'});
        });

        $(window).load(function(){
        	$(".welcome-hero-txt h2,.welcome-hero-txt p").addClass("animated fadeInUp").css({'opacity':'0'});
            $(".welcome-hero-serch-box").addClass("animated fadeInDown").css({'opacity':'0'});
        });

	// 4. feather icon

		feather.replace();
});