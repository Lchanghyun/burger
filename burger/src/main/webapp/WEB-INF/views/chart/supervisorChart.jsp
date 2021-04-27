<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.supervisorChart{
		height: calc(100% - 162px);
       	font-family: GmarketSansMedium;
       	padding : 10px 0 10px 10px; 
	}
	.supervisorChartBox{
		width:1300px;
		margin:auto;
	}
	.chartBox{
		width:1300px;
		height:380px;
		padding: 0 10px;
	}
	.chartTitle{
		height:25px;
		font-size:18px;
	}
	.chartContent{
		width: 1300px;  
		height:350px;
	}
	#menu_sales_chart{
		width: 1300px;
		height:350px; 
	}
	.menu_sales_date_search_wrapper{
		display : inline-block;
		float : right; 
	}
	.menu_sales_date_search_wrapper::after{
		content:"";
		display:block;
		clear:both;
	}
	.menu_sales_month,
	.menu_sales_year{
		border : 3px solid #EE4E34;
		font-size: 17px; 
		border-radius : 3px; 
	}
	.menu_sales_btn{
		background-color : #EE4E34;
		border : none;
		border-radius : 3px;
		width : 70px;
		height: 28px;
		color: white;
		font-size: 17px;
		margin-left : 10px; 
		font-weight : bold;
	}
	button{
		cursor: pointer;
	}
	button:focus{
		outline: none;
	}
</style>

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
			<div class="chartContent">차트부분</div>
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