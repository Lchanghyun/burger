<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_auth.css">


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>	
	<div class="row center">
		<h3>회원가입이 완료되었습니다.</h3>
	</div>
	<div class="success_message">
		<p>
			고객님의 사이트 이용에 불편을 드리지 않도록 최선을 다하겠습니다.
		</p>
	    <p>
	      	로그인 이후 바로 서비스 이용이 가능합니다.
				아래 버튼을 클릭해주세요.
	    </p>
    </div>
	<div class="button">
		<input type="button" class="button_login_member" value="로그인" onclick="location.href='${pageContext.request.contextPath}/join/login_member'">
		<input type="button" class="button_index_member" value="홈 메인" onclick="location.href='${pageContext.request.contextPath}/'">
	</div>

<!-- 회원가입이 완료되었습니다. 로그인 화면으로 이동,  -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>