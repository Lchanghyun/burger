<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.yearChoose{
		position: absolute;
    	left: 970px;
    	
	}
	.yearChooser{
		width: 74px;
	    height: 24px;
	    font-size: 14px;
	    border-radius: 3px;
	    font-family: GmarketSansMedium;
	}
	#branch_total_chart, #branch_burger_chart{
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

	
	
	$(".yearChooser").on("change",function(){
		let yearChooser = $(".yearChooser").val()
		let totalSales = [];
		let salesTime = []; 
		$.ajax({
				url: "${pageContext.request.contextPath}/chart/totalYear",
				type: "POST",
				async: false,
				data:{
					year : yearChooser
				},
				success :function(list){
					$.each(list, function( index, value ) {
						if(value == null){
							return false;
						}
						else{
						salesTime.push(value.sales_time)
						totalSales.push(value.total_sales)
	                       console.log( index + " : " + salesTime );
	                       console.log( index + " : " + totalSales );
					}
	          })
			ctxChart(salesTime, totalSales)
			}
		})
	})
	
	<c:forEach items="${Totalsales}" var ="sales">
	 	salesTime.push('${sales.sales_time}')
	 	totalSales.push('${sales.total_sales}')
	</c:forEach> 
	 	ctxChart(salesTime, totalSales)
	 	
	 function ctxChart(salesTime, totalSales){
		let ctx = document.getElementById('branch_total_chart').getContext('2d'); 
		let chart = new Chart(ctx, { 
			
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
						fontFamily: "GmarketSansMedium"
					}
				}],
				xAxes: [{
					ticks: {
						fontSize : 16,
						fontFamily: "GmarketSansMedium"
					}
				}]  
			}
		} 
		})
		}
	 })
</script>
<script>
	$(function(){
		let branchMenu_name = [];
		let branchMenu_salse = [];
		let menu_price;
		let menu_total_count;
		
		<c:choose>
			<c:when test="${empty branch_menu_sales}">
				branchMenu_salse.push(0);
			</c:when>
			<c:otherwise>
				<c:forEach items="${branch_menu_sales}" var="BranchMenuChart">
					branchMenu_name.push('${BranchMenuChart.menu_name}')
					branchMenu_salse.push('${BranchMenuChart.menu_price}*${BranchMenuChart.menu_total_count}')
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		branch_burger_chart(branchMenu_name, branchMenu_salse)
		
		function branch_burger_chart(branchMenu_name, branchMenu_salse){
			let branch_burger_chart_ctx = $("#branch_burger_chart")
			
			let branch_burger_bar_chart= new Chart(branch_burger_chart_ctx,{
				type : "bar",
				data : {
					labels : branchMenu_name,
					datasets : [{
						label : 'Sales of Menu',
						data : branchMenu_salse,
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
					legend:{
							display : false
					},
					scales: { 
						yAxes: [{ 
							ticks: { 
								beginAtZero: true,
								fontFamily: "GmarketSansMedium"
							} 
						}],
						xAxes: [{
							ticks: {
								fontFamily: "GmarketSansMedium",
								fontSize : 12
							}
						}]
					} 
				}
			})
		}
	})
</script>
<div class="supervisorChart">
	<div class="supervisorChartBox">
		<div class="chartBox">
			<div class="chartTitle">지점 월별 매출</div>
			<div class="chartContent">
				<div class="yearChoose">
					<select class="yearChooser">
						<c:forEach begin="0" end="3" var="g" step="1" >
							<option value="${Tyear-g}">${Tyear-g}년</option>
						</c:forEach>
					</select>
				</div>
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
</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>