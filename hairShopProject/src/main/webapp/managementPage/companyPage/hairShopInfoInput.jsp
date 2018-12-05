<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- timepicker css -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<style>
.openTimePicker, .closeTimePicker{
	text-align: center;

}
.ui-corner-all{
	font-size: 8pt !important;
	text-align: left !important; 
	width: 90%  !important;
}
.infoTableDiv{
/* 	padding-top: 5%; */
}

.hairShopInfoTable{
	width: 70%;
	color: black;
}
.btnDiv{
	width: 70%;
	color: black;
	text-align: right;
}

#addr1, #addr2{
	margin-top: 5px;
}
</style>
<body>
<div class="infoTableDiv">
<form name="hairShopInfoUpdateForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/companyPage/hairShopInfoUpdate.do">
	<font size="6pt" style="color: #363636;">${map.NAME }의 등록 정보</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 315px;
		    	  border-top: 2px solid #5A5A5A;"><br>
		    	  
	<table class="table table-striped hairShopInfoTable" id="">		
		<tr>
			<td>상호명</td>
			<td><input type="text" name="name" value="${map.NAME }" size="24"/></td>
		</tr>
		<tr>
			<td style="height: 70px;">사업자 등록 번호</td>
			<td>
				<input type="text" name="license1" maxlength="3" size="3" /> -
				<input type="text" name="license2" maxlength="2" size="2" /> -
				<input type="text" name="license3" maxlength="5" size="5" />
				&nbsp;<input type="button" id="licenseCheckBtn" onclick="checkLicense()" value=" 확인 " />
			<br/><span id="licenseCheckSpan"></span>
			</td>
		</tr>
		<tr>
			<td>사업지 주소</td>   <!-- 주소 등록시에, 경도 위도 데이터도 함께 insert -->
			<td>
				<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly="readonly" size="8" value="${map.ZIPCODE }">
				&nbsp;<input type="button" onclick="findPostcode()" value=" 우편번호 찾기 "><br/>
				<input type="text" name="addr1" id="addr1" placeholder="주소" readonly="readonly" size="45" value="${map.ADDR1 }" /><br/>
				<input type="text" name="addr2" id="addr2" placeholder="상세주소" size="30" value="${map.ADDR2 }" />
			</td>
		</tr>
		<tr>
			<td>전화 번호</td>
			<td><select name="tel1" style="height:25px;">
					<option value="010" selected="selected" >010</option>
					<option value="011">011</option>
					<option value="010">016</option>
					<option value="010">019</option>
					<option value="010">02</option>
					<option value="010">031</option>
					<option value="010">031</option>
					<option value="010">033</option>
					<option value="010">041</option>
					<option value="010">042</option>
					<option value="010">043</option>
					<option value="010">044</option>
					<option value="010">051</option>
					<option value="010">052</option>
					<option value="010">053</option>
					<option value="010">054</option>
					<option value="010">055</option>
					<option value="010">061</option>
					<option value="010">062</option>
					<option value="010">063</option>
					<option value="010">064</option>
					<option value="010">070</option>
				</select> -
				<input type="tel" name="tel2" size="4" maxlength="5" value="${map.TEL2 }" /> -
				<input type="tel" name="tel3" size="4" maxlength="5" value="${map.TEL3 }" />
			</td>
		</tr>
		<tr>
			<td>헤어샵 소개글</td>
			<td><input type="text" name="hairShopContent" size="45" maxlength="30" placeholder="30자 이내로 작성해주세요." value="${map.HAIRSHOPCONTENT }" /></td>
		</tr>
		<tr>
			<td style="height: 70px;">헤어샵 아이디</td>
			<td><input type="text" name="hairShopId" id="hairShopId">
			&nbsp;<input type="button" id="hairShopIdCheckBtn" onclick="checkId()" value=" 중복 확인 " />
			<br/><span id="checkIdSpan"></span></td>
		</tr>
		<tr>
			<td>영업 시간</td>
			<td>
			월 <input type="checkbox" id="2" value="2" />
			&emsp;화 <input type="checkbox" id="3" value="3" />
			&emsp;수 <input type="checkbox" id="4" value="4" />
			&emsp;목 <input type="checkbox" id="5" value="5" />
			&emsp;금 <input type="checkbox" id="6" value="6" />
			&emsp;<span style="color: blue;">토</span> <input type="checkbox" id="7" value="7" />
			&emsp;<span style="color: red;">일</span> <input type="checkbox" id="1" value="1" />
			<br/>
			<input class="openTimePicker" name="openTime" size="5" readonly="readonly" />
			~ <input class="closeTimePicker" name="closeTime" size="5" readonly="readonly" />
		</tr>
		<tr>
			<td style="height: 70px;">
			<span>헤어샵 이미지</span><br/>
			<span style="font-size: 8pt;">최대 3개 등록 가능합니다.</span><br/>
			</td>
			<td>				
				<span id="imageSpan"></span><br/>
				<div id="image1" style="display: inline-block; margin-right: 10px;"></div>
				<div id="image2" style="display: inline-block;"></div>
				<div id="image3" style="display: inline-block;"></div>
				<input type="file" name="imageUpload[]" id="imageUpload" multiple="multiple" />
			</td>
		</tr> 
	</table>
	<input type="hidden" name="latitud" value="0"/>
	<input type="hidden" name="longitude"  value="0"/>
	<input type="hidden" name="dayoff" />
	<div class="btnDiv">
		<input type="button" class="btn btn-default" id="hairShopInfoUpdateBtn" value="정보 수정">
		<input type="button" class="btn" value="취소">
	</div>
