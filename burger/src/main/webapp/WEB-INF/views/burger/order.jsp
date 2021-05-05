<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<title>주문하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	let contexPath = "${pageContext.request.contextPath}";
</script>
<script src="${path}/resources/js/orderJs.js"></script>
<link rel="stylesheet" href="${path}/resources/css/order.css">
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<br><br>
	<div style="display: inline-block;">
		<h3 style="margin: 0 0 0 50px; font-size: 40px;">메뉴</h3>
	</div>
	<div class="btn_list">
		<button id="btn_burger">BURGER</button>
		<button id="btn_drink">DRINK</button>
		<button id="btn_side">SIDE</button>
	</div>
	<br><br>
		<div style="width: 1140px; padding: 30px;">
			<div id="menu" >
				<c:choose>
					<c:when test="${empty orderList}">
						<div class="menuReady">
							<p>메뉴 준비중입니다.</p>
							<br>
						</div>
					</c:when>
						<c:otherwise>
						<c:forEach items="${orderList}" var="MenuBranchMenuVo" >
							<c:if test="${MenuBranchMenuVo.menu_status != '2' and MenuBranchMenuVo.menu_status != '3'}">
								<div class="menuList add-menu${MenuBranchMenuVo.bm_no}">
									<img class="menu_photo" alt="메뉴사진" src="${pageContext.request.contextPath}/menu/photoShow?fileName=${MenuBranchMenuVo.save_name}">
									<p class="menu_name">${MenuBranchMenuVo.menu_name}</p>
									<span class="menu_price">${MenuBranchMenuVo.menu_price}</span><span>원</span>
									<p id="branch_no" style="display: none;">${MenuBranchMenuVo.branch_no}</p>
									<p class="bm_no" style="display: none;">${MenuBranchMenuVo.bm_no}</p>
									<input type="hidden" id="status" value="${MenuBranchMenuVo.menu_status}">
									<input type="hidden" value="${MenuBranchMenuVo.category }">
									<br>
								</div>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>				
			</div>
		</div>
		<div style="display: inline-block;">
			<h3 style="margin: 0 0 0 50px; font-size: 40px;">주문내역</h3>
		</div>
		<button id="all-delete">전체 삭제</button>
			<div style="width: 1000px; margin: 0 auto;">
				<div id="array">
					<div id="menuEmpty">
						<p>제품을 선택해주세요.</p>
					</div>								
				</div>
			</div>
		<div id="total">
			<p>주문 총 금액: <span id="order_price">0</span>원</p>	
		</div>
		<input type="button" id="payment" value="주문하기">			
		<br><br>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
		