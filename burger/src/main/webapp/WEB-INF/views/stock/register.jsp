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

		$(".stock_plus_btn").on("click",function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/stock_plus"			
		})
		
		$(".stock_list_btn").on("click", function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/list"			
		})
		
	})
</script>
<style>
	.count_input{
		width: 1.5rem;
		text-align: center;
	}
	.stock_list_table{
		margin : 10px auto;
		border : 1px solid black;
		border-collapse: collapse;

	}
	.stock_list_table >thead>tr> th,
	.stock_list_table >tbody>tr> td {
		border-bottom : 1px solid black;
		padding : 10px;
		width: 90px;
	}
	.list_all_wrapper{
		text-align : center;
	}
	button{
		cursor : pointer;
	}
	.stock_list_btn,
	.stock_plus_btn,
	.stock_form_btn{
		font-size : 15px;
	}
	.count_input{
		width : 50px;
		padding : 5px; 
		text-align: right;
	}
</style>
<body>
	<div class="list_all_wrapper">
		<button class="stock_list_btn">재고 목록</button>
		<button class="stock_plus_btn">재고 추가</button>
		
		<form action="register" method="post" class="stock_register_form">
		<input type="hidden" name="size" value="${list.size()}">
		<table class="stock_list_table">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>자재명</th>
					<th>단가</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">등록된 자재가 없습니다.</td> 
					</tr>
				</c:if>
				<c:set var="index" value="0"/>
				<c:forEach items="${list}" var="StockItemVo">
					<c:set var="index" value="${index+1}"/>
					<input type="hidden" name="stockItemVo_list[${index}].item_no" value="${StockItemVo.item_no}">
					<tr>
						<td>${StockItemVo.category}</td>
						<td>${StockItemVo.item_name}</td>
						<td>${StockItemVo.item_price}원</td>
						<td><input type="text" name="stockItemVo_list[${index}].stock_count" class="count_input" required></td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<input type="submit" class="stock_form_btn" value="등록 완료">
		</form>
		
		
	</div>
</body>
</html>