<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(지점)메뉴관리</title>
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
        .listphotoshow{
        	font-size:13px;
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
        .listTopBox{
        	text-align:right;
        }
        .topTotal, .myBranchList{
        	text-decoration: none;
        	font-size:17px;
        	margin:0 0.5rem;
        	color:lightgray;
        }
        .activeTopList{
        	color: darkgray;
        	border-bottom:2px solid darkgray;
        }
        .soldOutStatus{
        	color:red;
        	font-style:italic;
        }
        
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
		$(function(){
			let my = ${my};
			if(my == true){
				$(".myBranchList").addClass("activeTopList");
			}
			else{
				$(".topTotal").addClass("activeTopList");
			}
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
			
			$(".menuAdd").click(function(){
				let menu_no = $(this).prev().val();
				$.ajax({
					url: "menuAdd",
					type:"POST",
					data:{
						menu_no: menu_no,
					},
					success:function(res){
						if(res=='add'){
							alert("추가되었습니다.");
							location.reload();
						}
					}
				})
			})
			$(".menuBranchRemove").click(function(){
				let menuName = $(this).parent().prev().prev().prev().text();
				let conf = confirm(menuName+"을(를) my 지점에서 삭제하시겠습니까?");
				if(conf){
					let menu_no = $(this).prev().val();
					$.ajax({
						url: "removeBranchMenu",
						type:"POST",
						data:{
							menu_no: menu_no,
							branch_no: '${sessionScope.branch_no}'
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
			$(".menuSoldout").click(function(){
				let menuName = $(this).parent().prev().prev().prev().prev().text();
				let conf = confirm(menuName+"을(를) 품절 처리하시겠습니까?");
				if(conf){
					let menu_no = $(this).parent().prev().children().val();
					$.ajax({
						url: "soldoutAndResale",
						type:"POST",
						data:{
							menu_no: menu_no,
							branch_no: '${sessionScope.branch_no}',
							menu_status: '1'
						},
						success:function(res){
							if(res=='success'){
								alert("품절 처리되었습니다.");
								location.reload();
							}
						}
					})
				}
			})
			$(".menuResale").click(function(){
				let menuName = $(this).parent().prev().prev().prev().prev().text();
				let menu_no = $(this).parent().prev().children().val();
				$.ajax({
					url: "soldoutAndResale",
					type:"POST",
					data:{
						menu_no: menu_no,
						branch_no: '${sessionScope.branch_no}',
						menu_status: '0'
					},
					success:function(res){
						if(res=='success'){
							alert(menuName+" 재판매되었습니다.");
							location.reload();
						}
					}
				})
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
			<div><a href="${pageContext.request.contextPath}/menu/branchlist">지점메뉴관리</a></div>
		</div>
		<div class="menustatuslist">
	        <div class="menulist-title">≫ (지점)메뉴관리리스트</div>
			<div class="listTopBox">
	        	<a href="branchlist" class="topTotal">전체 메뉴목록</a>
	        	<a href="branchlist?my" class="myBranchList">My지점 메뉴목록</a>
	        </div>
	
	        <div class="search-menulist">
	            <div>
	                <span class="menuname">메뉴명</span>
	            </div>
	            <div class="searchmenu-key">
	                <input type="text" name="keyword" class="searchmenu-keyword">
	            </div>
	            <input type="button" value="조회" class="searchBtn">
	        </div>
	        
	        <div class="categoryBox">
	        	<c:if test="${not my}">
	        		<a href="branchlist" class="total" >전체</a>
		        	<a href="branchlist?category=햄버거" class="burger">햄버거</a>
		        	<a href="branchlist?category=사이드" class="side">사이드</a>
		        	<a href="branchlist?category=음료" class="drink">음료</a>
	        	</c:if>
	        	<c:if test="${my}">
	        		<a href="branchlist?my" class="total" >전체</a>
		        	<a href="branchlist?my&category=햄버거" class="burger">햄버거</a>
		        	<a href="branchlist?my&category=사이드" class="side">사이드</a>
		        	<a href="branchlist?my&category=음료" class="drink">음료</a>
	        	</c:if>
	        </div>
	
	        <div class="admin-list-box">
	            <table class="menu-adminlist">
	                <thead>
	                    <tr>
	                    	<c:if test="${my}">
	                    		<th width="5%"></th>
	                    		<th width="20%">카테고리</th>
	                    		<th width="29%">메뉴명</th>
		                        <th width="15%">가격</th>
		                        <th width="10%"></th>
		                        <th width="10%"></th>
		                        <th width="11%"></th>
	                        </c:if>
	                        <c:if test="${not my}">
		                    	<th width="24%">카테고리</th>
		                        <th width="31%">메뉴명</th>
		                        <th width="15%">가격</th>
		                        <th width="15%"></th>
	                        	<th width="15%"></th>
	                        </c:if>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:if test="${my}">
	                		<c:if test="${empty branchList}">
	                			<tr>
	                				<td colspan="7">등록된 메뉴가 없습니다.</td>
	                			</tr>
	                		</c:if>
	                	</c:if>
                        <c:if test="${not my}">
                        	<c:if test="${empty allList}">
	                			<tr>
	                				<td colspan="5">등록된 메뉴가 없습니다.</td>
	                			</tr>
	                		</c:if>
                        </c:if>
	                	
	                	<c:if test="${not my}">
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
		                        	<c:set var="result" value="false"></c:set>
		                        	<c:forEach var="branchM" items="${branchList}">
		                        		<c:if test="${not result}">
		                        			<c:if test="${branchM.menu_no == menu.menu_no}">
			                        			<c:set var="result" value="true"></c:set>
			                        		</c:if>
		                        		</c:if>
		                        	</c:forEach>
		                        	<c:if test="${not result}">
		                       			<input type="hidden" value="${menu.menu_no}">
		                       			<input type="button" value="추가" class="menuAdd">
		                        	</c:if>
		                        	<c:if test="${result}">
		                       			<input type="button" value="추가" disabled class="menuAdd">
		                        	</c:if>
		                        </td>
		                        </tr>
	                    	</c:forEach>
	                    </c:if>
	                    <c:if test="${my}">
	                    	<c:forEach var="menu" items="${branchList}">
	                    		<tr>
	                    			<td class="soldOutStatus">
	                    				<c:if test="${menu.menu_status eq '1'}">품절</c:if>
	                    			</td>
			                        <td>${menu.category}</td>
			                        <td>${menu.menu_name}</td>
			                        <td>${menu.menu_price} 원</td>
			                        <td>
			                        	<input type="hidden" value="${menu.save_name}">
			                        	<input type="button" value="사진" class="listphotoshow">
			                        </td>
			                        <td>
			                        	<input type="hidden" value="${menu.menu_no}">
			                        	<input type="button" value="삭제" class="menuBranchRemove">
			                        </td>
			                        <td>
				                        <c:if test="${menu.menu_status eq '0'}">
				                        	<input type="button" value="품절" class="menuSoldout">
				                        </c:if>
				                        <c:if test="${menu.menu_status eq '1'}">
				                        	<input type="button" value="재판매" class="menuResale">
				                        </c:if>
			                        </td>
		                        </tr>
	                    	</c:forEach>
	                    </c:if>
	                </tbody>
	            </table>
	        </div>
		</div>
	</div>
</body>
</html>