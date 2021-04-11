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
			let line_ctx = $("#stock_line_chart")
			
			$(".chart_wrapper").append($(template))
			$(".chart_wrapper").children().last().find("h1").text(week_name[i])
			
			
			let week_chart= new Chart($(".chart_wrapper").children().last().find("canvas"),{
				type : "line",
				data : {
					labels : chart_date,
					datasets : [{
						label : 'Last Week Stock',
						data : week_list[i],
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
	})
</script>
<script id="chart_template" type="text/template">
	<div>	
		<h1></h1>
		<canvas></canvas>
	</div>
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
		<br>
		<a href="chart?category=채소류">채소류</a>
		<a href="chart?category=육류">육류</a>
		<a href="chart?category=제과류">제과류</a>
		<a href="chart?category=음료">음료</a>
		<a href="chart?category=소모품">소모품</a>
	</div>
</body>
</html>