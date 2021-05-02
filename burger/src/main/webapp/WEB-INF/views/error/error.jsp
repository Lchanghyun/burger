<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 발생</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
	.error_wrapper{
		position : absolute;
		top : 30%;
		left : calc(calc(100% - 267px) / 2);
		text-align : center;
		margin : 0 auto;
	}
	#return_button{
		width : 200px;
		height: 200px;
	}
	#return_button:hover{
		cursor: pointer
	}
	.error{
		font-size : 20px;
		font-weight : bold;
		font-family: GmarketSansMedium;
	}
	.history_back{
		font-size : 25px;
		font-weight : bold;
		font-family: GmarketSansMedium;
	}
</style>
<script>
	$(function(){
		$("#return_button").on("click", function(){
			history.back();
		})		
	})
</script>
</head>
<body>
	<div class="error_wrapper">
		<div>
			<span class="error">알수없는 오류가 발생했습니다.</span>
		</div>
		<img src="${pageContext.request.contextPath}/resources/img/return.png" id="return_button">
		<div>
			<span class="history_back">이전 페이지로 돌아가기</span>
		</div>
	</div>
</body>
</html>