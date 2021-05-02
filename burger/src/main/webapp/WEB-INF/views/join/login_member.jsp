<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

<!-- header jsp태그 -->
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>

</script>
<div class="outbox">
<form action="${pageContext.request.contextPath}/join/login_member" method="post" class="loginForm">
	<div class="outbox" style="width:500px">
		<div style="row:center">
			<h1 class="login_title">로그인</h1>			
		</div>
		<div class="loginBox">
			<div class="row_member">
				<input type="text" name="member_id" class="login_id" placeholder="아이디를 입력해주세요." required>
			</div>
			
			<div class="row_member">
				<input type="password" name="member_pw" class="login_pw" placeholder="비밀번호를 입력해주세요." required>
			</div>

			<div class="row_btn">
				<input type="submit" class="login_bt" value="로그인">
				<input type="button" class="join_bt" value="회원가입" onClick="location.href='<%=request.getContextPath()%>/join/member_join'">
			</div>
		</div>
	</div>

</form>
</div>
<!-- footer jsp태그 -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>