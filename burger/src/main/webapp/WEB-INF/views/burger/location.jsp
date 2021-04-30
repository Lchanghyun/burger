<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229e2c08f37ef9afeaa49b3fd7017d47&libraries=services"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
var markers = [];
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	//var ps = new kakao.maps.services.Places();  
	const ps = [		
		<c:forEach items="${list}" var="Branch">
		{branch_no: '${Branch.branch_no}', branch_addr: '${Branch.branch_address}'},
		</c:forEach>
	];
	for(let i = 0; i<ps.length; i++){
		console.log(ps[i].branch_addr);		
	}	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
		console.log(keyword);
		function isKeyword(element){
	    	if(element.branch_addr.indexOf(keyword) != -1){
	    		return true;
	    	}
	    }
	    const place = ps.filter(isKeyword);
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    placeSerchCB(keyword); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(keyword, pagination) {
	    if (keyword != null) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    }else{
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
/*		var mapContainer = document.querySelector('#map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
		// 지도 생성   
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = [];
		<c:forEach items="${list}" var="Branch">
			ps.push("${Branch.branch_address}");
		</c:forEach>	
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		$(".check-location").click(function(){
			var keyword = document.querySelector('#keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch(keyword, placeSearchCB);    
		});
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
		    }
		}
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    var listEl = document.querySelector('#placesList'), 
		    menuEl = document.querySeletor('#menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
*/

/*		
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
		
*/		
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
<style type="text/css">
	.map_wrap, .map_wrap * {margin:0;padding:0;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<p style="margin: 0;">근처 지점 찾기</p><br><br>		
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" value="강남" id="keyword" size="15"> 
	                    <button type="submit">검색하기</button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	</div>			
	<hr>
	<form class="form" action="order" method="get">
		<select id="branch_select" name="branch_no">
				<option>지점선택</option>
			<c:forEach items="${list}" var="Branch">
				<option  value="${Branch.branch_no}" >${Branch.branch_name}</option>
			</c:forEach>
		</select>
			<button type="submit" id="btn_order">주문하기</button>
	</form>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
