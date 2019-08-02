<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[boardWrite.jsp]</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!--  jQuery UI CSS파일  --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--   jQuery 기본 js파일  --> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--  jQuery UI 라이브러리 js파일  --> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7aab627bc1e31e00edfb6a4603d8a434&libraries=services"></script>  

<script>
	$(function () {
		$("#startDate").datepicker();
		$("#startDate").datepicker('setDate', new Date);
		$("#endDate").datepicker();
		$("#endDate").datepicker('setDate', new Date);
	});
		
	function sample5_execDaumPostcode() {
		new daum.Postcode({
		    oncomplete: function(data) {
		        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		        var fullAddr = data.address; // 최종 주소 변수
		        var extraAddr = ''; // 조합형 주소 변수
		
		        // 기본 주소가 도로명 타입일때 조합한다.
		        if(data.addressType === 'R'){
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
		
		        // 주소 정보를 해당 필드에 넣는다.
		        document.getElementById("place").value = fullAddr;
		        // 주소로 상세 정보를 검색
		        geocoder.addressSearch(data.address, function(results, status) {
		            // 정상적으로 검색이 완료됐으면
		            if (status === daum.maps.services.Status.OK) {
		
		                var result = results[0]; //첫번째 결과의 값을 활용
		
		                // 해당 주소에 대한 좌표를 받아서
		                var coords = new daum.maps.LatLng(result.y, result.x);
		                // 지도를 보여준다.
		                mapContainer.style.display = "block";
		                map.relayout();
		                // 지도 중심을 변경한다.
		                map.setCenter(coords);
		                // 마커를 결과값으로 받은 위치로 옮긴다.
		                marker.setPosition(coords)
		            }
		        });
		    }
		}).open();
		}

	
</script>

<title>Bootstrap Sign up Form with Icons</title>

<style type="text/css">
	body {
		background: #19aa8d;
		font-family: 'Roboto', sans-serif;
	}
	.form-control, .form-control:focus, .input-group-addon {
		border-color: #e1e1e1;
	}
    .form-control, .btn {        
        border-radius: 3px;
    }
	.create-form {
		width: 1000px;
		margin: 0 auto;
		padding: 30px 0;
	}
    .create-form form {
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.create-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .create-form hr {
        margin: 0 -30px 20px;
    }
	.create-form .form-group {
		margin-bottom: 20px;
	}
	.create-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.create-form .form-control {
		min-height: 38px;
		box-shadow: none !important;
	}	
	.create-form .input-group-addon {
		max-width: 42px;
		text-align: center;
	}
	.create-form input[type="checkbox"] {
		margin-top: 2px;
	}   

	.create-form .btn:hover, .create-form .btn:focus {
		background: #179b81;
        outline: none;
	}
	.create-form a {
		color: #fff;	
		text-decoration: underline;
	}
	.create-form a:hover {
		text-decoration: none;
	}
	.create-form form a {
		color: #19aa8d;
		text-decoration: none;
	}	
	.create-form form a:hover {
		text-decoration: underline;
	}
	.create-form .fa {
		font-size: 21px;
	}
	.create-form .fa-paper-plane {
		font-size: 18px;
	}
	.create-form .fa-check {
		left: 17px;
		top: 18px;
		font-size: 7px;
		position: absolute;
	}
	.addrBtn {
	    font-size: 16px;
        font-weight: bold;
		background: #19aa8d;
		border: none;
		min-width:30px;
	}
	.input-group{
		z-index: 999
	}	
</style>
</head>
<body>
<div class="create-form">
    <form name="create" action="insertBoard.do" enctype="multipart/form-data" method="post"> <!-- onsubmit form 전송전에 입력된 데이터의 유효성을 체크하기 위해 사용하는 이벤트 return false 이면 진행안함 -->
		<input type="hidden" name="mNum" value="5">
		<h2>신규개설</h2>
		<p></p>
		<hr>
        <div class="form-group">
			<div class="input-group">
				이미지
   		   		 <input type="file"  class="form-control" id="img_f" name="img_f"><p>
   		   		 <img id="thumbnail" src="resources/images/index.png" style="width:100px;height:100px;">
			</div>
        </div>
		<div class="form-group">
			<div class="input-group">
		     	 카테고리/모임명
			      <select id="cNum" name="cNum">	
			      	<option value="">카테고리선택</option>
			      	<option value="${dto.cNum }">${dto.cName}</option>

			      </select>
			      <input type="text" class="form-control" id="bTitle" name="bTitle" size=80 placeholder="모임명을 입력해주세요" required="required" > <br>
			</div>
        </div>
        <div class="form-group">
        	<div class="input-group">
        		모집인원
        		<input type="number" name="person" min="0" required="required" style="text-align:right;" >
        	</div>
        </div>
        <hr>
		<div class="form-group">
			<div class="input-group">
	    		모임일시
	    		<input type="text"  id="startDate" name="startDate" required="required">
	    		<select id="startTime"  name="startTime">
					<option value='00:00'>00:00</option>
					<option value='00:30'>00:30</option>
					<option value='01:00'>01:00</option>
					<option value='01:30'>01:30</option>
					<option value='02:00'>02:00</option>
					<option value='02:30'>02:30</option>
					<option value='03:00'>03:00</option>
					<option value='03:30'>03:30</option>
					<option value='04:00'>04:00</option>
					<option value='04:30'>04:30</option>
					<option value='05:00'>05:00</option>
					<option value='05:30'>05:30</option>
					<option value='06:00'>06:00</option>
					<option value='06:30'>06:30</option>
					<option value='07:00'>07:00</option>
					<option value='07:30'>07:30</option>
					<option value='08:00'>08:00</option>
					<option value='08:30'>08:30</option>
					<option value='09:00'>09:00</option>
					<option value='09:30'>09:30</option>
					<option value='10:00'>10:00</option>
					<option value='10:30'>10:30</option>
					<option value='11:00'>11:00</option>
					<option value='11:30'>11:30</option>
					<option value='12:00'>12:00</option>
					<option value='12:30'>12:30</option>
					<option value='13:00'>13:00</option>
					<option value='13:30'>13:30</option>
					<option value='14:00'>14:00</option>
					<option value='14:30'>14:30</option>
					<option value='15:00'>15:00</option>
					<option value='15:30'>15:30</option>
					<option value='16:00' selected='selected'>16:00</option>
					<option value='16:30'>16:30</option>
					<option value='17:00'>17:00</option>
					<option value='17:30'>17:30</option>
					<option value='18:00'>18:00</option>
					<option value='18:30'>18:30</option>
					<option value='19:00'>19:00</option>
					<option value='19:30'>19:30</option>
					<option value='20:00'>20:00</option>
					<option value='20:30'>20:30</option>
					<option value='21:00'>21:00</option>
					<option value='21:30'>21:30</option>
					<option value='22:00'>22:00</option>
					<option value='22:30'>22:30</option>
					<option value='23:00'>23:00</option>
					<option value='23:30'>23:30</option>
				</select>    			
				부터
	    		<input type="text" id="endDate" name="endDate" required="required">
	    		<select id="endTime" name="endTime">
					<option value='00:00'>00:00</option>
					<option value='00:30'>00:30</option>
					<option value='01:00'>01:00</option>
					<option value='01:30'>01:30</option>
					<option value='02:00'>02:00</option>
					<option value='02:30'>02:30</option>
					<option value='03:00'>03:00</option>
					<option value='03:30'>03:30</option>
					<option value='04:00'>04:00</option>
					<option value='04:30'>04:30</option>
					<option value='05:00'>05:00</option>
					<option value='05:30'>05:30</option>
					<option value='06:00'>06:00</option>
					<option value='06:30'>06:30</option>
					<option value='07:00'>07:00</option>
					<option value='07:30'>07:30</option>
					<option value='08:00'>08:00</option>
					<option value='08:30'>08:30</option>
					<option value='09:00'>09:00</option>
					<option value='09:30'>09:30</option>
					<option value='10:00'>10:00</option>
					<option value='10:30'>10:30</option>
					<option value='11:00'>11:00</option>
					<option value='11:30'>11:30</option>
					<option value='12:00'>12:00</option>
					<option value='12:30'>12:30</option>
					<option value='13:00'>13:00</option>
					<option value='13:30'>13:30</option>
					<option value='14:00'>14:00</option>
					<option value='14:30'>14:30</option>
					<option value='15:00'>15:00</option>
					<option value='15:30'>15:30</option>
					<option value='16:00' selected='selected'>16:00</option>
					<option value='16:30'>16:30</option>
					<option value='17:00'>17:00</option>
					<option value='17:30'>17:30</option>
					<option value='18:00'>18:00</option>
					<option value='18:30'>18:30</option>
					<option value='19:00'>19:00</option>
					<option value='19:30'>19:30</option>
					<option value='20:00'>20:00</option>
					<option value='20:30'>20:30</option>
					<option value='21:00'>21:00</option>
					<option value='21:30'>21:30</option>
					<option value='22:00'>22:00</option>
					<option value='22:30'>22:30</option>
					<option value='23:00'>23:00</option>
					<option value='23:30'>23:30</option>
				</select>   	
				까지	
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				모임장소
				<input type="button" class="addrBtn btn-primary " name="addrPop" value="search" onclick="sample5_execDaumPostcode()">
				<input type="text"  class="form-control" id="place" name="place" size=60 readonly required="required"><br>
				<input type="text"  class="form-control" id="detailPlace" name="detailPlace" size=60 placeholder="상세주소를 입력하세요" required="required">
				<div id="map" style="width:600px;height:300px;margin-top:10px;display:none"></div>
			</div>
        </div>
        <hr>
        <div class="form-group">
			<div class="input-group">
				<p>간단한 모임소개<br>
				<textarea name="preText" rows="5" cols="40" placeholder="모임내용을 간단히 입력해주세요" required="required"></textarea>
			</div>
        </div>    
        <div class="form-group">
			<div class="input-group">
				<p>상세내용<br>
				<textarea name="mainText" rows="10" cols="80" required="required"></textarea>
			</div>
        </div> 
        <hr>                           
        <div class="form-group">
	      <input type="submit" value="myBatis데이터저장" >
	      <input type="reset" value="입력취소">   	
        </div>
	</form>
</div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
	    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
	position: new daum.maps.LatLng(37.537187, 127.005476),
	map: map
	});

	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#thumbnail').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#img_f").change(function() {
        readURL(this);
    });		
</script>
</body>
</html>














