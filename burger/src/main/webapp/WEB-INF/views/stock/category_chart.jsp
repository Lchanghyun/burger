<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
			
			$(".chart_wrapper").append($(template))
			$(".chart_wrapper").children().last().find("span").text(week_name[i])
			
			
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
	<div class="canvas_wrapper">	
		<span></span>
		<canvas></canvas>
	</div>
</script>
<style>
	.chart_wrapper{
		width : clamp(100px, 100%, 100%); 
		text-align: center;
		margin : 0 auto;
	}
	.canvas_wrapper{
		width : clamp(200px, 400px, 400px);
		height: clamp(200px, 100%, 300px);
		display: inline-block;
		text-align: center;
		margin : 0 auto;
	}

</style>
<body>
	<div class="chart_wrapper" >
		<div class="category_link">
		<a href="category_chart?category=채소류">채소류</a>
		<a href="category_chart?category=육류">육류</a>
		<a href="category_chart?category=제과류">제과류</a>
		<a href="category_chart?category=음료">음료</a>
		<a href="category_chart?category=소모품">소모품</a>
		</div>
		<br>
	</div>
</body>
</html>