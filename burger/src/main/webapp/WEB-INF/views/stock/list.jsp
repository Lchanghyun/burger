<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
	.stock_register_btn,
	.stock_plus_btn{
		border : none;
		border-radius: 5px;
		width : 100px;
		padding : 3px;
		font-size : 18px;
		font-weight: bold;
		color : white;
		background-color : #EE4E34; 
		margin-right : 10px;  
		height : 35px;
	}
	.btn_wrapper{
		position : absolute;
		top: clamp(10px, 16% , 500px);
		left: clamp(600px, 84%, 1700px);  
		width : 240px;
	}
</style>
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
		<button class="stock_register_btn">재고등록</button>
		<button class="stock_plus_btn">자재 추가</button>
	</div>
	<hr class="hr_line">  
	<div class="list_border">
		<div class="list_all_wrapper">
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="list?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="list?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="list?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="list?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="list?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="list?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="list?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="list?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="list?category=소모품" class="category_link select_category">소모품</a>
					</c:when>
					<c:otherwise>
						<a href="list?category=소모품" class="category_link">소모품</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '단종'}">
						<a href="list?category=단종" class="category_link select_category">단종</a>
					</c:when>
					<c:otherwise>
						<a href="list?category=단종" class="category_link">단종</a>
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
