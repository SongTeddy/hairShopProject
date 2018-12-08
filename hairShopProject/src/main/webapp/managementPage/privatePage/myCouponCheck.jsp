<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
img.events:hover {
	cursor:pointer;
}
.fancyTab {
	text-align: center;
	vertical-align: middle;
	padding: 15px 0;
	background-color: #eee;
	box-shadow: 0 0 0 1px #ddd;
	height: 70px;
	top: 15px;
	transition: top .2s;
}

.fancyTab.active {
	height: 70px;
	transition: height .2s;
	font-weight: bold;
}

.whiteBlock {
	display: none;
}

.fancyTab.active .whiteBlock {
	display: block;
	/* 		  height:2px;
 */
	bottom: -2px;
	background-color: #fff;
	width: 99%;
	position: absolute;
	z-index: 1;
}

.fancyTab a {
	font-family: 'Source Sans Pro';
	font-size: 1.65em;
	font-weight: 300;
	transition: .2s;
	color: #333;
}

/*.fancyTab .hidden-xs {
		  white-space:nowrap;
		}*/
.fancyTabs {
	border-bottom: 2px solid #ddd;
	margin: 15px 0 0;
}

li.fancyTab a {
	padding-top: 15px;
	top: -15px;
	padding-bottom: 0;
}

li.fancyTab.active a {
	/* 		  padding-top: inherit; */
	
}

.fancyTab .fa {
	font-size: 40px;
	width: 100%;
	padding: 15px 0 5px;
	color: #666;
}

.fancyTab.active .fa {
	color: #cfb87c;
}

.fancyTab a:focus {
	outline: none;
}

.fancyTabContent {
	border-color: transparent;
	box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
	padding: 30px 15px 15px;
	position: relative;
	background-color: #fff;
	text-align: center;
}

.nav-tabs>li.fancyTab.active>a, .nav-tabs>li.fancyTab.active>a:focus,
	.nav-tabs>li.fancyTab.active>a:hover {
	border-width: 0;
}

.nav-tabs>li.fancyTab:hover {
	background-color: #f9f9f9;
	box-shadow: 0 0 0 1px #ddd;
}

.nav-tabs>li.fancyTab.active:hover {
	background-color: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd
		inset;
}

.nav-tabs>li.fancyTab:hover a {
	border-color: transparent;
}

.nav.nav-tabs .fancyTab a[data-toggle="tab"] {
	background-color: transparent;
	border-bottom: 0;
}

.nav-tabs>li.fancyTab:hover a {
	border-right: 1px solid transparent;
}

.nav-tabs>li.fancyTab>a {
	margin-right: 0;
	border-top: 0;
	padding-bottom: 30px;
	margin-bottom: -30px;
}

.nav-tabs>li.fancyTab {
	margin-right: 0;
	margin-bottom: 0;
}

.nav-tabs>li.fancyTab:last-child a {
	border-right: 1px solid transparent;
}

.nav-tabs>li.fancyTab.active:last-child {
	border-right: 0px solid #ddd;
	box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
}

.fancyTab:last-child {
	box-shadow: 0 0 0 1px #ddd;
}

.tabs .nav-tabs li.fancyTab.active a {
	box-shadow: none;
	top: 0;
}

.fancyTab.active {
	background: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd
		inset;
	padding-bottom: 30px;
}

.arrow-down {
	display: none;
	width: 0;
	height: 0;
	border-left: 20px solid transparent;
	border-right: 20px solid transparent;
	border-top: 22px solid #ddd;
	position: absolute;
	top: -1px;
	left: calc(10% - 20px);
}

.arrow-down-inner {
	width: 0;
	height: 0;
	border-left: 18px solid transparent;
	border-right: 18px solid transparent;
	border-top: 12px solid #fff;
	position: absolute;
	top: -22px;
	left: -18px;
}

.fancyTab.active .arrow-down {
	display: block;
}

@media ( max-width : 1200px) {
	.fancyTab .fa {
		font-size: 36px;
	}
	.fancyTab .hidden-xs {
		font-size: 22px;
	}
}

