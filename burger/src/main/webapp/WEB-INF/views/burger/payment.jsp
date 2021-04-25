<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<title>결제하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script> 
$(function(){
	let Now = new Date();
	let nowMonth = Now.getMonth() +1;
	let nowDay = Now.getDate();
	let nowHour = Now.getHours();
	let nowMins = Now.getMinutes();
	
	function pluszero(time){
		var time = time.toString();
		if(time.length < 2){
			time = '0' + time;
			return time;
		}else{
			return time;
		}
	} 
	nowMonth = pluszero(nowMonth);
	nowDay = pluszero(nowDay);
	nowHour = pluszero(nowHour);
	nowMins = pluszero(nowMins);
	
	var nowTime = nowMonth + nowDay + nowHour + nowMins;
	console.log(nowTime);
	var startdate = nowMonth + nowDay + '0900';
	var enddate = nowMonth + nowDay + '2200';
	let count = 0;
	let price_status = $("input[name=price_status]");
	var price_statusVal;
	$("input[name=price_status]").click(function(){		
		//지금이 시작시간보다 크거나, 종료시간보다 작으면
		count++;
		let order_no = $(".order_no").val();
		let branch_no = $(".branch_no").val();
		$(this).prop('checked', true);
		console.log(this);
		if(!$("input[name=price_status]").hasClass("active")){			
			$(`<input type="hidden" name="order_no">`).val(order_no).addClass("form").prependTo("#form");
			$(`<input type="hidden" name="branch_no">`).val(branch_no).addClass("form").prependTo("#form");
			$("input[name=price_status]").addClass("active");
			if(startdate < nowTime && enddate > nowTime ){
//				$(`<input type="hidden" name="today_num">`).val(today_num_count).addClass("form").prependTo("#form");		
			}
		}
		price_statusVal = $('input[name="price_status"]:checked').val();
	});
	$("#form").submit(function(e){
			e.preventDefault()
			if(count === 0){
				alert("결제 수단을 눌러주세요");
				return;
			}else{
				if(price_statusVal === '1'){
					var IMP = window.IMP; // 생략가능
					IMP.init('imp68451399'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				    var msg;
					var totalPrice = $("#total_price").text();
					totalPrice = Number(totalPrice);
					
					IMP.request_pay({
					    pg : 'kakaopay',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '주문명:결제테스트',
					    amount : totalPrice,
					    buyer_email : 'iamport@siot.do',
					    buyer_name : '구매자이름',
					    buyer_tel : '010-1234-5678',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456'
					}, function(rsp) {
					    if ( rsp.success ) {
					    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					    	jQuery.ajax({
					    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
					    		type: 'POST',
					    		dataType: 'json',
					    		data: {
						    		imp_uid : rsp.imp_uid
						    		//기타 필요한 데이터가 있으면 추가 전달
					    		}
					    	}).done(function(data) {
					    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					    		if ( everythings_fine ) {
					    			var msg = '결제가 완료되었습니다.';
					    			msg += '\n고유ID : ' + rsp.imp_uid;
					    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					    			msg += '\결제 금액 : ' + rsp.paid_amount;
					    			msg += '카드 승인번호 : ' + rsp.apply_num;
					    			
					    			alert(msg);
					    			this.submit();
					    		} else {
					    			//[3] 아직 제대로 결제가 되지 않았습니다.
					    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					    		}
					    	});
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        
					        alert(msg);
					    }
					});
				}else if(price_statusVal === '0'){
					this.submit();
				}
			}
	});
	
	$("").click(function(){	
		
		
	});   
});
</script>
<style>
	#map{
		margin: 0 auto;
		height: auto; 
		min-height: 250px; 
		overflow: auto; 
		width: 1000px; 
		margin-top: 10px;
	}
	#pay_way{
		margin: 0 auto;
		height: auto; 
		min-height: 250px; 
		overflow: auto; 
		width: 1000px; 
		margin-top: 10px;
	}
	#menu_info{
		margin: 0 auto;
		height: auto; 
		min-height: 250px; 
		overflow: auto; 
		width: 1000px; 
		margin-top: 10px;
	}
	#goods{
		margin: 0 auto;
		height: auto; 
		min-height: 300px; 
		overflow: auto; 
		width: 1000px; 
		margin-top: 10px;
	}
	.menu_name{
		font-size: 25px;
		margin: 10px 0 3px;
		padding-left: 20px;
	}
	.menu_price{
		padding-left: 20px;
		font-size: 18px;
		margin: 3px 0;
	}
	.menu_count{
		display:inline-block;
		position: relative;
		left: 800px;
		font-size: 18px;
		margin: 3px 0;
	}
	.menu_total{
		display:inline-block;
		position: relative;
		left: 800px;
		font-size: 18px;
		margin: 3px 0;
	}
