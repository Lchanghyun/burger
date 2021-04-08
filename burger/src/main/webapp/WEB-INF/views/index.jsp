<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		var branch_no = $("#branch_select");
		$("#branch_select").change(function(){
			branch_no = $(this).val();
			console.log(branch_no)
		});		
		$("#btn_order").click(function(){
			if(branch_no == null){
				alert("지점을 선택해주세요");
			}else{
				self.location = "burger/order?branch_no="+branch_no;				
			}
		});
	});
</script>
</head>
<body>
	<p>지점 검색</p>
	<select id="branch_select">
			<option value="">지점선택</option>
		<c:forEach items="${list}" var="Branch">
			<option class="branch_no${Branch.branch_no}"  value="${Branch.branch_no}" >${Branch.branch_name}</option>
		</c:forEach>
	</select>
		<button id="btn_order">주문하기</button>
</body>
</html>