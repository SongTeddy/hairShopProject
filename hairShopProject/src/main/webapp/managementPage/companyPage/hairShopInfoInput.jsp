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
.hairShopInfoTable{
	width: 70%;
	color: black;
}
.btnDiv{
	width: 70%;
	color: black;
	text-align: right;
}

.hairShopInfoTable caption{
	color: black;
	font-size: 20pt;
	margin-bottom: 20px;
}
#addr1, #addr2{
	margin-top: 5px;
}
</style>
<body>
<div align="center">
<form>
	<table class="table table-striped hairShopInfoTable" id="">
		<caption>${hairShopName }의 등록 정보</caption>
		<tr>
			<td>상호명</td>
			<td><input type="text" name="name" value="${hairShopName }" /></td>
		</tr>
		<tr>
			<td style="height: 70px;">사업자 등록 번호</td>
			<td><input type="text" name="bizID" maxlength="10" />
			<br/><span style="font-size: 8pt;" id="bizIDCheckDiv"></span>
			
			</td>
		</tr>
		<tr>
			<td>사업지 주소</td>   <!-- 주소 등록시에, 경도 위도 데이터도 함께 insert -->
			<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly" size="8">
				&nbsp;<input type="button" onclick="findPostcode()" value="우편번호 찾기"><br/>
				<input type="text" name="addr1" id="addr1" placeholder="주소" readonly="readonly" size="45"><br/>
				<input type="text" name="addr2" id="addr2" placeholder="상세주소" size="30">
			</td>
		</tr>
		<tr>
			<td>전화 번호</td>
			<td><select class="tel1" style="height:25px;">
					<option value="010">010</option>
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
				<input type="tel" name="tel2" size="4" maxlength="5"/> -
				<input type="tel" name="tel3"size="4" maxlength="5"/>
			</td>
		</tr>
		<tr>
			<td>헤어샵 소개글</td>
			<td><input type="text" name="hairShopContent" size="45" maxlength="30" placeholder="30자 이내로 작성해주세요."></td>
		</tr>
		<tr>
			<td style="height: 70px;">헤어샵 아이디</td>
			<td><input type="text" name="hairShopId" id="hairShopId">
			&nbsp;<input type="button" onclick="checkId()" value="중복 확인" />
			<input type="hidden" id="checkedId" value="" /><br/>
			<span style="font-size: 8pt;" id="checkIdSpan"></span></td>
		</tr>
		<tr>
			<td>영업 시간</td>
			<td><input class="openTimePicker" size="5"/>
			~ <input class="closeTimePicker" size="5" />
		</tr>
		<tr>
			<td style="height: 70px;"><span>헤어샵 이미지</span>
			</td>
			<td>
				<input type="file" name="img1[]" id="img1" multiple="multiple" />
				<span style="font-size: 8pt;">최대 3개 등록 가능합니다.</span>
			</td>
		</tr> 
	</table>
	<input type="hidden" name="latitud" />
	<input type="hidden" name="langitude" />
	<div class="btnDiv">
		<input type="button" class="btn" value="정보 수정">
		<input type="button" class="btn" value="취소">
	</div>
</form>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bdcc4d7ca1e01a2e5d822a148f1f8aa&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

if('${hairShopId }' != ""){
	$('input[name=hairShopId]').val('${hairShopId }');
	$('input[name=hairShopId]').prop('readonly', true);
	$('input[name=hairShopId]').attr('readonly', true);
}
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


$(document).ready(function(){
	
	var geocoder = new daum.maps.services.Geocoder();
	survey($('input[name=addr1]'), function(){ 
		alert(document.getElementById('addr1').value + 'changed');
		// 주소-좌표 변환 객체를 생성합니다
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($('input[name=addr1]').val(), function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		    	 var latitud = result[0].y; //위도
		    	 var longitude = result[0].x; //경도
		    	 alert(latitud + "  "+longitude);
		    	 $('input[name=latitud]').val(latitud);
		    	 $('input[name=longitude]').val(longitude);
		     }else{
		    	 alert("위도 경도 검색 실패!");
		     }
		});
	});
	
	$('input[name=bizID]').on('change', function(){
// 		alert(chkWorkNumb($('input[name="bizID"]').val()));
		if(chkWorkNumb($('input[name="bizID"]').val()))
			$('#bizIDCheckDiv').val("사업자 등록번호가 확인되었습니다.");
	});
});

	function chkWorkNumb(strNumb) {
		strNumb = replace(strNumb, "-");
		if (strNumb.length != 10) {
			alert("사업자등록번호가 잘못되었습니다.");
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
			alert("사업자등록번호가 잘못되었습니다.");
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
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
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
				url : '/hairShopProject/managementPage/checkId.do',
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