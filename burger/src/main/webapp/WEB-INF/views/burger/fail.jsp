<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<title>주문완료</title>
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<link rel="stylesheet" href="${path}/resources/css/payment_success.css"></link>
	<span class="success">주문이 이미 완료 되었습니다.</span>
	<div class="href">
		<a href="${path}">홈으로</a> <a href="${path}/myorder/list">MY ORDER</a>
	</div>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
