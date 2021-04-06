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
		//버튼을 누르면 목록을 불러온다.
		$("#btn_burger").click(function(){
			self.location = "order?category=햄버거"
		});
		$("#btn_drink").click(function(){
			self.location = "order?category=음료"
		});
		$("#btn_side").click(function(){
			self.location = "order?category=사이드"
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
			}else{
				console.log("엑티브를 없앱니다.")
				$(this).removeClass("active");
			}
		});
		//버튼 클릭시 카테고리 메뉴 이동
		
		
		
	});
</script>
<style type="text/css">
	
</style>
</head>
<body>
	<h3>메뉴</h3>
		<button id="btn_burger">BURGER</button>
		<button id="btn_drink">DRINK</button>
		<button id="btn_side">SIDE</button>	
	
	<div id = "list">
		<c:if test="${empty orderList} ">
			<p>게시물이 없습니다.</p>
		</c:if>
		<c:forEach items="${orderList}" var="MenuBranchMenuVo" >
			<div class="menuList" style="display: inline-block;">
				<input type="checkbox" class ="choose" style="display: none;">
				<p>지점 번호: ${MenuBranchMenuVo.branch_no}</p>
				<p>메뉴 상태: ${MenuBranchMenuVo.menu_status}</p>
				<p>메뉴 이름: ${MenuBranchMenuVo.menu_name}</p>
				<p>메뉴 가격: ${MenuBranchMenuVo.menu_price}</p>
				<p>메뉴 카테고리: ${MenuBranchMenuVo.category}</p>
				<p>--------------------------------------</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>