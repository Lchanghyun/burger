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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
		
		let msg = '<c:out value="${msg}"/>';

		if(msg!==""){
	    	Swal.fire({ icon: 'error', 
            	title: msg, 
      		});
		}
	})
</script>
<style>
	.item_list_wrapper{
		text-align : center; 
	}
	.item_name_input{
		padding : 5px;
		font-size : 15px;
		width : 120px;
		text-align : right; 
	}
	.item_price_input{
		padding : 5px;
		font-size : 15px;
		width : 50px;
		text-align : right; 
	}
	.item_category_select{
		padding : 5px;
		font-size : 15px; 
	}
	.input_wrapper{
		margin : 10px auto;
	}
</style>
<body> 
	<div class="item_list_wrapper">
		<button class="item_list_btn">자재현황</button>
		<div class="input_wrapper">
			<form action="register" method="POST" class="item_register_form">
				<select name="category" class="item_category_select">
					<option value="채소류">채소류</option>
					<option value="육류">육류</option>
					<option value="제과류">제과류</option>
					<option value="음료">음료</option>
					<option value="소모품">소모품</option>
				</select>
				<input type="text" class="item_name_input" name="item_name" placeholder="자재명" required>
				<input type="text" class="item_price_input" name="item_price" placeholder="단가" required>
			</form>
		</div>
		<button class="item_register_btn">등록</button>
	</div>
</body>
</html>