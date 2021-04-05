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

	})
</script>
<body>
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
			<tr>
				<form action="" method="post">
				<input type="hidden" value="${item.item_no}">
				<td>${item.category}</td>
				<td>${item.item_name}</td>
				<td>${item.item_price}</td>
				<td><button class="stock_add_btn">추가</button></td>
				</form>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>