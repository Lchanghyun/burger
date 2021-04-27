<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myorder.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(function(){
		$(".mylastorder").click(function(){
			let order_no = $(this).children().val();
			console.log(order_no);
			location.href = "detail?order_no="+order_no;
		})
	})
</script>
    <div class="order-list">
    
        <div class="order-title">주문내역</div>
        
        <div class="myorderlist">
        	<c:if test="${empty listcount}">
        		<div>주문내역이 존재하지않습니다.</div>
        	</c:if>
			<c:forEach var="list" items="${listcount}">
		        <div class="mylastorder">
		        	<input type="hidden" value="${list.order_no}">
		            <div class="myorderlist-border">
		            	<c:if test="${menulist.get(list.order_no).get('save_name') ne null}">
			                <img src="${pageContext.request.contextPath}/menu/photoShow?fileName=${menulist.get(list.order_no).get('save_name')}" class="menulist-img">
		            	</c:if>
		            	<c:if test="${menulist.get(list.order_no).get('save_name') eq null}">
			                <div class="menulist-img"></div>
		            	</c:if>
		                <div class="myorderorder">
			                <div class="mylastorder-list">
			                	<c:if test="${list.count > 1}">
			                		<div class="myorderMenu">${menulist.get(list.order_no).get('menu_name')}외 ${list.count-1}건</div>
			                	</c:if>
			                	<c:if test="${list.count == 1}">
			                		<div class="myorderMenu">${menulist.get(list.order_no).get('menu_name')}</div>
			                	</c:if>
			                    <div class="myorderNum">주문번호: ${list.order_no}</div>
			                    <div class="myorderTime">주문시간: <fmt:formatDate value="${list.today_time}" pattern="yyyy.MM.dd a HH:mm"/></div>
			                </div>
			                <div>
			                    <div class="myorderBranch">${list.branch_name}</div>
			                    <div class="myorderStatus">
			                    	<c:if test="${list.status eq '0'}">주문접수</c:if>
			                    	<c:if test="${list.status eq '1'}">주문완료</c:if>
			                    </div>
			                </div>
		                </div>
		            </div>
		        </div>
			</c:forEach>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>