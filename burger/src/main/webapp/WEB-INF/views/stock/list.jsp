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
		
		$(".stock_plus_btn").on("click",function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/stock_plus"			
		})
		
		let category =
		
		console.log(category)
	})
</script>
<style>
	.list_table{
		margin : 10px auto;
		border : 1px solid black;
		border-collapse: collapse;

	}
	.list_table >thead>tr> th,
	.list_table >tbody>tr> td {
		border-bottom : 1px solid black;
		padding : 10px;
	}
	.list_all_wrapper{
		text-align : center;
	}
	.category_link{
		text-decoration : none;
		color : black;
		padding : 0 10px;
	}
	.category_link:hover{
		font-weight: bold;
	}
	button{
		cursor : pointer;
	}
	.stock_register_btn,
	.stock_plus_btn{
		font-size : 15px;
	}
	
</style>
<body>
	<div class="list_all_wrapper">
		<div class="btn_wrapper">
			<button class="stock_register_btn">재고등록</button>
			<button class="stock_plus_btn">자재 추가</button>
		</div>
		<div class="category_wrapper">
			<a href="list?category=채소류" class="category_link">채소류</a>
			<a href="list?category=육류" class="category_link">육류</a>
			<a href="list?category=제과류" class="category_link">제과류</a>
			<a href="list?category=음료" class="category_link">음료</a>
			<a href="list?category=소모품" class="category_link">소모품</a>
		</div>
		<table class="list_table">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>자재명</th>
					<th>단가</th>
					<th>수량</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">등록된 자재가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="StockItemVo">
					<tr>
						<td>${StockItemVo.category}</td>
						<td>${StockItemVo.item_name}</td>
						<td>${StockItemVo.item_price}</td>
						<td>${StockItemVo.stock_count}</td>
						<td>${StockItemVo.stock_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>