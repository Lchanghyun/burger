<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stock.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>  
<script>
	$(function(){
		$(".stock_register_btn").on("click",function(){
			location.href="${pageContext.request.contextPath}/stock/register"			
		});
		
		$(".stock_plus_btn").on("click",function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/stock_plus"			
		})
		
		$(".stock_chart_btn").on("click",function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/chart"			
		})
		let msg = '<c:out value="${msg}"/>'
		if(msg!=""){
			Swal.fire({
				icon: 'info',
			   	title: msg
			})
		}
		
	})
</script>
<div class="whole_wrapper">
	<div class="page_title">재고 현황</div>
	<div class="btn_wrapper">
		<button class="stock_chart_btn">재고분석</button>
		<button class="stock_register_btn">재고등록</button>
		<button class="stock_plus_btn">자재 추가</button>
	</div>
	<hr class="hr_line">  
	<div class="list_border">
		<div class="list_all_wrapper">
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="${pageContext.request.contextPath}/stock/list?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/list?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="${pageContext.request.contextPath}/stock/list?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/list?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="${pageContext.request.contextPath}/stock/list?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/list?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="${pageContext.request.contextPath}/stock/list?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/list?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="${pageContext.request.contextPath}/stock/list?category=소모품" class="category_link select_category">소모품</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/list?category=소모품" class="category_link">소모품</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '단종'}">
						<a href="${pageContext.request.contextPath}/stock/list?category=단종" class="category_link select_category">단종</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/list?category=단종" class="category_link">단종</a>
					</c:otherwise>
				</c:choose>
			</div>
			<table class="stock_list_table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>자재명</th>
						<th>단가</th>
						<th>수량</th>
						<th>등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5">등록된 자재가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list}" var="StockItemVo">
						<tr>
							<td>${StockItemVo.category}</td>
							<td>${StockItemVo.item_name}</td>
							<td>${StockItemVo.item_price}원</td>
							<td>${StockItemVo.stock_count}</td>
							<td>${StockItemVo.stock_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div> 
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
