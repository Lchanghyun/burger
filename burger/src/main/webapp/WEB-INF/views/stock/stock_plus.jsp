<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".stock_plus_btn").on("click", function(e){
			e.preventDefault();
			$("#item_no").val($(this).parents("tr").prev().val());
			$(".stock_plus_form").submit()
		})
	})
</script>
<body>
	<form action="stock_plus" method="post" class="stock_plus_form">	
		<input type="hidden" name="item_no" id="item_no">
	</form>
	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>자재명</th>
				<th>단가</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<input type="hidden" value="${item.item_no}">
				<tr>
					<td>${item.category}</td>
					<td>${item.item_name}</td>
					<td>${item.item_price}</td>
					<td><button class="stock_plus_btn">추가</button></td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>	
</body>
</html>