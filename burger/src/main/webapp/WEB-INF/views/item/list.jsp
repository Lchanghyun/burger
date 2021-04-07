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
<body>
	<div class="list_all_wrapper">
		<button>자재추가</button>
		<button>수정</button>
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
					<td><button>삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>