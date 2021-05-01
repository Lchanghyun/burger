'use strict';

let map;
$(function(){
	let branch_address = $("#branch_address").text();
	
	//지도
	$("#map").show();

	//지도 생성
	var mapContainer = document.querySelector("#map"),
    mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
    };  	
	map = new kakao.maps.Map(mapContainer, mapOption); 
	         
    var geocoder = new kakao.maps.services.Geocoder();
    var coords;
        geocoder.addressSearch(branch_address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
             coords = new kakao.maps.LatLng(result[0].y, result[0].x);                    
             //마커 생성
             var marker = new kakao.maps.Marker({
                 map: map,
                 position: coords
        });
	        
	       	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	          map.setCenter(coords);
	       	
	       	var iwContent = '<div style=" width: 150px; padding:5px; font-size:12px;">버거머거:' + branch_address + '</div>';
	      	// 인포윈도우를 생성합니다
	      	var infowindow = new kakao.maps.InfoWindow({
	          position : coords, 
	          content : iwContent 
	      	});
                  
                	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                	infowindow.open(map, marker); 
                }
            });

	        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	

});