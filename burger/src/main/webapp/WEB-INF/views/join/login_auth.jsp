<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
<form action="login_auth" method="post" class="loginForm">
	<div class="outbox" style="width:500px">
		<div style="row:center">
			<h3>지점/본사 로그인</h3>
		</div>
		<div>
			<label class="login_branch">
			<input type="radio" name="gubun" value="b" checked> 지점관리자</label>
			
			
			<label class="login_super">
			<input type="radio" name="gubun" value="s"> 본사관리자</label>
		</div>
			<div class="row">
				<label for="loginId">아이디</label>
				<input type="text" name="id" class="login_id" placeholder="아이디를 입력해주세요." required>
			</div>
			
			<div class="row">
				<label for="loginPw">비밀번호</label>
				<input type="password" name="pw" class="login_pw" placeholder="비밀번호를 입력해주세요." required>
			</div>
			
			<div class="row">
				<input type="submit" class="login_bt" value="로그인">
			</div>
			
			<div class="row">
				<input type="button" class="join_bt" value="지점 가입" onClick="location.href='<%=request.getContextPath()%>/join/branch_join'">
			</div>
	</div>
</form>
</body>
</html>