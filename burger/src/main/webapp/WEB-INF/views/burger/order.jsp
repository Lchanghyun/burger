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
		$("#bnt_burger").click(function(){
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
	});
</script>

</head>
<body>
	<h3>메뉴</h3>
	<button>햄버거</button>
	<button>음료</button>
	<button>사이드</button>
	
	<div id = "list">
		<c:if test="${empty bugerOrder.orderList} ">
			<p>게시물이 없습니다.</p>
		</c:if>
		<c:if test="">
			<c:forEach items="${bugerOrder.orderList }" var="MenuBranchMenuVo">
				<span>지점 번호</span>
				<p>${MenuBranchMenuVo.branch_no}</p>
				<span>메뉴 상태</span>
				<p>${MenuBranchMenuVo.menu_status}</p>
				<span>메뉴 이름</span>
				<p>${MenuBranchMenuVo.menu_name}</p>
				<span>메뉴 가격</span>
				<p>${MenuBranchMenuVo.menu_price}</p>
				<span>카테고리</span>
				<p>${MenuBranchMenuVo.category}</p>
				<span>저장 이름</span>
				<img alt="${MenuBranchMenuVo.menu_name}" src="./img/${${MenuBranchMenuVo.upload_name}.jpg">
			</c:forEach>
		</c:if>		
	</div>
</body>
</html>