<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header jsp태그 -->
<script>

</script>

<body>
<form action="login_member" method="post" class="loginForm">
	<div class="outbox" style="width:500px">
		<div style="row:center">
			<h3>로그인</h3>			
		</div>
			<div class="row">
				<label for="loginId">아이디</label>
				<input type="text" name="member_id" class="login_id" placeholder="아이디를 입력해주세요." required>
			</div>
			
			<div class="row">
				<label for="loginPw">비밀번호</label>
				<input type="password" name="member_pw" class="login_pw" placeholder="비밀번호를 입력해주세요." required>
			</div>
			
			<div class="row">
				<input type="submit" class="login_bt" value="로그인">
			</div>
			
			<div class="row">
				<input type="button" class="join_bt" value="회원가입" onClick="location.href='<%=request.getContextPath()%>/join/member_join'">
			</div>
	</div>
</form>
</body>
<!-- footer jsp태그 -->
