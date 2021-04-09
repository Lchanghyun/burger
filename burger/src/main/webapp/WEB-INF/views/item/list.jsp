<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 목록</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".item_register_btn").on("click", function(){
			location.href="${pageContext.request.contextPath}/item/register"
		})
		
		$(".item_edit_btn").on("click", function(){
			location.href="${pageContext.request.contextPath}/item/edit"
		})
		
		let item_no
		
		$(".item_delete_btn").on("click", function(e){
			e.preventDefault();
			
			console.log($(this).parent().parent().prev().val())
			
			item_no = $(this).parent().parent().prev().val() 
			
			$.ajax({
				url: "${pageContext.request.contextPath}/item/",
				type: "POST",
				data: {
					item_no : item_no 
				},
				success: function(resp){
					console.log("item_edit success!")
				}
			})
		})
	})
</script>
<body>
	<div class="list_all_wrapper">
		<button class="item_register_btn">자재추가</button>
		<button class="item_edit_btn">수정</button>
		<table class="list_table">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>자재명</th>
					<th>단가</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.category}</td>
					<td>${item.item_name}</td>
					<td>${item.item_price}</td>
					<td><button class="item_delete_btn">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>