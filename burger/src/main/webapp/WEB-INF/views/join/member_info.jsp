<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<div class="outbox" style="width:700px">
		<div class="row center">
			<h2>내 정보</h2>
		</div>
		<form:form modelAttribute="member_info">
			<form:hidden path="member_no"/>
			<table class="member_info_table">
				<tr>
					<td>아이디</td>
					<td><form:input path="member_id" readonly="true"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><form:input path="member_name" readonly="true"/></td>
				</tr>
				<tr>
					<td>휴대 전화</td>
					<td><form:input path="member_phone" readonly="true"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><form:input path="member_address" readonly="true"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><form:input path="member_gender" readonly="true"/></td>
				</tr>
				<tr>
					<td>연령대</td>
					<td><form:input path="member_age_group" readonly="true"/></td>
				</tr>
			</table>
		</form:form>
	</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>