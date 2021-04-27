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
		height:350px;
		
	}
</style>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$(function(){
		
		
	})
</script>
<div class="supervisorChart">
	<div class="supervisorChartBox">
		<div class="chartBox">
			<div class="chartTitle">해당 지점 월별 매출</div>
			<div class="chartContent">차트부분</div>
		</div>
		<div class="chartBox">
			<div class="chartTitle">해당 지점의 각 메뉴별 월별 매출</div>
			<div class="chartContent">차트부분</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>