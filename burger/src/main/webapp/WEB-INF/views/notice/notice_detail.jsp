<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
    
<script>
	$(document).ready(function(){
		var formObj = $("#notice_detail");
		
		$("#edit_btn").on("click", function(){
			var notice_no = $("#notice_no")
			var notice_no_Val = notice_no.val();
			
			self.location = "${pageContext.request.contextPath}/notice/notice_edit?notice_no="+notice_no_Val
		})
		
		$("#delete_btn").on("click", function(){
			let notice_no = $(".noticeNo").val();
			location.href="${pageContext.request.contextPath}/notice/notice_delete?notice_no="+notice_no ;
		})
		
		$("#list_btn").on("click", function(){
			
			location.href="${pageContext.request.contextPath}/notice/notice_list"
		})
		
	})
</script>
	<div class="notice_detail_wrap">
		<h2 class="notice_detail_head">공지사항</h2>
		
		<div class="notice_detail_button_line">
			<button type="submit" class="notice_list_btn" id="list_btn">목록</button>
			<c:if test="${sessionScope.super_no != null and sessionScope.branch_no == null}">
				<button type="submit" class="notice_edit_btn" id="edit_btn">수정</button>
				<button type="submit" class="notice_delete_btn" id="delete_btn">삭제</button>
			</c:if>
		</div>
		
		<form:form modelAttribute="notice_detail">
			<form:hidden path="notice_no"/>
			
			<table class="notice_detail_table">
				<tr>
					<td align="center">공지사항 번호</td>
					<td><form:input path="notice_no" class="noticeNo" readonly="true"/></td>
				</tr>
				<tr>
					<td align="center">분류</td>
					<td><form:input path="notice_category" readonly="true"/></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td><form:input path="notice_title" readonly="true"/></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><form:input path="notice_content" readonly="true"/></td>
				</tr>
			</table>
		</form:form>
		
	</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
