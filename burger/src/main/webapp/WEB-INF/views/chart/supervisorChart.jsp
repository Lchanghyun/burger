<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ChartMonth.css">
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
		height:350px;
		
	}
</style>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>

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
				<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
					
					const eachbranchData = {
							labels:labels,
							datasets:[{
								data:datas,
								backgroundColor: backColor
							}]
						};
						let chart  = new Chart(totalChart,{
							type: 'bar',
							data: eachbranchData,
							options:{
								responsive: false,
								legend:{
									display:false
								},
								scales:{
									xAxes:[{
										ticks:{
											fontSize:16,
											fontFamily: "GmarketSansMedium"
										}
									}],
									yAxes: [{
										afterFit: function(scaleInstance){
											scaleInstance.width = 80;
										},
										ticks:{
											beginAtZero: true,
											fontFamily: "GmarketSansMedium",
											stepSize:100000,
											max:1000000,
											callback: function(label, index, labels){
												return Intl.NumberFormat().format(label);
											}
										}
									}]
								}
							}
						});
					
					$(function(){
						$("option").each(function(index, ele){
							if($(this).val() === '${nowyear}'){
								$(this).prop("selected",true);
							}
							if($(this).val() === '${nowmonth}'){
								$(this).prop("selected",true);
							}
						});
						$(".SelectBtn1").click(function(){
							let selectYear = $("select[name=year]").val();
							let selectMonth = $("select[name=month]").val();
							$.ajax({
								url: "monthtotalbranchChart",
								type: "POST",
								data: {
									year: selectYear,
									month: selectMonth
								},
								success: function(res){
									console.log(res);
									$("#mySuperChart1").children().remove();
									let table = 
									'<table class="ChartTable">'+
										'<thead>'+
											'<tr>'+
												'<th width="20%">지점</th>'+
												'<th width="20%">'+res.prevyear+'/'+res.prevmonth+'</th>'+
												'<th width="20%">'+res.nowyear+'/'+res.nowmonth+'</th>'+
												'<th width="40%">전월대비</th>'+
											'</tr>'+
										'</thead>'+
										'<tbody id="contentInsert">'+
										'</tbody>'+
									'</table>';
									$("#mySuperChart1").append(table);
									let content1 = "";
									let content2 = "";
									let join = "";
									backColor = [];
									labels = [];
									datas = [];
									for(let i=0; i<res.length; i++){
											backColor.push('#EE4E34');
											labels.push(res.totalchartList[i].branch_name);
											datas.push(res.totalchartList[i].total);
											let incre = res.totalchartList[i].total - res.prevList[i].total;
											let prevTotal = res.prevList[i].total;
										content1 = 
											'<tr>'+
											'<td>'+res.totalchartList[i].branch_name+'</td>'+
											'<td>'+prevTotal.toLocaleString('en-US')+'</td>'+
											'<td>'+res.totalchartList[i].total.toLocaleString('en-US')+'</td>';
											if(incre > 0){
												if(prevTotal != 0){
													content2 =
														'<td class="statusRed">▲ '+incre.toLocaleString('en-US')+' (+'+((incre/prevTotal)*100).toFixed(2)+'%)</td></tr>';
												}
												else{
													content2 = '<td class="statusRed">▲ '+incre.toLocaleString('en-US')+' (+∞%)</td></tr>';
												}
											}
											else if(incre < 0){
												if(prevTotal != 0){
													content2 =
														'<td class="statusBlue">▼ '+incre.toLocaleString('en-US')+' ('+((incre/prevTotal)*100).toFixed(2)+'%)</td></tr>';
												}
												else{
													content2 = '<td class="statusBlue">▼ '+incre.toLocaleString('en-US')+' (-∞%)</td></tr>';
												}
											}
											else{
												content2 = '<td  class="statusZero">-</td></tr>';
											}
										join = content1 + content2;
										$("#contentInsert").append(join);
									};
									
									const eachbranchData = {
										labels:labels,
										datasets:[{
											data:datas,
											backgroundColor: backColor
										}]
									};
									let chart  = new Chart(totalChart,{
										type: 'bar',
										data: eachbranchData,
										options:{
											responsive: false,
											legend:{
												display:false
											},
											scales:{
												xAxes:[{
													ticks:{
														fontSize:16,
														fontFamily: "GmarketSansMedium"
													}
												}],
												yAxes: [{
													afterFit: function(scaleInstance){
														scaleInstance.width = 80;
													},
													ticks:{
														beginAtZero: true,
														fontFamily: "GmarketSansMedium",
														stepSize:100000,
														max:1000000,
														callback: function(label, index, labels){
															return Intl.NumberFormat().format(label);
														}
													}
												}]
											}
										}
									});
								}
							});
						});
					})
					
					
				</script>
			</div>
		</div>
		<div class="chartBox">
			<div class="chartTitle">모든 지점의 각 메뉴별 월별 매출</div>
			<div class="chartContent">차트부분</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>