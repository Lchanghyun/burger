<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menuAdmin.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
		$(function(){
			$(".StopModify").hide();
			$(".CategorySelectBtn").hide();
			$(".CategoryCancleBtn").hide();
			
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
			$(".menuStopCancle").click(function(){
				$(this).parent().prev().prev().prev().children().hide();
				$(this).hide();
				$(this).parent().prev().prev().prev().find(".StopModify").show();
				$(this).next().next().show();
				$(this).next().next().next().show();
			})
			$(".CategorySelectBtn").click(function(){
				let category = $(this).parent().prev().prev().prev().find(".StopModify").val();
				let menu_no = $(this).prev().val();
				$.ajax({
					url: "stopModify",
					type: "POST",
					data: {
						menu_no : menu_no,
						category : category
					},
					success: function(msg){
						if(msg === 'success'){
							location.reload();
						}
					}
				})
			})
			$(".CategoryCancleBtn").click(function(){
				$(this).parent().prev().prev().prev().children().show();
				$(this).hide();
				$(this).prev().prev().prev().show();
				$(this).prev().hide();
				$(this).parent().prev().prev().prev().find(".StopModify").hide();
			})
			$(".listphotoshow").click(function(){
				let save_name = $(this).prev().val();
				let menu_name = $(this).next().text();
				let openPhoto = window.open("","photo", "width=600px, height=550px");
				openPhoto.document.write("<html><head><title>"+menu_name+"</title></head><body><div><img width='590px' height='530px' src='photoShow?fileName="+save_name+"'></div></body></html>");
			})
		})
    </script>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
	<div class="adminbox">
		<div class="menustatuslist">
			<div class="menuinsert">
	            <input type="button" value="메뉴등록" class="menuinsertBtn">
	        </div>
	        
		<form action="superlist" method="post">
	        <div class="search-menulist">
	            <div>
	                <span class="menuname">메뉴명 : </span>
	            </div>
	            <div class="searchmenu-key">
	                <input type="text" name="keyword" class="searchmenu-keyword" value="${key}">
	            </div>
	            <input type="submit" value="조회" class="searchBtn">
	        </div>
		</form>
	        
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
		                    		<td width="24%">
		                    			<span class="stopsale">단종</span>
		                    			<select class="StopModify">
		                    				<option>햄버거</option>
		                    				<option>사이드</option>
		                    				<option>음료</option>
		                    			</select>
		                    		</td>
		                    		<td class="picAndMenu"  width="37%">
			                        	<input type="hidden" value="${menu.save_name}">
			                        	<input type="button" value="사진" class="listphotoshow marginPic" >
		                    			<span>${menu.menu_name}</span>
		                    		</td>
			                        <td width="17%">${menu.menu_price} 원</td>
			                        <td width="22%">
			                        	<input type="button" value="판매" class="menuStopCancle">
			                        	<input type="hidden" value="${menu.menu_no}">
			                        	<input type="button" value="완료" class="CategorySelectBtn">
			                        	<input type="button" value="취소" class="CategoryCancleBtn">
			                        </td>
		                    	</c:if>
		                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	 </div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>