<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 추가</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".item_register_btn").on("click", function(e){
			e.preventDefault();
			
			$(".item_register_form").submit()
		})
		
		$(".item_list_btn").on("click", function(e){
			e.preventDefault()

			location.href="${pageContext.request.contextPath}/item/list"
		})
	})
</script>
<body>
	<div class="item_lsit_wrapper">
		<button class="item_list_btn">자재현황</button>
		<form action="register" method="POST" class="item_register_form">
			<select name="category">
				<option value="채소류">채소류</option>
				<option value="육류">육류</option>
				<option value="제과류">제과류</option>
				<option value="음료">음료</option>
				<option value="소모품">소모품</option>
			</select>
			<input type="text" name="item_name" placeholder="자재명" required>
			<input type="text" name="item_price" placeholder="단가" required>
		</form>
		<button class="item_register_btn">등록</button>
	</div>
</body>
</html>