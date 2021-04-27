<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/todayorder.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
<div class="today">
	<div class="TodayChartTitle">최근 일주일간의 카테고리별 주문 추이</div>
	<div class="chartBox">
		<div>
			<form id="selectForm" action="chart" method="post">
				<div class="selectBox">
					<select class="selectCategory" name="category">
					<c:if test="${category eq '햄버거'}">
						<option value="햄버거" selected>햄버거</option>
						<option value="사이드">사이드</option>
						<option value="음료">음료</option>
					</c:if>
					<c:if test="${category eq '사이드'}">
						<option value="햄버거">햄버거</option>
						<option value="사이드" selected>사이드</option>
						<option value="음료">음료</option>
					</c:if>
					<c:if test="${category eq '음료'}">
						<option value="햄버거">햄버거</option>
						<option value="사이드">사이드</option>
						<option value="음료" selected>음료</option>
					</c:if>
					</select>
				</div>
			</form>
			<div id="chart">
				<canvas id="menuChart" width="450" height="450"></canvas>
			</div>
		</div>
		<div class="detailChart">
			<c:forEach var="i" begin="1" end="${length}" step="1">
				<div class="dChart">
					<canvas id="menuDetailChart${i}" width="400" height="300"></canvas>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
	
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script>
		$(function(){
			$(".selectCategory").change(function(){
				$("#selectForm").submit();
			})
		})
		let labels = [];
		let values = [];
		let detailLabels = [];
		let detailValues = [];
		let backColor = [
			  'rgb(255, 153, 153)',
		      'rgb(204, 51, 51)',
		      'rgb(255, 204, 51)',
		      'rgb(204, 204, 000)',
		      'rgb(153, 204, 102)',
		      'rgb(102, 153, 102)',
		      'rgb(153, 204, 255)',
		      'rgb(51, 153, 204)',
		      'rgb(204, 204, 204)',
		      'rgb(204, 153, 255)'
		];
		
		<c:forEach var="data" items="${menuChart}">
			labels.push('${data.menuName}');
			values.push('${data.percent}');
		</c:forEach>
		
		let menuChart = document.getElementById('menuChart');
		
		const menudata = {
			labels:labels,
			datasets:[{
				data:values,
				backgroundColor:backColor
			}]
		};
		
		let chart  = new Chart(menuChart,{
			type: 'polarArea',
			data: menudata,
			options:{
				title:{
					display: true,
					text: '단위 : %',
					position: 'top',
					fontSize:16,
					fontFamily: "GmarketSansMedium"
				},
				legend:{
					position:'bottom',
					labels:{
						fontSize:16,
						fontFamily: "GmarketSansMedium"
					}
				},
				scale:{
					display:false
				}
			}
		});
		
		$.each(labels,function(index, name){
			let menuDetailChart = document.getElementById('menuDetailChart'+(index+1));
			$.ajax({
				url:"detailChart",
				type:"POST",
				data:{
					menu_name: name
				},
				success:function(data){
					detailLabels = [];
					detailValues = [];
					let total=0;
					$.each(JSON.parse(data), function(index, info){
						detailLabels.push(info.date);
						detailValues.push(info.count);
						total += info.count;
					});
					const menuDetaildata = {
						labels: detailLabels,
						datasets:[{
							label: name+' / 총 수량: '+total,
							data: detailValues,
							fill:true,
							backgroundColor: backColor[index],
							borderColor: backColor[index],
							tension:0.5
						}]
					};
					let detailchart = new Chart(menuDetailChart,{
						type: 'line',
						data: menuDetaildata,
						options:{
							legend:{
								labels:{
									fontSize:18,
									fontColor:backColor[index],
									fontFamily: "GmarketSansMedium"
								}
							},
							scales:{
								xAxes:[{
									ticks:{
										fontSize:15
									}
								}],
								yAxes: [{
									ticks:{
										beginAtZero: true,
										stepSize:10,
										max:100,
										fontSize:15,
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
	</script>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>