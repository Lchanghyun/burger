<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
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
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<form class="form" action="order" method="get">
		<p style="margin: 0;">지점 검색</p><br><br>
		<select id="branch_select" name="branch_no">
				<option>지점선택</option>
			<c:forEach items="${list}" var="Branch">
				<option  value="${Branch.branch_no}" >${Branch.branch_name}</option>
			</c:forEach>
		</select>
			<button type="submit" id="btn_order">주문하기</button>
	</form>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
