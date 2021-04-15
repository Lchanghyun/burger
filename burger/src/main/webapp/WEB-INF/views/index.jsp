<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버거머거</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		var branch_no;
		console.log(branch_no);
		$("#branch_select").change(function(){
			branch_no = $(this).val();
			console.log(branch_no)
		});		
		
 		$(".form").submit(function(e){
 			e.preventDefault()
			if(branch_no == null || branch_no == ""){
				alert("지점을 선택해주세요");
				return;
			}else{
				this.submit();
			}
		});
	});
</script>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<body>
	<form class="form" action="burger/order" method="get">
		<p>지점 검색</p>
		<select id="branch_select" name="branch_no">
				<option value="">지점선택</option>
			<c:forEach items="${list}" var="Branch">
				<option  value="${Branch.branch_no}" >${Branch.branch_name}</option>
			</c:forEach>
		</select>
			<button type="submit" id="btn_order">주문하기</button>
	</form>
</body>
</html>