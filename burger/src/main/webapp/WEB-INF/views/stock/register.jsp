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
		
		let list = [];
		let item_no;
		let stock_count;
		
		$(".count_input").on("blur",function(){
			stock_count = $(this).val()
			item_no = $(this).parent().next().children().val()
			list_check(item_no)
			list.push({"item_no" : item_no, "stock_count" : stock_count})
		})
		
		function list_check(item_no){
			$.each(list, function(index, element){
				if(element.item_no === item_no){
					delete list[index]
					return false;
				}
			})
		}
		
		$(".stock_form_btn").on("click", function(e){
			e.preventDefault();
			
			let temp = JSON.stringify(list)
			console.log(temp)
			
			
			$.ajax({
				url:"${pageContext.request.contextPath}/stock/register",
				type: "POST",
				data: {
					stock_list : temp
				},
				success: function(resp){
					console.log("성공")
				}
				
			})
		})
	})
</script>
<style>
	.count_input{
		width: 1.5rem;
		text-align: center;
	}
</style>
<body>
	<div class="list_all_wrapper">
		<button class="stock_plus_btn">재고 추가</button>
		<button class="stock_form_btn">재고 등록</button>
		<form action="register" method="post" class="stock_register_form">
			<input type="hidden" name="stock_list" id="stock_list">
		</form>
		<table class="list_table">
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
						<td>아무것도 없네...</td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="StockItemVo">
					<tr>
						<td>${StockItemVo.category}</td>
						<td>${StockItemVo.item_name}</td>
						<td>${StockItemVo.item_price}원</td>
						<td><input type="text" value="${StockItemVo.stock_count}" class="count_input" required></td>
						<td><input type="hidden" value="${StockItemVo.item_no}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>