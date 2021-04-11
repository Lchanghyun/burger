<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>햄버거 주문하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){		
		var category_burger = $("input[value=햄버거]"); 
		var category_drink = $("input[value=음료]"); 
		var category_side = $("input[value=사이드]"); 
		
		category_burger.parent().show();
		category_drink.parent().hide();
		category_side.parent().hide();
		
		//버튼을 누르면 목록을 불러온다.
		$("#btn_burger").click(function(){
			category_burger.parent().show();
			category_drink.parent().hide();
			category_side.parent().hide();
		});
		$("#btn_drink").click(function(){
			category_burger.parent().hide();
			category_drink.parent().show();
			category_side.parent().hide();			
		});
		$("#btn_side").click(function(){
			category_burger.parent().hide();
			category_drink.parent().hide();
			category_side.parent().show();		
		});

/*		$("#btn_burger").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/async/list",
				type : "get", 
				success : function(resp){//resp == 목록
					//console.log(resp);
					resp = $.parseJSON(resp);//JSON 복원
					$.each(resp, function(){
						console.log(this);
					});
				}
			});
		});
*/
		// 메뉴 클릭
		$(".menuList").click(function(){
			
			let bm_no = $(this).children(".bm_no").val();
			let menu_name = $(this).children(".menu_name").html();
			let menu_price = $(this).children(".menu_price").html();
			let html = '<div id="add-menu"></div>'
			var template = $("#row-template").html();

			const arr1 = new Array();
			arr1.push(bm_no, menu_name, menu_price);
			console.log(arr1)
		
			$("#array").append(html);
			$("<p>").text(menu_price).prependTo("#add-menu");
			$("<p>").text(menu_name).prependTo("#add-menu");
			
			
			$("#menuEmpty").hide();
			
		});
		$("body").on("click", ".btn-del", function(){
			console.log("메뉴 삭제")
			$(this).parent().remove();
		});
		//버튼 클릭시 카테고리 메뉴 이동		
	});
</script>

<style type="text/css">
	
</style>
</head>
<body>
	<a href="/burger">home으로</a>
	<h3>메뉴</h3>
		<button id="btn_burger">BURGER</button>
		<button id="btn_drink">DRINK</button>
		<button id="btn_side">SIDE</button>
		<br>
		<br>
		<div id="menu" style="width: 700px; float: left;" >
			<c:choose>
				<c:when test="${empty orderList}">
					<p>게시물이 없습니다.</p>
				</c:when>
					<c:otherwise>
					<c:forEach items="${orderList}" var="MenuBranchMenuVo" >
						<c:if test="${MenuBranchMenuVo.menu_status != '2' and MenuBranchMenuVo.menu_status != '3'}">
							<div class="menuList" style="display: inline-block;">
									<img alt="메뉴사진" src="http://placeimg.com/200/200/hamburger">
									<p class="menu_name">${MenuBranchMenuVo.menu_name}</p>
									<p class="menu_price">${MenuBranchMenuVo.menu_price}</p>
									<input class="bm_no" type="hidden" value="${MenuBranchMenuVo.bm_no}">
									<input type="hidden" value="${MenuBranchMenuVo.menu_status}">
									<input type="hidden" value="${MenuBranchMenuVo.category }">
									<p>--------------------------------------</p>
							</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>				
		</div>
		<div id="array" style="width: 300px; border: 1px solid black; height: 600px; float: right;">
			<div id="menuEmpty">제품을 선택해주세요</div>
						
			
			<button type="submit">결제하기</button>			
		</div>

</body>
</html>