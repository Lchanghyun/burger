<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>

	<div class="outbox" style="width:100%">
		<h2>공지사항 글쓰기</h2>
			<form action="${pageContext.request.contextPath}/notice/notice_write" method="post" id="notice_write" name="notice_write">
				<div class="form-notice">
					<label for="noticeCategory">분류</label>
					<select name="notice_category" id="notice_category" required>
						<option value="이벤트" selected="selected">이벤트</option>
						<option value="공지사항">공지사항</option>
						<option value="이달의매장/직원">이달의매장/직원</option>
					</select>
				</div>
				<div class="form-notice">
					<label for="noticeTitle">제목</label>
					<input type="text" id="notice_title" name="notice_title" required>
				</div>
				
				<div class="form-notice">
					<label for="noticeContent">내용</label>
					<textarea id="notice_content" name="notice_content" required></textarea>
				</div>
				
				<div class="form-notice">
					<input type="submit" class="btn_no_write" id=write_success value="작성하기">
					<input type="button" class="btn_no_list" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/notice/notice_list'">
				</div>		
			</form>
	</div>
	

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
