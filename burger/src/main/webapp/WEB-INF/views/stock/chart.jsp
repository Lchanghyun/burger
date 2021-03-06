<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stock.css"> 
 
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>  
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(function(){
	
		let item_name = []
		let stock_count = []
		
		<c:forEach items="${bar_list}" var="StockItemVo">
			item_name.push('${StockItemVo.item_name}');
			stock_count.push('${StockItemVo.stock_count}')
		</c:forEach>
		
		let bar_ctx = $("#stock_bar_chart")
		
		//(원자재별)막대 차트
		let stock_bar_chart= new Chart(bar_ctx,{
			type : "bar",
			data : {
				labels : item_name,
				datasets : [{
					label : 'Number of Stock',
					data : stock_count,
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)', 
						'rgba(54, 162, 235, 0.2)',
						'rgba(12, 59, 192, 0.2)',
						'rgba(12, 159, 42, 0.2)',
						'rgba(103, 19, 142, 0.2)',
						'rgba(103, 179, 1, 0.2)',
						'rgba(10, 179, 187, 0.2)',
						'rgba(188, 1, 87, 0.2)',
						'rgba(50, 119, 187, 0.2)',
						'rgba(199, 179, 7, 0.2)',
						'rgba(180, 179, 187, 0.2)',
						'rgba(180, 12, 17, 0.2)',
						'rgba(13, 18, 187, 0.2)',
						'rgba(18, 179, 1, 0.2)',
						'rgba(18, 19, 171, 0.2)',
						'rgba(198, 19, 21, 0.2)',
						'rgba(138, 179, 71, 0.2)',
						'rgba(255, 99, 132, 0.2)', 
						'rgba(54, 162, 235, 0.2)',
						'rgba(12, 59, 192, 0.2)',
						'rgba(12, 159, 42, 0.2)',
						'rgba(103, 19, 142, 0.2)',
						'rgba(103, 179, 1, 0.2)',
						'rgba(10, 179, 187, 0.2)',
						'rgba(188, 1, 87, 0.2)',
						'rgba(50, 119, 187, 0.2)',
						'rgba(199, 179, 7, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)', 
						'rgba(54, 162, 235, 1)',
						'rgba(12, 59, 192, 1)',
						'rgba(12, 159, 42, 1)',
						'rgba(103, 19, 142, 1)',
						'rgba(103, 179, 1, 1)',
						'rgba(10, 179, 187, 1)',
						'rgba(188, 1, 87, 1)',
						'rgba(50, 119, 187, 1)',
						'rgba(199, 179, 7, 1)',
						'rgba(180, 179, 187, 1)',
						'rgba(180, 12, 17, 1)',
						'rgba(13, 18, 187, 1)',
						'rgba(18, 179, 1, 1)',
						'rgba(18, 19, 171, 1)',
						'rgba(198, 19, 21, 1)',
						'rgba(138, 179, 71, 1)',
						'rgba(255, 99, 132, 1)', 
						'rgba(54, 162, 235, 1)',
						'rgba(12, 59, 192, 1)',
						'rgba(12, 159, 42, 1)',
						'rgba(103, 19, 142, 1)',
						'rgba(103, 179, 1, 1)',
						'rgba(10, 179, 187, 1)',
						'rgba(188, 1, 87, 1)',
						'rgba(50, 119, 187, 1)',
						'rgba(199, 179, 7, 1)'
					],
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
		
		$(".category_chart_btn").on("click",function(){
			location.href="${pageContext.request.contextPath}/stock/category_chart"
		})
		
		$(".stock_list_btn").on("click", function(e){
			e.preventDefault()
			location.href="${pageContext.request.contextPath}/stock/list"			
		})
	})
</script>
<div class="whole_wrapper">
	<div class="page_title">재고 분석</div>
	<div class="chart_btn_wrapper">
		<button class="category_chart_btn">카테고리별 차트</button> 
		<button class="stock_list_btn">재고 현황</button>
	</div>
	<hr class="hr_line"> 
	<div class="chart_border"> 
		<div class="bar_chart_wrapper">
			<canvas id="stock_bar_chart"></canvas> 
		</div> 
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
