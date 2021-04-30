<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
	
<script>
	$(document).ready(function () {
		var formObj = $("#notice_edit")
		
		
		$(".list_btn").on("click", function () {
			location.href="${pageContext.request.contextPath}/notice/notice_list"
		})
	})
</script>
    

	<div class="notice_edit_wrap">
		<form method="post" action="notice_edit" id="notice_edit">
			
			<table class="notice_edit_table">
				<tr>
					<td>공지사항 번호</td>
					<td><input type="text" name="notice_no" value="${editList.notice_no}" readonly="true"/></td>
				</tr>
				<tr>
					<td>분류</td>
					<td>
						<select name="notice_category" id="notice_category" required><c:out value="${editList.notice_category}"/>
						<option value="" selected="selected">공지사항 선택</option>
						<option value="이벤트" id="">이벤트</option>
						<option value="공지사항">공지사항</option>
						<option value="이달의매장/직원">이달의매장/직원</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>공지사항 제목</td>
					<td><input type="text" name="notice_title" value="${editList.notice_title}"/></td>
				</tr>
				<tr>
					<td>공지사항 내용</td>
					<td><input type="text" name="notice_content" value="${editList.notice_content}"/></td>
				</tr>
			</table>
		<div class="notice_edit_btn">
			<input type="submit" class="edit_btn" value="수정">
			<input type="button" class="list_btn" value="목록으로">
		</div>
		</form>
	</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
