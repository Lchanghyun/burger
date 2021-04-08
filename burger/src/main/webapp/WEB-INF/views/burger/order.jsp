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
			var checkBox = $(this).children(".choose");
			checkBox.prop('checked', !checkBox.prop('checked'));				

			var check = $(this).children(".choose").prop("checked");
			if(check){
				console.log("엑티브를 생성합니다.")
				$(this).addClass("active");
				var template = $("#row-template").html();
				$(template).insertBefore
				
			}else{
				console.log("엑티브를 없앱니다.")
				$(this).removeClass("active");
			}
			
		});
		//버튼 클릭시 카테고리 메뉴 이동		
	});
</script>
<script id="row-template" type="text/template"></script>
<style type="text/css">
	
</style>
</head>
<body>
	<h3>메뉴</h3>
		<button id="btn_burger">BURGER</button>
		<button id="btn_drink">DRINK</button>
		<button id="btn_side">SIDE</button>
		<br>
		<br>
	<div id = "list">
		<c:if test="${empty orderList} ">
			<p>게시물이 없습니다.</p>
		</c:if>
		<c:forEach items="${orderList}" var="MenuBranchMenuVo" >
			<c:if test="${MenuBranchMenuVo.menu_status != '2' and MenuBranchMenuVo.menu_status != '3'}">
				<div class="menuList" style="display: inline-block;">
					<input type="checkbox" class ="choose" style="display: none;">
						<img alt="메뉴사진" src="http://placeimg.com/200/200/hamburger">
						<p>메뉴 이름: ${MenuBranchMenuVo.menu_name}</p>
						<p>메뉴 가격: ${MenuBranchMenuVo.menu_price}</p>
						<input type="hidden" value="${MenuBranchMenuVo.menu_status}">
						<input type="hidden" value="${MenuBranchMenuVo.category }">
						<p>--------------------------------------</p>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<hr>
	<div id="orderList">
		
	</div>
</body>
</html>