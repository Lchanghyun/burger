<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 그래프</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
						'rgba(12, 159, 42, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)', 
						'rgba(54, 162, 235, 1)',
						'rgba(12, 59, 192, 0.2)',
						'rgba(12, 159, 42, 0.2)'
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
		$(".chart_iframe").bind("click",function(){
			location.href="${pageContext.request.contextPath}/stock/category_chart"
		})
	})
</script>
<style>
	.chart_all_wrapper{
		text-align: center; 
	}
	.bar_chart_wrapper{
		width: 500px;
		height : 300px;
		margin : 0 auto; 
	}
	.chart_iframe{
		width: 500px;
		height: 500px;
	}
</style>
<body>
	<div class="chart_all_wrapper">
		<div class="bar_chart_wrapper">
			<canvas id="stock_bar_chart"></canvas>
		</div>
		<div class="iframe_wrapper">	
			<iframe src="${pageContext.request.contextPath}/stock/category_chart" class="chart_iframe" scrolling="no"></iframe>
			<iframe src="${pageContext.request.contextPath}/stock/category_chart?category=육류" class="chart_iframe" scrolling="no"></iframe>
		</div>
	</div>
</body>
</html>