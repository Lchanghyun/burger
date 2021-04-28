<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ChartMonth.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/superChart.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 메뉴별 매출 추이(창현) -->
<script>
	$(function(){
		let menu_name = []
		let menu_sales = []
		
		$(".menu_sales_btn").on("click", function(){
			let menu_sales_year =$(".menu_sales_year").val()
			let menu_sales_month=$(".menu_sales_month").val()
			menu_sales=[]
			let canvas=$("#menu_sales_chart") 
			canvas.width=canvas.width
			$.ajax({ 
				url : "${pageContext.request.contextPath}/chart/menuSales",
				type : "POST",
				async: false,
				data : {
					year : menu_sales_year,
					month : menu_sales_month
				},
				success : function(resp){
					$.each(resp, function(index, element){
						if(element == null){
							menu_sales.push(0)
						}else{
							menu_sales.push(element.total_sales)
						}
					})
 					menu_sales_chart(menu_name, menu_sales)
				}
			})	
		})
		let sysdate = '<c:out value="${sysdate}"/>'
		
		let year = sysdate.split('/')[0]
		let month = sysdate.split('/')[1] 

		$(".menu_sales_year").val(year).prop("selected",true)
		$(".menu_sales_month").val("/"+month).prop("selected",true)
		<c:forEach items="${menu_list}" var="Menu">
			menu_name.push('${Menu.menu_name}')
		</c:forEach>
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
		menu_sales_chart(menu_name, menu_sales)
		
		function menu_sales_chart(menu_name, menu_sales){
			let menu_sales_bar_ctx = $("#menu_sales_chart")
			
			//(원자재별)막대 차트
			let menu_sales_bar_chart= new Chart(menu_sales_bar_ctx,{
				type : "bar",
				data : {
					labels : menu_name,
					datasets : [{
						label : 'Sales of Menu',
						data : menu_sales,
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
		}
	})
</script>
<div class="supervisorChart">
	<div class="supervisorChartBox">
		<div class="chartBox">
			<div class="chartTitle">각 지점별 월별 매출</div>
			<div class="chartContent">
				<div class="chart1">
					<div class="showChartAndInfo">
						<div class="dateSelect">
							<select name="year" class="YMSelect">
								<c:forEach var="y" begin="0" end="${nowyear-2015}" step="1">
									<option>${nowyear-y}</option>
								</c:forEach>
							</select>
							<span>년</span>
							<select name="month" class="YMSelect">
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
							<span>월</span>
							<input type="button" value="조회" class="SelectBtn1">
						</div>
						<div class="eachbranchTotalBox">
							<canvas id="eachbranchTotal" width="750" height="310"></canvas>
						</div>
					</div>
					
					<div class="ChartTableBox" id="mySuperChart1">
						<table class="ChartTable">
							<thead>
								<tr>
									<th width="20%">지점</th>
									<th width="20%">${prevyear}/${prevmonth}</th>
									<th width="20%">${nowyear}/${nowmonth}</th>
									<th width="40%">전월대비</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" begin="0" end="${length-1}" step="1">
								<c:set var="prevTotal" value="${prevList.get(i).getTotal()}"></c:set>
								<c:set var="incre" value="${totalchartList.get(i).getTotal() - prevTotal}"></c:set>
								<tr>
									<td>${totalchartList.get(i).getBranch_name()}</td>
									<td><fmt:formatNumber value="${prevTotal}" groupingUsed="true"/></td>
									<td><fmt:formatNumber value="${totalchartList.get(i).getTotal()}" groupingUsed="true"/></td>
									<c:if test="${incre>0}">
										<c:if test="${prevTotal != 0}">
											<td class="statusRed">▲ <fmt:formatNumber value="${incre}" groupingUsed="true"/> (+<fmt:formatNumber value="${(incre/prevTotal)*100}" pattern="##.00"/>%)</td>
										</c:if>
										<c:if test="${prevTotal == 0}">
											<td class="statusRed">▲ <fmt:formatNumber value="${incre}" groupingUsed="true"/> (+∞%)</td>
										</c:if>
									</c:if>
									<c:if test="${incre<0}">
										<c:if test="${prevTotal != 0}">
											<td class="statusBlue">▼ <fmt:formatNumber value="${incre}" groupingUsed="true"/> (<fmt:formatNumber value="${(incre/prevTotal)*100}" pattern="##.00"/>%)</td>
										</c:if>
										<c:if test="${prevTotal == 0}">
											<td class="statusBlue">▼ <fmt:formatNumber value="${incre}" groupingUsed="true"/> (-∞%)</td>
										</c:if>
									</c:if>
									<c:if test="${incre==0}">
										<td  class="statusZero">-</td>
									</c:if>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<script>
					let labels = [];
					let datas = [];
					let backColor = [];
					let totalChart = document.getElementById('eachbranchTotal');
					<c:forEach var="i" begin="1" end="${length}" step="1">
						backColor.push('#EE4E34');
					</c:forEach>
					
					<c:forEach var="list" items="${totalchartList}">
						labels.push('${list.branch_name}');
						datas.push('${list.total}');
					</c:forEach>
				</script>
				<script src="${pageContext.request.contextPath}/resources/chartMonth.js"></script>
			</div>
		</div>
		<div class="chartBox">
			<div class="chartTitle">
				메뉴별 매출
				<div class="menu_sales_date_search_wrapper">
					<select class="menu_sales_year">
						<c:set var="loop" value="false"/> 
						<c:forEach var="i" begin="0" end="1000" step="1" varStatus="status">						
							<c:if test="${not loop}">					 							
								<c:choose>
									<c:when test="${year-status.count+1 le 2017}">
										<c:set var="loop" value="true"/>
									</c:when>
									<c:otherwise>
										<option value="${year-status.count+1}">${year-status.count+1}년</option> 
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
					</select>
					<select class="menu_sales_month">
						<option value="/01">1월</option>
						<option value="/02">2월</option>
						<option value="/03">3월</option>
						<option value="/04">4월</option>
						<option value="/05">5월</option>
						<option value="/06">6월</option>
						<option value="/07">7월</option>
						<option value="/08">8월</option>
						<option value="/09">9월</option>
						<option value="/10">10월</option>
						<option value="/11">11월</option>
						<option value="/12">12월</option>
					</select>
					<button class="menu_sales_btn">조회</button>
				</div>
			</div>
			<div class="chartContent">
				<canvas id="menu_sales_chart"></canvas>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>