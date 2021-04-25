<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stock.css">
<c:import url="/WEB-INF/views/template/managerHeader.jsp"/> 
<script>
	$(function(){

		$(".stock_plus_btn").on("click",function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/stock_plus"			
		})
		
		$(".stock_list_btn").on("click", function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/list"			
		})
		
	})
</script>
<div class="whole_wrapper">
	<div class="page_title">일일재고 등록</div>
	<div class="btn_wrapper">
		<button class="stock_list_btn">재고 현황</button>
		<button class="stock_plus_btn">자재 추가</button>
	</div>
	<hr class="hr_line">  
	<div class="list_border">
		<form action="register" method="post" class="stock_register_form">
		<input type="hidden" name="size" value="${list.size()}">
		<table class="stock_list_table">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>자재명</th>
					<th>단가</th>
					<th>수량</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">등록된 자재가 없습니다.</td> 
					</tr>
				</c:if>
				<c:set var="index" value="0"/>
				<c:forEach items="${list}" var="StockItemVo">
					<c:set var="index" value="${index+1}"/>
					<input type="hidden" name="stockItemVo_list[${index}].item_no" value="${StockItemVo.item_no}">
					<tr>
						<td>${StockItemVo.category}</td>
						<td>${StockItemVo.item_name}</td>
						<td>${StockItemVo.item_price}원</td>
						<td><input type="text" name="stockItemVo_list[${index}].stock_count" class="count_input" required></td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<input type="submit" class="stock_form_btn" value="등록 완료">
		</form>		
	</div>
</div>
<c:import url="/WEB-INF/views/template/managerFooter.jsp"/>  
