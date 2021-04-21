<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.whole_wrapper{
		height : calc(100% - 162px) ;
	}
	.stock_list_table{
		margin : 10px auto;
		border : 1px solid black;
		border-collapse: collapse;
		width : 1100px;
	}
	.stock_list_table >thead>tr> th,
	.stock_list_table >tbody>tr> td {
		border-bottom : 1px solid black;
		padding : 12px;
		width : 240px;  
		text-align : center;
		font-size : 18px;
	}
	.list_all_wrapper{
		text-align : center;
	}
	.list_border{
		width : clamp(800px, 1600px, 2000px);
		height : 490px;
		border : 1px solid black;
		position : absolute; 
		top : 27%;
		left : clamp(210px, 12%, 12%);
		display : flex;
		flex-direction : cloumn;
		justify-content : center;
		padding : 30px 0 0 0;
	}
	.category_link{
		text-decoration : none;
		font-size : 25px; 
		color : black;
		padding : 0 40px; 
	}
	.select_category{
		font-size : 28px;
		font-weight : bold;
	}
	.category_link:hover{
		font-weight: bold;
	}
	button{
		cursor : pointer;
	}
	.hr_line{
		position : absolute;
		top : 20%;  
		left : 218px;
		display : block;
		width: 84%;   
		border : 2px solid;
	}
	.page_title{
		position : absolute;
		top : 15%;
		left : 220px;
		font-size : 40px;	
	}
	.stock_list_btn{
		border : none; 
		border-radius: 5px;
		width : 100px;
		padding : 3px;
		font-size : 18px;
		font-weight: bold;
		color : white;
		height : 35px;
		background-color : #EE4E34;
		position : absolute;
		top: clamp(10px, 16% , 500px);
		right: clamp(20px, 5%, 400px); 
	}
</style>
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
	<div class="btn_wrapper">
		<button class="stock_list_btn">재고현황</button>
	</div>
	<hr class="hr_line">  
	<div class="list_border">
		<div class="list_all_wrapper">
			<form action="stock_plus" method="post" class="stock_plus_form">	
				<input type="hidden" name="item_no" id="item_no">
			</form>
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="stock_plus?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="stock_plus?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="stock_plus?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="stock_plus?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="stock_plus?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="stock_plus?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="stock_plus?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="stock_plus?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="stock_plus?category=소모품" class="category_link" style="font-weight: bold; font-size: 16px">소모품</a>
					</c:when>
					<c:otherwise>
						<a href="stock_plus?category=소모품" class="category_link">소모품</a>
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
