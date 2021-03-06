<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stock.css"> 
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(function(){
//품목별(일주일간) 선 그래프
		
		let chart_date=[]
		<c:forEach items="${chart_date}" var="date">
			chart_date.push('${date}');
		</c:forEach>
		
		let week_list=[]
		let week_stock =[]
		let week_name = []
		
		<c:forEach items="${week_list}" var="list">
			<c:forEach items="${list}" var="StockItemVo">
				week_stock.push("${StockItemVo.stock_count}")
			</c:forEach>
				week_list.push(week_stock)
				week_stock=[]
		</c:forEach>
				
		console.log(week_list)

		<c:forEach items="${item_list}" var="item">
			week_name.push("${item.item_name}")
		</c:forEach>
		
		let size = week_name.length
		let template = $("#chart_template").html()
		console.log(week_name)
		for(let i =0; i<size; i++ ){
			
			$(".category_chart_wrapper").append($(template))
			$(".category_chart_wrapper").children().last().find("span").text(week_name[i]) 
			
			
			let week_chart= new Chart($(".category_chart_wrapper").children().last().find("canvas"),{
				type : "line",
				data : {
					labels : chart_date,//x축 데이터
					datasets : [{
						label : 'Last Week Stock',
						data : week_list[i], //y축 데이터
						backgroundColor: 'transparent',
						borderColor: 'blue',
						borderWidth : 1
					}]
				},
				options: { 
					scales: { 
						yAxes: [{ 
							ticks: { 
								beginAtZero: true 
							} 
						}] 
					} 
				}
			})
		}
		$(".stock_chart_btn").on("click",function(){
			location.href="${pageContext.request.contextPath}/stock/chart"
		})
		
		$(".stock_list_btn").on("click", function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/list"			
		})
	})
</script>
<script id="chart_template" type="text/template">
	<div class="canvas_wrapper">	
		<span></span>
		<canvas></canvas>
	</div>
</script>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>  
<div class="whole_wrapper">
	<div class="page_title">카테고리별 재고 분석</div>
	<div class="btn_wrapper two_btn_wrapper">
		<button class="stock_chart_btn">재고 분석</button> 
		<button class="stock_list_btn">재고 현황</button>
	</div>
	<hr class="hr_line"> 
	<div class="chart_border"> 
		<div class="category_chart_wrapper" >
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=소모품" class="category_link select_category">소모품</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/stock/category_chart?category=소모품" class="category_link">소모품</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
