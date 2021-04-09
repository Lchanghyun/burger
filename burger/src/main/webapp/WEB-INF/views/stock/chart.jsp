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
						'rgba(54, 162, 235, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)', 
						'rgba(54, 162, 235, 1)'
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
		
		let line_ctx = $("#stock_line_chart")
		//품목별(일주일간) 선 그래프
		
		let chart_date=[]
		<c:forEach items="${chart_date}" var="date">
			chart_date.push('${date}');
			
		</c:forEach>
		console.log(chart_date)
		let stock_line_chart= new Chart(line_ctx,{
			type : "line",
			data : {
				labels : stock_date,
				datasets : [{
					label : title,
					data : stock_count,
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
	})
</script>
<style>
	.chart_wrapper{
		width: 800px;
		height: 600px;
	}
</style>
<body>
	<div class="chart_wrapper">
		<canvas id="stock_bar_chart"></canvas>
		<canvas id="stock_line_chart"></canvas>
	</div>
</body>
</html>