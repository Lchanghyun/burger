<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stock.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>  
<script>
	$(function(){
		$(".stock_plus_btn").on("click", function(e){
			e.preventDefault();
			$("#item_no").val($(this).parents("tr").prev().val());
			$(".stock_plus_form").submit()
		})
		$(".stock_list_btn").on("click", function(e){
			e.preventDefault();
			
			location.href="${pageContext.request.contextPath}/stock/list";
		})
	})
</script> 
<div class="whole_wrapper">
	<div class="page_title">재고 추가</div>
	<button class="stock_list_btn stock_plus">재고현황</button>
	<hr class="hr_line">  
	<div class="list_border">
		<div class="list_all_wrapper">
			<form action="${pageContext.request.contextPath}/stock/stock_plus" method="post" class="stock_plus_form">	
				<input type="hidden" name="item_no" id="item_no">
			</form>
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=소모품" class="category_link select_category">소모품</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/stock_plus?category=소모품" class="category_link">소모품</a>
					</c:otherwise>
				</c:choose>
			</div>
			<table class="stock_list_table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>자재명</th>
						<th>단가</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4">추가할 자재가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list}" var="item">
						<input type="hidden" value="${item.item_no}">
						<tr>
							<td>${item.category}</td>
							<td>${item.item_name}</td>
							<td>${item.item_price}</td>
							<td><button class="stock_plus_btn">추가</button></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/>  