</form>

<input type="hidden" id="checkedId" value="${map.HAIRSHOPID }" />
<input type="hidden" id="checkedLicense1" />
<input type="hidden" id="checkedLicense2" />
<input type="hidden" id="checkedLicense3" />

</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bdcc4d7ca1e01a2e5d822a148f1f8aa&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

$('.openTimePicker').timepicker({
    timeFormat: 'HH:mm',
    interval: 30,
    minTime: '7',
    maxTime: '23:00pm',
    defaultTime: '10',
    startTime: '7:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});

$('.closeTimePicker').timepicker({
    timeFormat: 'HH:mm',
    interval: 30,
    minTime: '7',
    maxTime: '23:00pm',
    defaultTime: '20',
    startTime: '7:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});


// 데이터 들어있으면 뿌려주기
if('${map.HAIRSHOPID }' != ""){
	$('input[name=hairShopId]').val('${map.HAIRSHOPID }');
	$('input[name=hairShopId]').prop('readonly', true);
	$('input[name=hairShopId]').attr('readonly', true);
	
	$('#hairShopIdCheckBtn').attr('disabled', true);
}
if('${map.LICENSE1 }' != ""){
	$('input[name=license1]').val('${map.LICENSE1 }');
	$('#checkedLicense1').val('${map.LICENSE1 }');
	$('input[name=license1]').prop('readonly', true);
	$('input[name=license1]').attr('readonly', true);
	
	$('input[name=license2]').val('${map.LICENSE2 }');
	$('#checkedLicense2').val('${map.LICENSE2 }');
	$('input[name=license2]').prop('readonly', true);
	$('input[name=license2]').attr('readonly', true);
	
	$('input[name=license3]').val('${map.LICENSE3 }');
	$('#checkedLicense3').val('${map.LICENSE3 }');
	$('input[name=license3]').prop('readonly', true);
	$('input[name=license3]').attr('readonly', true);
	
	$('#licenseCheckBtn').attr('disabled', true);
}

if('${map.DAYOFF}' != ""){
	var dayoff = '${map.DAYOFF}';
	for(var i=1; i<8; i++){
		if(dayoff.includes(i))
			$('#'+i).prop("checked", true);			
	}
}else{
	for(var i=1; i<8; i++){
		$('#'+i).prop("checked", true);			
	}
}

if('${map.TEL1}'!= "")
	$('select[name=tel1]').val('${map.TEL1}');
	
if('${map.OPENTIME }' != "")
	$('input[name=openTime]').val('${map.OPENTIME }');

if('${map.CLOSETIME }' != "")
	$('input[name=closeTime]').val('${map.CLOSETIME }');



if('${map.HAIRSHOPIMAGE1 }' != ""){
	$('#imageSpan').text("현재 등록된 이미지");
	$('<img/>', {
		width : '50',
		src : '/hairShopProject/storage/${map.HAIRSHOPIMAGE1 }'
	}).appendTo($('div#image1'));
}
if('${map.HAIRSHOPIMAGE2 }' != ""){
	$('<img/>', {
		width : '50',
		src : '/hairShopProject/storage/${map.HAIRSHOPIMAGE2 }'
	}).appendTo($('div#image2'));
}
if('${map.HAIRSHOPIMAGE3 }' != ""){
	$('<img/>', {
		width : '50',
		src : '/hairShopProject/storage/${map.HAIRSHOPIMAGE3 }'
	}).appendTo($('div#image3'));
}



$(document).ready(function(){
	
	var geocoder = new daum.maps.services.Geocoder();
	survey($('input[name=addr1]'), function(){ 
		// 주소-좌표 변환 객체를 생성합니다
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('input[name=addr1]').val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		    	 var latitud = result[0].y; //위도
		    	 var longitude = result[0].x; //경도
		    	 alert(latitud + "  "+longitude);
		    	 $('input[name=latitud]').val(latitud + "");
		    	 $('input[name=longitude]').val(longitude + "");
		    	 alert("인풋에 들어갔나요"+$('input[name=longitude]').val());
		    	 alert("인풋에 들어갔나요"+$('input[name=latitud]').val());
		     }else{
		    	 alert("위도 경도 검색 실패!");
		     }
		});
	});
	
	var checkedDay = "";
	// 정보 수정 버튼 누르면, 유효성 검사 후 submit
	$('#hairShopInfoUpdateBtn').on('click', function(){
		for(var i=1; i<8; i++){
			if($('#'+i).is(':checked'))
				checkedDay = checkedDay + $('#'+i).val();
		}
		alert("붙었니" + checkedDay);
		$('input[name=dayoff]').val(checkedDay);
		checkedDay = "";
		
		if($('input[name=name]').val()=="") 
			alert("상호명을 입력하세요.");
		else if($('input[name=license1]').val() != $('#checkedLicense1').val() || $('input[name=license2]').val() != $('#checkedLicense2').val() || $('input[name=license3]').val() != $('#checkedLicense3').val())
			alert("사업자 등록번호를 확인하세요.");
		else if($('input[name=license1]').val() == "" || $('input[name=license2]').val() == "" || $('input[name=license3]').val() == "")
			alert("사업자 등록번호를 확인하세요.");
		else if($('input[name=addr1]').val() == "")
			alert("주소를 등록하세요.");
		else if($('input[name=hairShopId]').val() != $('#checkedId').val() || $('input[name=hairShopId]').val()=="")
			alert("헤어샵 아이디를 중복 확인하세요.");
		else if($('input[name=hairShopId]').val() == "")
			alert("헤어샵 아이디를  등록하세요.");
		else if($('input[name=dayoff]').val()== "")
			alert("영업 시간을 등록해주세요.");
		else {
			if($('#imageUpload').get(0).files.length < 4 ){
				alert("서밋하러 갑시다");
				$('form[name=hairShopInfoUpdateForm]').submit();				
			} else 
				alert("이미지 파일은 최대 3개까지 업로드 가능합니다.");
		}
	});
});

	function chkWorkNumb(strNumb) {
		strNumb = replace(strNumb, "-");
		if (strNumb.length != 10) {
			$('#licenseCheckSpan').text("사업자등록번호가 유효하지 않습니다.").css('color', 'red').css('font-weight', 'bold').css('font-size', '8pt');
			return false;
		}

		sumMod = 0;
		sumMod += parseInt(strNumb.substring(0, 1));
		sumMod += parseInt(strNumb.substring(1, 2)) * 3 % 10;
		sumMod += parseInt(strNumb.substring(2, 3)) * 7 % 10;
		sumMod += parseInt(strNumb.substring(3, 4)) * 1 % 10;
		sumMod += parseInt(strNumb.substring(4, 5)) * 3 % 10;
		sumMod += parseInt(strNumb.substring(5, 6)) * 7 % 10;
		sumMod += parseInt(strNumb.substring(6, 7)) * 1 % 10;
		sumMod += parseInt(strNumb.substring(7, 8)) * 3 % 10;
		sumMod += Math.floor(parseInt(strNumb.substring(8, 9)) * 5 / 10);
		sumMod += parseInt(strNumb.substring(8, 9)) * 5 % 10;
		sumMod += parseInt(strNumb.substring(9, 10));

		if (sumMod % 10 != 0) {
			$('#licenseCheckSpan').text("사업자등록번호가 유효하지 않습니다.").css('color', 'red').css('font-weight', 'bold').css('font-size', '8pt');
			return false;
		}
		return true;
	}
	
	function replace(strString, strChar) {
		var strTmp = "";
		for (i = 0; i < strString.length; i++) {
			if (strString.charAt(i) != strChar) {
				strTmp = strTmp + strString.charAt(i);
			}
		}
		return strTmp;
	}
	
	
	function checkLicense(){
		if(chkWorkNumb($('input[name=license1]').val()+$('input[name=license2]').val()+$('input[name=license3]').val())){
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/companyPage/checkLicense.do',
				data : {'license1' :  $('input[name=license1]').val(), 'license2' :  $('input[name=license2]').val(), 'license3' :  $('input[name=license3]').val()},
				dataType : 'text',
				success : function(data){
					if(data.trim()=='exist'){
						$('#licenseCheckSpan').text("이미 등록된 사업자 등록번호입니다.").css('color', 'red').css('font-weight', 'bold').css('font-size', '8pt');						
					}else if(data.trim()=='not_exist'){
						licenseChecker = 1;
						$('#licenseCheckSpan').text("사업자 등록번호가 확인되었습니다.").css('color', 'blue').css('font-weight', 'bold').css('font-size', '8pt');	
						$('#checkedLicense1').val($('input[name=license1]').val());
						$('#checkedLicense2').val($('input[name=license2]').val());
						$('#checkedLicense3').val($('input[name=license3]').val());
					}
				},
				error : function(){
					alert("사업자등록번호 중복 췤 실패!");
				}
			});
		}
	}
	
	function survey(selector, callback) {
		var input = $(selector);
		var oldvalue = input.val();
		setInterval(function(){
	      	if (input.val()!=oldvalue){
	        	oldvalue = input.val();
				callback();
			}
		}, 100);
	}
	
    function findPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
    
    function checkId(){
    	if($('input[name=hairShopId]').val()==""){
			$('#checkIdSpan').text("사용할 아이디를 입력하세요.").css('color', 'red').css('font-weight', 'bold').css('font-size', '8pt');
		} else {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/companyPage/checkId.do',
				data : {'hairShopId' :  $('#hairShopId').val()},
				dataType : 'text',
				success : function(data){
					if(data.trim()=='exist'){
						$('#checkIdSpan').text("사용 불가한 아이디입니다.").css('color', 'red').css('font-weight', 'bold').css('font-size', '8pt');						
					}else if(data.trim()=='not_exist'){
						$('#checkIdSpan').text("사용 가능한 아이디입니다.").css('color', 'blue').css('font-weight', 'bold').css('font-size', '8pt');
						$('#checkedId').val($('#checkIdSpan').val());
					}
				}
			});
		}
    }
</script>
</body>