</style>
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<br><br>
	<div style="display: inline-block;">
		<h3 style="margin: 0 0 0 50px; font-size: 40px;">픽업 정보</h3>
	</div>
	<div id="map">
		지도랑 주소 보여주기
	</div>
	<br><br>
	<div style="display: inline-block;">
		<h3 style="margin: 0 0 0 50px; font-size: 40px;">주문 정보</h3>
	</div>
	<div id="menu_info">
		<c:set var="sum" value="${0}"></c:set>
		<c:forEach items="${goodsList }" var="GoodsBranchMenuVo" varStatus="i">
			<c:set var="menuSize" value="${fn:length(goodsList)-1}"/>
			<c:if test="${i.first}">
				<c:set var="firstmenu" value="${GoodsBranchMenuVo.menu_name}" />
			</c:if>
			<c:set var="sum" value="${sum+(GoodsBranchMenuVo.menu_price*GoodsBranchMenuVo.count)}"></c:set>
		</c:forEach>
			<div>
				<p style="padding: 30px 0 0 20px; font-size: 30px; margin-top: 10px;">
					<c:out value="${firstmenu}"/> 외 <c:out value="${menuSize}"/>건
				</p>
			</div>
			<div style="text-align: right;">
				<p style="font-size: 25px; margin-right: 100px;">
					총 합계 금액: <c:out value="${sum}"/>원
				</p>
			</div>
			<div style="text-align: center;">
				<button>주문 내역 확인</button>
			</div>
			<div id="goods">
				<c:choose>
					<c:when test="${empty goodsList}">
						<p>게시물이 없습니다.</p>
					</c:when>
						<c:otherwise>
						<c:forEach items="${goodsList}" var="GoodsBranchMenuVo" >
								<div class="goodsList add-menu${GoodsBranchMenuVo.bm_no}">
										<input class="order_no" type="hidden" value="${GoodsBranchMenuVo.order_no}">
										<input class="branch_no" type="hidden" value="${GoodsBranchMenuVo.branch_no}">
										<p class="menu_name">${GoodsBranchMenuVo.menu_name}</p>
										<p class="menu_price">${GoodsBranchMenuVo.menu_price}</p>
										<span class="menu_count">수량: ${GoodsBranchMenuVo.count}</span><br>
										<span class="menu_total">합계금액: ${GoodsBranchMenuVo.menu_price*GoodsBranchMenuVo.count}</span>		
										<hr>
								</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
	</div>
		<div style="display: inline-block;">
			<h3 style="margin: 0 0 0 50px; font-size: 40px;">결제수단</h3>
		</div>
		<form id="form" method="post" action="payment">
			<div id="pay_way">
			<div>
				<input type="radio" value="0" name="price_status" id="payment1" ><label for="payment1">만나서 결제</label>
				<input type="radio" value="1" name="price_status" id="payment2" ><label for="payment2">간편 결제(카카오)</label>
			<div>
					<p>총 결제 금액</p>
					<p>￦<span id="total_price"><c:out value="${sum}"></c:out></span></p>
					<input type="hidden" name="total_price" value="<c:out value="${sum}"></c:out>">
			</div>
			</div>
			<button type="submit" id="payment">결제하기</button>			
			</div>
		</form>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
