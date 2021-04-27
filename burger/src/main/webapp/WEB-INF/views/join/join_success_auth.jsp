<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<style>
h3{
	color:#d93232;
	font-size:40px;
	text-align:center;
  	padding-left:80px;
}

.button_login:hover{
	background:white;
	color:#d93232;
	box-shadow:0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 40px 0 rgba(0,0,0,0.19);
}
</style>	
	
	<div class="row center">
		<h3>지점 관리자 가입을 축하드립니다.</h3>
	</div>
	
	<div class="button">
		<input type="button" class="button_login" value="로그인" onclick="location.href='${pageContext.request.contextPath}/join/login_auth'">
		<input type="button" class="button_index" value="홈 메인" onclick="location.href='${pageContext.request.contextPath}/'">
	</div>

<!-- 회원가입이 완료되었습니다. 로그인 화면으로 이동,  -->