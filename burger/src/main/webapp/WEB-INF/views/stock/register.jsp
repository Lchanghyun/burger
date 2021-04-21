<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.whole_wrapper{
		height : calc(100% - 162px) ;
	}
	.count_input{
		width: 1.5rem;
		text-align: center;
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
		padding : 30px 0; 
		overflow: auto;
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
	button{
		cursor : pointer;
	}
	.stock_list_btn,
	.stock_plus_btn,
	.stock_form_btn{
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
	.stock_form_btn{
		position : absolute;
		right: clamp(200px, 15%, 500px); 
		cursor : pointer;
	}
	.count_input{
		width : 50px;
		padding : 5px; 
		text-align: right;
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
	.btn_wrapper{
		position : absolute;
		top: clamp(10px, 16% , 500px);
		left: clamp(600px, 84%, 1700px);  
		width : 240px;
	}
</style>
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
