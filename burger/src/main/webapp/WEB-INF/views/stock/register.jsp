<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일 재고 등록</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".stock_plus_btn").on("click",function(){
			location.href="${pageContext.request.contextPath}/stock/stock_plus"			
		})
		
		$(".stock_register_btn").on("click", function(){
			$(".stock_register_form").submit()
		})
	})
</script>
<style>
	.stock_count{
		width: 1.5rem;
		text-align: center;
	}
</style>
<body>
	<div class="list_all_wrapper">
		<button class="stock_plus_btn">재고 추가</button>
		<button class="stock_register_btn">등록</button>
		<form action="register" method="post" class="stock_register_form">
			<table class="list_table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>자재명</th>
						<th>수량</th>
						<th>단가</th>
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
							<td><input type="text" name="stock_count" value="${StockItemVo.stock_count}" class="stock_count"></td>
							<td>${StockItemVo.item_price}원</td>
							<td><input type="hidden" name="item_no" value="${StockItemVo.item_no}" id="item_no"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>