@media ( max-width : 992px) {
	.fancyTab .fa {
		font-size: 33px;
	}
	.fancyTab .hidden-xs {
		font-size: 13px;
		font-weight: normal;
	}
}

@media ( max-width : 768px) {
	.fancyTab>a {
		font-size: 18px;
	}
	.nav>li.fancyTab>a {
		padding: 15px 0;
		margin-bottom: inherit;
	}
	.fancyTab .fa {
		font-size: 30px;
	}
	.nav-tabs>li.fancyTab>a {
		border-right: 1px solid transparent;
		padding-bottom: 0;
	}
	.fancyTab.active .fa {
		color: #333;
	}
}
div {
	outline : none !important;
}
</style>	
<div class="container tab-div" style="width: 60%; ">
	<section id="fancyTabWidget" class="tabs t-tabs">
		<ul class="nav nav-tabs fancyTabs" role="tablist">
			<li class="tab fancyTab active" id="li-tab0">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>사용가능한 쿠폰</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
			<li class="tab fancyTab" id="li-tab1" style="">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>만료된 쿠폰</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content fancyTabContent"
			aria-live="polite" >
			<div class="tab-pane fade active in" id="tabBody0" role="tabpanel"
				aria-labelledby="tab0" aria-hidden="false" tabindex="0" style="padding:0px; width:100%;">
			</div>
			<div class="tab-pane  fade" id="tabBody1" role="tabpanel"
				aria-labelledby="tab1" aria-hidden="true" tabindex="0">
			</div>
		</div>
	</section>
</div>
 <script type="text/javascript" >
function addBannerAddress(address) {
	var addr = new String("/hairShopProject/main/assets/images/event/");
	return addr = addr + address;
}
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/privatePage/getMyCouponCheck.do',
		dataType: 'json',
		success: function(data){
			//사용가능 쿠폰
			var couponLength = 0;
			var couponListLength =0;
			var endCouponListLength =0;
			if(data.couponList.length != 0) {
				$.each(data.couponList,function(index,item){
					var addr = addBannerAddress(item.COUPONIMAGE);
					$('<div/>',{
						class : "col-md-offset-2 col-md-8",
						style : "width:80%; right:7%; border-bottom: 0.5px solid gray;",
						html : 	'<div class="section-heading" >' +
								'<img src="'+addr+'" class="events" onclick="eventView('+item.SEQ+')" />' + 
								'</div>'
					}).appendTo($('div#tabBody0'));
					couponListLength = index;
				});
			} else {
				$('<span/>',{
					text : "사용 가능한 쿠폰이 없습니다 ㅠ.ㅠ"
				}).appendTo($('div#tabBody0'));
			}
			//만료된 쿠폰 
			if(data.endCouponList.length != 0) {
				$.each(data.endCouponList,function(index,item){
					var addr = addBannerAddress(item.COUPONIMAGE);
					$('<div/>',{
						class : "col-md-offset-2 col-md-8",
						style : "width:80%; right:7%; border-bottom: 0.5px solid gray;",
						html : 	'<div class="section-heading">' +
								'<img src="'+addr+'" class="events" onclick="endEventView('+item.SEQ+')" style="width:100%;"/>'+ 
								'</div>'
					}).appendTo($('div#tabBody1'));
					endCouponListLength = index;
				});
			}
			if(couponListLength > endCouponListLength) couponLength = couponListLength+1;
			else couponLength = endCouponListLength+1;
			$('div#myTabContent').height(250*couponLength);
		}, error : function() {
			alert("쿠폰리스트 에러");
		}
	});
	$('.fancyTabs').each(function() {
		var highestBox = 0;
		$('.fancyTab a', this).each(function() {
			if ($(this).height() > highestBox) highestBox = $(this).height();
		});
		$('.fancyTab a', this).height(highestBox);
	});
	var numItems = $('li.fancyTab').length;
	if (numItems == 2){
		$("li.fancyTab").width('50%');
	}
});
</script>