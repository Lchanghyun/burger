<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(본사)메뉴관리</title>
	<style>
        html, body {
            margin: 0;
            padding: 0;
        }
        * {
            box-sizing: border-box;
        }
        .adminbox{
        	width:100vw;
        	height:100vh;
        	display:flex;
        }
        .menubar{
        	min-width:100px;
        	height:100%;
        	border-right:1px solid black;
        }
        .menustatuslist{
            min-width:700px;
            margin:auto;
            padding:1rem;
        }
        .menulist-title{
            font-size: 20px;
            color:green;
            font-weight:bold;
            padding-left:30px;
            margin-bottom:15px;
        }
        .search-menulist{
            display: flex;
            justify-content: center;
            margin:20px 0 30px 0;
        }
        .menuname{
            font-size: 18px;
            color:green;
        }
        .searchmenu-keyword{
            margin:0 10px;
            outline: none;
            width: 200px;
            height: 25px;
            border:1px solid green;
        }
        .searchBtn{
            background-color:green;
            color:white;
            font-size:15px;
            outline:none;
            border:none;
        }
        .menuinsert{
        	padding-left:35px;
        }
        .menuinsertBtn{
			background-color:green;
			color:white;
			border-radius:3rem;
			border:none;
			outline:none;
			font-size:17px;
			padding:0.2rem 0.5rem;
        }
        .tableHead{
        	width:600px;
            margin-top:20px;
            margin:0 auto;
        }
        .tableBody{
        	width:650px;
        	height:500px;
            overflow:auto;
            margin-left:50px;
        }
        .menu-adminlist{
            width:600px;
            border-spacing: 0;
        }
        thead > tr > th{
            border-top:2px solid green;
            border-bottom:2px solid green;
            color:green;
            height:40px;
            font-size: 17px;
        }
        tbody > tr > td{
            text-align: center;
            height:45px;
            font-size: 16px;
            border-bottom:1px dotted gray;
        }
        .categoryBox{
        	text-align:center;
        	margin:10px 0;
        }
        .total, .burger, .side, .drink, .theend{
        	text-decoration: none;
        	font-size:20px;
        	margin:0 0.5rem;
        	color:lightgray;
        }
        .total:hover, .burger:hover, .side:hover, .drink:hover, .theend:hover{
        	font-weight:bold;
        }
        .activeList{
        	color:green;
        	font-weight:bold;
        }
        .stopsale{
        	color:red;
        	font-style:italic;
        }
        .picAndMenu{
        	text-align:left;
        	padding-left:30px;
        }
        .marginPic{
        	margin-right:10px;
        }
        .listphotoshow{
        	background-color:transparent;
        	color:green;
        	border:1px solid green;
        	border-radius: 5rem;
        	outline:none;
        	cursor:pointer;
        	font-weight:bold;
        	font-size:13px;
        	margin-right:10px;
        }
        .menuModify, .menuRemove{
        	background-color:transparent;
        	color:green;
        	outline:none;
        	border:none;
        	font-size:18px;
        	cursor:pointer;
        }
        .menuModify:hover, .menuRemove:hover{
        	font-weight:bold;
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
		$(function(){
			let menuCategory = '${mCategory}';
			if(menuCategory == '햄버거'){
				$(".burger").addClass("activeList");
			}
			else if(menuCategory == '사이드'){
				$(".side").addClass("activeList");
			}
			else if(menuCategory == '음료'){
				$(".drink").addClass("activeList");
			}
			else if(menuCategory == '단종'){
				$(".theend").addClass("activeList");
			}
			else{
				$(".total").addClass("activeList");
			}
			
			$(".menuinsertBtn").click(function(){
				location.href = "register";
			})
			$(".menuModify").click(function(){
				let menu_no = $(this).prev().val();
				location.href ="modify?menu_no="+menu_no;
			})
			$(".menuRemove").click(function(){
				let menuName = $(this).parent().prev().prev().prev().children().last().text();
				let conf = confirm(menuName+"을(를) 단종시키겠습니까?");
				if(conf){
					let menu_no = $(this).prev().val();
					$.ajax({
						url: "remove",
						type:"POST",
						data:{
							menu_no: menu_no,
						},
						success:function(res){
							if(res=='remove'){
								alert("단종되었습니다.");
								location.reload();
							}
						}
					})
				}
			})
			$(".listphotoshow").click(function(){
				let save_name = $(this).prev().val();
				let menu_name = $(this).prev().prev().val();
				let openPhoto = window.open("","photo", "width=600px, height=550px");
				openPhoto.document.write("<html><head><title>"+menu_name+"</title></head><body><div><img width='590px' height='530px' src='photoShow?fileName="+save_name+"'></div></body></html>");
			})
		})
    </script>
</head>
<body>
	<div class="adminbox">
		<div class="menubar">
			<div><a>매출관리</a></div>
			<div><a>발주관리</a></div>
			<div><a>재고관리</a></div>
			<div><a href="${pageContext.request.contextPath}/menu/superlist">본사메뉴관리</a></div>
		</div>
		<div class="menustatuslist">
	        <div class="menulist-title">본사 ☞ 메뉴관리</div>
	
		<form action="superlist" method="post">
	        <div class="search-menulist">
	            <div>
	                <span class="menuname">메뉴명</span>
	            </div>
	            <div class="searchmenu-key">
	                <input type="text" name="keyword" class="searchmenu-keyword" value="${key}">
	            </div>
	            <input type="submit" value="조회" class="searchBtn">
	        </div>
		</form>
		
	        <div class="menuinsert">
	            <input type="button" value="메뉴등록" class="menuinsertBtn">
	        </div>
	        
	        <div class="categoryBox">
	        	<a href="superlist" class="total" >전체</a>
	        	<a href="categorylist?category=햄버거" class="burger">햄버거</a>
	        	<a href="categorylist?category=사이드" class="side">사이드</a>
	        	<a href="categorylist?category=음료" class="drink">음료</a>
	        	<a href="categorylist?category=단종" class="theend">단종메뉴</a>
	        </div>
	
	        <div class="tableHead">
	            <table class="menu-adminlist">
	                <thead>
	                	<c:if test="${mCategory ne '단종'}">
	                		<tr>
	                			<th width="24%">카테고리</th>
		                        <th width="37%">메뉴명</th>
		                        <th width="17%">가격</th>
		                        <th width="10%"></th>
		                        <th width="12%"></th>
	                		</tr>
                		</c:if>
                		<c:if test="${mCategory eq '단종'}">
	                		<tr>
		                    	<th width="24%"></th>
		                        <th width="37%">메뉴명</th>
		                        <th width="17%">가격</th>
		                        <th width="22%"></th>
	                		</tr>
                		</c:if>
	                </thead>
	             </table>
	         </div>
	         <div class="tableBody">
	             <table class="menu-adminlist">
	                <tbody>
	                	<c:if test="${empty allList}">
	                		<c:if test="${mCategory ne '단종'}">
		                		<tr>
		                			<td colspan="5">등록된 메뉴가 없습니다.</td>
		                		</tr>
	                		</c:if>
	                		<c:if test="${mCategory eq '단종'}">
		                		<tr>
		                			<td colspan="4">단종된 메뉴가 없습니다.</td>
		                		</tr>
	                		</c:if>
	                	</c:if>
	                    <c:forEach var="menu" items="${allList}">
		                    <tr>
		                    	<c:if test="${menu.category ne '단종'}">
		                    		<td width="24%">${menu.category}</td>
		                    		<td class="picAndMenu" width="37%">
		                    			<input type="hidden" value="${menu.menu_name}">
			                        	<input type="hidden" value="${menu.save_name}">
			                        	<input type="button" value="사진" class="listphotoshow marginPic">
			                        	<span>${menu.menu_name}</span>
			                        </td>
			                        <td width="17%">${menu.menu_price} 원</td>
		                    		<td width="10%">
			                        	<input type="hidden" value="${menu.menu_no}">
			                        	<input type="button" value="수정" class="menuModify">
			                        </td>
			                        <td width="12%">
			                        	<input type="hidden" value="${menu.menu_no}">
			                        	<input type="button" value="단종" class="menuRemove">
			                        </td>
		                    	</c:if>
		                    	<c:if test="${menu.category eq '단종'}">
		                    		<td class="stopsale" width="24%">단종</td>
		                    		<td width="37%">${menu.menu_name}</td>
			                        <td width="17%">${menu.menu_price} 원</td>
			                        <td width="22%">
			                        	<input type="hidden" value="${menu.menu_name}">
			                        	<input type="hidden" value="${menu.save_name}">
			                        	<input type="button" value="사진" class="listphotoshow">
			                        </td>
		                    	</c:if>
		                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	 </div>
</body>
</html>