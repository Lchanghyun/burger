<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229e2c08f37ef9afeaa49b3fd7017d47&libraries=services"></script>
<script>
var map;
	$(function(){
		var branch = new Array();
		<c:forEach items="${list}" var="Branch">
			branch.push("${Branch.branch_no}", "${Branch.branch_address}");
		</c:forEach>
		console.log(branch[1]);
		console.log(branch[2]);
		//지도
		var mapAddress = document.querySelector(".mapAddress");
		$(".check-location").click(function(){
	        var address = document.querySelector("input[name=address]").value;
			 //입력창의 값을 불러오는 코드
            if(!address){
                alert("주소를 입력하세요");
                return;
            }else{
				$("#insert-map").show();
				//지도 생성
				var mapContainer = document.querySelector("#insert-map"),
	            mapOption = {
	                center: new kakao.maps.LatLng(33.450701, 126.570667),
	                level: 3
	            };  
	
				map = new kakao.maps.Map(mapContainer, mapOption); 
	            
	            var geocoder = new kakao.maps.services.Geocoder();
				
	            geocoder.addressSearch(address, function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);                    
	                    //마커 생성
	                    var marker = new kakao.maps.Marker({
	                        map: map,
	                        position: coords
	                    });
	                    
	                 	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                    map.setCenter(coords);
	                 	
	                    mapAddress.value = result[0].road_address.address_name;
	                 	$(".address").val(result[0].road_address.address_name);
	                 	var iwContent = '<div style=" width: 150px; height: 40px; padding:5px; font-size:12px;">주소:' + result[0].road_address.address_name + '</div>';
	                 	iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
	                	// 인포윈도우를 생성합니다
	                	var infowindow = new kakao.maps.InfoWindow({
	                    position : iwPosition, 
	                    content : iwContent 
	                	});
	                  
	                	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	                	infowindow.open(map, marker); 
	                }
	            });
	
		        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	            var zoomControl = new kakao.maps.ZoomControl();
	            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
            }
		});
		var branch_no;
		console.log(branch_no);
		$("#branch_select").change(function(){
			branch_no = $(this).val();
			console.log(branch_no)
		});		
		
 		$(".form").submit(function(e){
 			e.preventDefault()
			if(branch_no == null || branch_no == ""){
				alert("지점을 선택해주세요");
				return;
			}else{
				this.submit();
			}
		});
	});
</script>
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<form class="form" action="order" method="get">
		<p style="margin: 0;">지점 검색</p><br><br>
		
		<span>
			<input class="inline-input address" type="text" name="address" required style="width: 340px;">
			<input class="mapAddress" type="text" style="display: none;">
		</span>
		<span>
			<input class="check-location" type="button" value="위치확인하기">
		</span>		
		<br><br>
		<select id="branch_select" name="branch_no">
				<option>지점선택</option>
			<c:forEach items="${list}" var="Branch">
				<option  value="${Branch.branch_no}" >${Branch.branch_name}</option>
			</c:forEach>
		</select>
			<button type="submit" id="btn_order">주문하기</button>
	</form>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
