<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myorder.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <div class="order-list">
    	<div class="detailBack">
    		<a href="list" class="backA">◀ 뒤로</a>
    		<div class="detailTitle">상세주문내역</div>
    	</div>
		<div class="myorderdetailList">
			<div class="detailListbox">
			<c:forEach var="detailmenu" items="${detailList}">
		        <div class="mylastorder">
		            <div class="Dmyorderlist-border">
		                <img src="${pageContext.request.contextPath}/menu/photoShow?fileName=${detailmenu.save_name}" class="detailmenu-img">
		                <div class="myorderDetail">
			                <div class="mylastorder-list">
			                    <div class="myorderDetailName">${detailmenu.menu_name}</div>
			                    <div class="myorderDetailPrice">${detailmenu.menu_price}원</div>
			                </div>
			                <div>
			                    <div class="how-many">수량 ${detailmenu.count}개</div>
			                </div>
		                </div>
		            </div>
		        </div>
			</c:forEach>
			</div>
	        <div class="totalprice-my">총 금액 : <span class="mypage-totalprice">${total_price}</span> 원</div>
	    </div>
    </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>