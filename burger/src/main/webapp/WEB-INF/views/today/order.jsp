<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문현황</title>
<style>
    html, body {
        margin: 0;
        padding: 0;
    }
    * {
        box-sizing: border-box;
    }
    .box{
        width:100vw;
        height:100vh;
        display: flex;
    }
    .menu{
        width:200px;
        height:100%;
        border-right: 1px solid black;
    }
    .orderstatus{
        width:600px;
        height:800px;
        margin:auto;
        border:1px solid green;
        padding:0 1.5rem;
        overflow:auto;
    }
    .orderOne{
        margin:1.5rem 0;
        border-bottom:1px dotted gray;
        height:200px;
    }
    .number-info{
        display: flex;
        font-size: 20px;
        font-weight:bold;
        padding:0 10px;
    }
    .order-number{
        width:300px;
    }
    .orderTimeAndStatus{
    	display:flex;
    	justify-content: space-between;
    	margin:1rem 0 1.5rem 0;
    	padding:0 10px;
    }
    .statusPrice1{
    	font-size:17px;
    	color:red;
    }
    .statusPrice2{
    	font-size:17px;
    	color:green;
    }
    .tradeTime{
    	color:gray;
    }
    .status-line{
        display: flex;
        justify-content: space-between;
        padding:0 10px;
    }
    .todayPersonMenu{
    	width:270px;
    	height:100px;
    	overflow:auto;
    	padding:0.5rem;
    	border: 1px solid gray;
    }
    .status-title{
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 18px;
        margin-bottom: 10px;
    }
    .status-button{
        text-align: right;
    }
    .takeoutBtn{
        background-color: brown;
        color:white;
        font-size: 25px;
        padding: 0.5rem;
        margin-top:15px;
        border: none;
        outline:none;
    }
    .totalPriceShow{
    	font-size:20px;
    }
    .MyBranch{
    	text-align:right;
    	font-size:18px;
    	padding:0.5rem;
    	margin-left:460px;
    	border-bottom:1px solid green;
    }
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){
		$(".takeoutBtn").click(function(){
			let order_no = $(this).prev().val();
			$.ajax({
				url:"updateStatus",
				type:"POST",
				data:{
					order_no:order_no
				},
				success:function(res){
					location.reload();
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="box">
        <div class="menu">메뉴바</div>
        <div class="orderstatus">
        <div class="MyBranch">${branch_name}</div>
        <c:forEach var="order" items="${list}">
        <c:if test="${order.status eq '0'}">
        	<div class="orderOne">
               <div class="number-info">
                   <div class="order-number">주문번호: ${order.order_no}</div>
                   <div>대기번호: ${order.today_num}</div>
               </div>
               <div class="orderTimeAndStatus">
               		<div class="tradeTime">거래시간: <fmt:formatDate value="${order.today_time}" pattern="yyyy.MM.dd a HH:mm:ss"/></div>
               		<c:if test="${order.price_status eq '0'}">
               			<div class="statusPrice1">미결제</div>
               		</c:if>
               		<c:if test="${order.price_status eq '1'}">
	               		<div class="statusPrice2">결제완료</div>
               		</c:if>
               </div>
               <div class="status-line">
                   <div class="todayPersonMenu">
                   	<c:forEach var="menuorder" items="${menulist.get(order.order_no)}">
                       <div class="status-title">
                           <div>${menuorder.menu_name}</div>
                           <div>${menuorder.count}</div>
                        </div>
                   	</c:forEach>
                   </div>

                   <div class="status-button">
                   		<div class="totalPriceShow">총 ${order.total_price}원</div>
                   		<input type="hidden" value="${order.order_no}">
                    	<input type="button" value="픽업완료" class="takeoutBtn">                
                   </div>
               </div>
           </div>
        </c:if>
        </c:forEach>
        </div>
    </div>
</body>
</html>