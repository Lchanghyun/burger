<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
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
<div class="whole_wrapper">
	<div class="page_title">원자재 추가</div>
	<button class="item_list_btn">자재 목록</button>		 
	<hr class="hr_line">  
	<div class="list_border">
		<div class="item_list_wrapper">
			<div class="input_wrapper">
				<form action="${pageContext.request.contextPath}/item/register" method="POST" class="item_register_form">
					<select name="category" class="item_category_select">
						<option value="채소류">채소류</option>
						<option value="육류">육류</option>
						<option value="제과류">제과류</option>
						<option value="음료">음료</option>
						<option value="소모품">소모품</option>
					</select>
					<input type="text" class="item_name_input" name="item_name" placeholder="자재명" required>
					<input type="text" class="item_price_input" name="item_price" placeholder="단가" required>
					<input type="button" class="item_register_btn" value="등록">
				</form>				
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/>
