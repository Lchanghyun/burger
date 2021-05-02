<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_auth.css">


<div class="outbox">
<form action="${pageContext.request.contextPath}/join/login_auth" method="post" class="loginForm">
	<div class="outbox" style="width:500px">
		<div style="row:center">
			<h1>지점/본사 로그인</h1>
		</div>
    <div class="login_box">
		<div class="radio_auth">
			<label class="login_branch">
			<input type="radio" name="gubun" value="branch" checked> 지점관리자</label>
			
			
			<label class="login_super">
			<input type="radio" name="gubun" value="super"> 본사관리자</label>
		</div>
			<div class="row_auth">
				<input type="text" name="id" class="login_id_auth" placeholder="아이디" required>
			</div>
			
			<div class="row_auth">
				<input type="password" name="pw" class="login_pw_auth" placeholder="비밀번호" required>
			</div>
			
			<div class="row_auth_btn">
				<input type="submit" class="login_bt_auth" value="로그인">
			</div>
			
	</div>
  </div>
</form>
</div>


