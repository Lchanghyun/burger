<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 수정</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){

		$(".item_list_btn").on("click", function(e){
			e.preventDefault()
			
			location.href="${pageContext.request.contextPath}/item/list"
		})
		
		let list=[]
		let item_no
		let item_price
		
		$(".price_input").on("blur", function(){
			
			item_price = $(this).val()
			item_no = $(this).parent().parent().prev().val()
			list_check(item_no)
			list.push({"item_no" : item_no, "item_price" : item_price})
			
		})
		function list_check(item_no){
			$.each(list, function(index, element){
				if(element.item_no === item_no){
					delete list[index]
					return false;
				}
			})
		}
		$(".item_edit_btn").on("click", function(e){
			e.preventDefault()
			
			let temp = JSON.stringify(list)
			console.log(list)
			
			$.ajax({
				url:"${pageContext.request.contextPath}/item/edit",
				type: "POST",
				data: {
					item_list : temp
				},
				success: function(resp){
					alert("수정 완료!")
					console.log("item_edit success!")
				}			
			})
			
			
		})
		
	})
</script>
<body>
	<div class="list_all_wrapper">
		<button class="item_list_btn">원자재 목록</button>
		<button class="item_edit_btn">수정 완료</button>
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
				<input type="hidden" value="${item.item_no}">
				<tr>
					<td>
						<select name="category" class="item_category">
							<c:if test="${item.category eq '채소류'}">
								<option value="채소류" selected>채소류</option>
								<option value="육류">육류</option>
								<option value="제과류">제과류</option>
								<option value="음료">음료</option>
								<option value="소모품">소모품</option>
							</c:if>
							<c:if test="${item.category eq '육류'}">
								<option value="육류" selected>육류</option>
								<option value="채소류">채소류</option>
								<option value="제과류">제과류</option>
								<option value="음료">음료</option>
								<option value="소모품">소모품</option>
							</c:if>
							<c:if test="${item.category eq '제과류'}">
								<option value="제과류" selected>제과류</option>
								<option value="채소류">채소류</option>
								<option value="육류">육류</option>
								<option value="음료">음료</option>
								<option value="소모품">소모품</option>
							</c:if>
							<c:if test="${item.category eq '음료'}">
								<option value="음료" selected>음료</option>
								<option value="채소류">채소류</option>
								<option value="육류">육류</option>
								<option value="제과류">제과류</option>
								<option value="소모품">소모품</option>
							</c:if>
							<c:if test="${item.category eq '소모품'}">
								<option value="소모품" selected>소모품</option>
								<option value="채소류">채소류</option>
								<option value="육류">육류</option>
								<option value="제과류">제과류</option>
								<option value="음료">음료</option>
							</c:if>
						</select>
					</td>
					<td><input type="text" value="${item.item_name}" class="name_input" required></td>
					<td><input type="text" value="${item.item_price}" class="price_input" required></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>