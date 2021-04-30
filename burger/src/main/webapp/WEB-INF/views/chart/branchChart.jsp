<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.supervisorChart{
		height: calc(100% - 162px);
       	font-family: GmarketSansMedium;
       	padding:10px;
	}
	.supervisorChartBox{
		width:1300px;
		margin:auto;
	}
	.chartBox{
		width:1300px;
		height:380px;
		border: 1px solid black;
		padding: 0 10px;
		margin-bottom:10px;
	}
	.chartTitle{
		height:25px;
		font-size:18px;
	}
	.chartContent{
		width:1300px;
		height:350px;
		
	}
	#branch_total_chart{
		width:1100px; 
		height:350px;
		margin: auto;
	}
</style>

<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

	$(function(){
		
		let totalSales = [];
		let salesTime = []; 
		let year = "";
	
		<c:forEach items="${Totalsales}" var ="sales">
		 	salesTime.push('${sales.sales_time}')
		 	totalSales.push('${sales.total_sales}')
		</c:forEach> 
		 	
			
			var ctx = document.getElementById('branch_total_chart').getContext('2d'); 
			var chart = new Chart(ctx, { 
				
				type: 'line', 
				data: {
					labels: salesTime,
					datasets: [{
						label: "매출 추이",
						borderColor: "#EE4E34",
			            backgroundColor: "#EE4E34",
			            fill: false, 
			            lineTension: 0,
						data: totalSales 
					}] 
			}, 
			// 옵션
			options: {
				legend: {
					labels: {
						fontColor: "black",
						fontSize: 18
					}
				},
					responsive: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true,
							fontSize : 16,
						}
					}],
					xAxes: [{
						ticks: {
							fontSize : 16,
				}
			}]  
		}
	  } 
	})
})
</script>
<script>
	$(function(){
		let branchMenu_name = [];
		let branchMenu_salse = [];
		
		<c:forEach items="${menu_sales}" var="MenuBranchMenuGoodsVo">	
			<c:choose>
 				<c:when test="${MenuBranchMenuGoodsVo eq null}">
 					menu_sales.push(0)
				</c:when>
				<c:otherwise>
					menu_sales.push('${MenuBranchMenuGoodsVo.total_sales}')
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
	})
</script>
<div class="supervisorChart">
	<div class="supervisorChartBox">
		<div class="chartBox">
			<div class="chartTitle">지점 월별 매출</div>
			<div class="chartContent">
				<canvas id = "branch_total_chart"></canvas>
			</div>
		</div>
		<div class="chartBox">
			<div class="chartTitle">해당 지점의 각 메뉴별 월별 매출</div>
			<div class="chartContent">
				<canvas id="branch_burger_chart"></canvas>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty branch_menu_sales}">
			
		</c:when>
	</c:choose>
</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>