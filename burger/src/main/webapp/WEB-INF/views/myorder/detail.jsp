<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 주문 상세내역</title>
	<style>
        html, body {
            margin: 0;
            padding: 0;
        }
        * {
            box-sizing: border-box;
        }
        .top-menu{
            width:100%;
            height:100px;
        }
        .myorderdetailList{
        	width:800px;
            margin: auto;
        }
        .detailBack{
        	display:flex;
        	justify-content:space-between;
        	align-items:center;
        	padding:0 1rem;
        	margin-bottom:15px;
        }
        .backA{
        	text-decoration: none;
        	font-size:20px;
        	font-weight:bold;
        	color:brown;
        }
        .detailTitle{
        	font-size:18px;
        	font-weight:bold;
        }
        .order-list{
            width:800px;
            padding:1rem;
            border:1px solid black;
        }
        .mylastorder{
            padding:1rem;
        }
        .myorderlist-border{
            padding:1rem 0;
            display: flex;
            align-items: center;
            justify-content:space-around;
            border-bottom: 1px dotted black;
        }
        .myorderDetail{
        	display: flex;
            align-items: center;
            justify-content:space-between;
            width:450px;
        }
        .myorderDetailName{
        	font-size:21px;
        	font-weight: bold;
        	margin-bottom:5px;
        }
        .myorderDetailPrice{
            font-size: 20px;
            font-weight: bold;
        }
        .how-many{
            font-size: 17px;
            background-color: lightgray;
            padding:0.3rem;
        }
        .totalprice-my{
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            margin-top:15px;
        }
        .mypage-totalprice{
            color:brown;
        }
        .detailmenu-img{
        	width:200px;
        	height:130px;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>

    </script>
</head>
<body>
	<div class="top-menu">
        상단메뉴
    </div>
    <div class="myorderdetailList">
    	<div class="detailBack">
    		<a href="list" class="backA">◀ 뒤로</a>
    		<span class="detailTitle">『주문내역』</span>
    	</div>
		<div class="order-list">
			<c:forEach var="detailmenu" items="${detailList}">
		        <div class="mylastorder">
		            <div class="myorderlist-border">
		                <img src="${pageContext.request.contextPath}/menu/photoShow?fileName=${detailmenu.save_name}" class="detailmenu-img">
		                <div class="myorderDetail">
			                <div class="mylastorder-list">
			                    <div class="myorderDetailName">${detailmenu.menu_name}</div>
			                    <div class="myorderDetailPrice">${detailmenu.menu_price}원</div>
			                </div>
			                <div>
			                    <div class="how-many">수량 ${detailmenu.count}개</div>
			                </div>
		                </div>
		            </div>
		        </div>
			</c:forEach>
	
	        <div class="totalprice-my">총 금액 : <span class="mypage-totalprice">${total_price}</span> 원</div>
	    </div>
    </div>
</body>
</html>