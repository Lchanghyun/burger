<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/todayorder.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".takeoutBtn").click(function(){
			let order_no = $(this).prev().val();
			$.ajax({
				url:"${pageContext.request.contextPath}/today/updateStatus",
				type:"POST",
				data:{
					order_no:order_no
				},
				success:function(res){
					location.reload();
				}
			})
		})
	})
</script>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
	<div class="today">
        <div class="todayOrderBox">
        	<div class="MyBranchandTitleBox">
        		<div class="todayOrderTitle">주문현황</div>
        		<span class="MyBranch">【${branch_name}】</span>
        	</div>
	        <div class="orderstatus">
	        <c:forEach var="order" items="${list}">
	        <c:if test="${order.status eq '0'}">
	        	<div class="orderOne">
	               <div class="number-info">
	                   <div class="order-number">주문번호: ${order.order_no}</div>
	               		<div class="tradeTime">거래시간: <fmt:formatDate value="${order.today_time}" pattern="yyyy.MM.dd a HH:mm:ss"/></div>
	               </div>
	               <div class="orderTimeAndStatus">
	                   <div class="order-number">대기번호: ${order.today_num}</div>
	               		<c:if test="${order.price_status eq '0'}">
	               			<div class="statusPrice1">미결제</div>
	               		</c:if>
	               		<c:if test="${order.price_status eq '1'}">
		               		<div class="statusPrice2">결제완료</div>
	               		</c:if>
	               </div>
	               <div class="status-line">
	                   <div class="todayPersonMenu">
	                   	<c:forEach var="menuorder" items="${menulist.get(order.order_no)}">
	                       <div class="status-title">
	                           <div>${menuorder.menu_name}</div>
	                           <div>${menuorder.count}</div>
	                        </div>
	                   	</c:forEach>
	                   </div>
	
	                   <div class="status-button">
	                   		<div class="totalPriceShow">총 ${order.total_price}원</div>
	                   		<input type="hidden" value="${order.order_no}">
	                    	<input type="button" value="픽업완료" class="takeoutBtn">                
	                   </div>
	               </div>
	           </div>
	        </c:if>
	        </c:forEach>
	        </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>