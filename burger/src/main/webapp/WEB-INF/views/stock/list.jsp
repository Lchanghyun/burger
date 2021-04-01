<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 재고관리</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".stock_register_btn").on("click",function(){
			location.href="${pageContext.request.contextPath}/stock/register"			
		});
	})
	
</script>
<body>
	<div class="stock_all_wrapper">
		<button class="stock_register_btn">재고등록</button>
		<table class="stock_table">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>자재명</th>
					<th>수량</th>
					<th>단가</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td>아무것도 없네...</td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="StockItemVo">
					<tr>
						<td>${StockItemVo.category}</td>
						<td>${StockItemVo.item_name}</td>
						<td>${StockItemVo.stock_count}</td>
						<td>${StockItemVo.item_price}</td>
						<td>${StockItemVo.stock_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>