<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 입력</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68d4be6c2ce69cb3cfc2551c68619e12&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		
		function getLocation() {
			if (navigator.geolocation) { // GPS를 지원하면
			    navigator.geolocation.getCurrentPosition(function(position) {
					let Lat = position.coords.latitude
					let Lng = position.coords.longitude
			    	let coords = new kakao.maps.LatLng(Lat, Lng); 
	
					searchAddrFromCoords(coords, displayCenterInfo);
			    }, function(error) {
			    	Swal.fire({ icon: 'error', 
	                	title: '현재 위치를 알수 없습니다.', 
	                	text: '위치 정보에 승낙하시면 알수 있습니다. ',  
	          		});
			    }, {
			      enableHighAccuracy: false,
			      maximumAge: 0,
			      timeout: Infinity
			    });
			} 
			else {
				Swal.fire({ icon: 'error', 
                	title: '현재 위치를 알수 없습니다.', 
                	text: '위치 정보에 승낙하시면 알수 있습니다. ',  
          		});
			}
		}
		$(".current_location_btn").on("click",function(){
			getLocation();
		})


		var geocoder = new kakao.maps.services.Geocoder();

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {

		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		                
		                Swal.fire({ icon: 'success', 
		                	title: '당신의 현재 위치', 
		                	text: result[i].address_name,  
		                	});

		                break;
		            }
		        }
		    } 
		}
		
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	    
	    $("#post_code_btn").on("click",function(){
	    	sample6_execDaumPostcode();
	    })
		 
	})
</script>
<body>
	<div>
		<button class="current_location_btn">현재위치</button>
		<div>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" id="post_code_btn" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">	
		</div>		
	</div>
</body>
</html>