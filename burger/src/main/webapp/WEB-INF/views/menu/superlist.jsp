<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            margin:0 auto;
            padding:1rem;
        }
        .menulist-title{
            font-size: 20px;
        }
        .search-menulist{
            display: flex;
            justify-content: center;
            margin:20px 0;
        }
        .menuname{
            font-size: 17px;
        }
        .searchmenu-keyword{
            margin:0 10px;
            outline: none;
            width: 300px;
            height: 23px;
        }
        .searchBtn{
            
        }
        .menuinsert{
        	padding-left:35px;
        }
        .menuinsertBtn{

        }
        .admin-list-box{
            display: flex;
            justify-content: center;
            margin-top:20px;
            height:600px;
            overflow:auto;
        }
        .menu-adminlist{
            width:600px;
            border-spacing: 0;
        }
        thead > tr > th{
            border-top:2px solid gray;
            border-bottom:2px solid gray;
            height:35px;
            font-size: 17px;
        }
        tbody > tr > td{
            text-align: center;
            height:35px;
            font-size: 16px;
            border-bottom:1px dotted gray;
        }
        .categoryBox{
        	text-align:center;
        }
        .total, .burger, .side, .drink{
        	text-decoration: none;
        	font-size:20px;
        	margin:0 0.5rem;
        	color:lightgray;
        }
        .activeList{
        	color:green;
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
			else{
				$(".total").addClass("activeList");
			}
			
			$(".menuinsertBtn").click(function(){
				location.href = "register";
			})
			$(".menuModify").click(function(){
				let menu_no = $(this).prev().val();
				console.log(menu_no);
				location.href ="modify?menu_no="+menu_no;
			})
			$(".menuRemove").click(function(){
				let menuName = $(this).parent().prev().prev().prev().prev().text();
				let conf = confirm(menuName+"을(를) 삭제하시겠습니까?");
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
								alert("삭제되었습니다.");
								location.reload();
							}
						}
					})
				}
			})
			$(".listphotoshow").click(function(){
				let save_name = $(this).prev().val();
				let menu_name = $(this).parent().prev().prev().text();
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
	        <div class="menulist-title">≫ (본사)메뉴관리리스트</div>
	
	        <div class="search-menulist">
	            <div>
	                <span class="menuname">메뉴명</span>
	            </div>
	            <div class="searchmenu-key">
	                <input type="text" name="keyword" class="searchmenu-keyword">
	            </div>
	            <input type="button" value="조회" class="searchBtn">
	        </div>
	
	        <div class="menuinsert">
	            <input type="button" value="메뉴등록" class="menuinsertBtn">
	        </div>
	        
	        <div class="categoryBox">
	        	<a href="superlist" class="total" >전체</a>
	        	<a href="categorylist?category=햄버거" class="burger">햄버거</a>
	        	<a href="categorylist?category=사이드" class="side">사이드</a>
	        	<a href="categorylist?category=음료" class="drink">음료</a>
	        </div>
	
	        <div class="admin-list-box">
	            <table class="menu-adminlist">
	                <thead>
	                    <tr>
	                    	<th width="24%">카테고리</th>
	                        <th width="30%">메뉴명</th>
	                        <th width="15%">가격</th>
	                        <th width="15%"></th>
	                        <th width="8%"></th>
	                        <th width="8%"></th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:if test="${empty allList}">
	                		<tr>
	                			<td colspan="6">등록된 메뉴가 없습니다.</td>
	                		</tr>
	                	</c:if>
	                    <!-- for문 -->
	                    <c:forEach var="menu" items="${allList}">
		                    <tr>
		                        <td>${menu.category}</td>
		                        <td>${menu.menu_name}</td>
		                        <td>${menu.menu_price} 원</td>
		                        <td>
		                        	<input type="hidden" value="${menu.save_name}">
		                        	<input type="button" value="사진" class="listphotoshow">
		                        </td>
		                        <td>
		                        	<input type="hidden" value="${menu.menu_no}">
		                        	<input type="button" value="수정" class="menuModify">
		                        </td>
		                        <td>
		                        	<input type="hidden" value="${menu.menu_no}">
		                        	<input type="button" value="삭제" class="menuRemove">
		                        </td>
		                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	 </div>
</body>
</html>