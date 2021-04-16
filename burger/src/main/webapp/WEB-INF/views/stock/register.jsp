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
		let list = [];
		let item_no;
		let stock_count;
		
		$(".count_input").on("blur",function(){
			stock_count = $(this).val()
			item_no = $(this).parent().parent().prev().val()
			console.log(item_no)
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
			
			$.ajax({
				url:"${pageContext.request.contextPath}/stock/register",
				type: "POST",
				data: {
					stock_list : temp
				},
				success: function(resp){
					let msg
					if(resp==="true"){
						msg="등록이 완료되었습니다."
					}
					else{
						msg="오늘 등록된 재고가 있습니다."
					}
					alert(msg)
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
	button{
		cursor : pointer;
	}
	.stock_list_btn,
	.stock_plus_btn,
	.stock_form_btn{
		font-size : 15px;
	}
</style>
<body>
	<div class="list_all_wrapper">
		<button class="stock_list_btn">재고 목록</button>
		<button class="stock_plus_btn">재고 추가</button>
		
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
						<td colspan="4">등록된 자재가 없습니다.</td> 
					</tr>
				</c:if>
				<c:forEach items="${list}" var="StockItemVo">
					<input type="hidden" value="${StockItemVo.item_no}">
					<tr>
						<td>${StockItemVo.category}</td>
						<td>${StockItemVo.item_name}</td>
						<td>${StockItemVo.item_price}</td>
						<td><input type="text" value="${StockItemVo.stock_count}" class="count_input" required></td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="stock_form_btn">등록 완료</button>
		
	</div>
</body>
</html>