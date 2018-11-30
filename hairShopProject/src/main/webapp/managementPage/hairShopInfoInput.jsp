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


</style>
<body>
<div align="center">
	<table class="table table-striped" id="" style="width: 80%;">
		<tr>
			<td>상호명</td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>사업지 주소</td>   <!-- 주소 등록시에, 경도 위도 데이터도 함께 insert -->
			<td><input type="text" name="address" /></td>
		</tr>
		<tr>
			<td>사업자 등록 번호</td>
			<td><input type="text" name="bizID" maxlength="10" /></td>
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
				</select>-
				<input type="number" name="tel2" />-
				<input type="number" name="tel3"/>
			</td>
		</tr>
		<tr>
			<td>헤어샵 소개</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>헤어샵 아이디</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>영업 시간</td>
			<td> <input class="openTimePicker" size="5"/>
			~ <input class="closeTimePicker" size="5" />
		</tr>
		<tr>
			<td >헤어샵 이미지
			<br/><span style="font-size: 8pt;">최대 3개 등록 가능합니다.</span></td>
			<td>
				<input type="file" name="img1[]" id="img1" multiple="multiple" >
			</td>
		</tr> 
	</table>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bdcc4d7ca1e01a2e5d822a148f1f8aa&libraries=services"></script>

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

	$('input[name="bizID"]').on('change', function(){
		alert(chkWorkNumb($('input[name=bizID]').val()));
	});

	function chkWorkNumb(strNumb) {
		strNumb = Replace(strNumb, "-");
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
	
	
	
	var latitud = 0;
	var longitude = 0;
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	    	 
	    	 latitud = result[0].y;
	    	 longitude = result[0].x;
	     }
	});

	
	
	
	function post_to_url(path, params, method) {
	    method = method || "post";
	    var hairShopInfoForm = document.createElement("form");
	    hairShopInfoForm.setAttribute("method", method);
	    hairShopInfoForm.setAttribute("action", path);
	    for (var key in params) {
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", key);
	        hiddenField.setAttribute("value", params[key]);
	        reserveForm.appendChild(hiddenField);
	    }
	    document.body.appendChild(hairShopInfoForm);
	    hairShopInfoForm.submit();
	    return false;
	}
	
	
	
</script>
</body>