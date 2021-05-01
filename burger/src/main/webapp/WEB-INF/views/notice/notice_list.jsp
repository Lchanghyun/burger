<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
<script>
	$(function(){
		$(".notice_write_btn").on("click", function(){
			location.href="${pageContext.request.contextPath}/notice/notice_write"
		})
	})
</script>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>

<h2>공지사항 </h2>
	<div class="notice_write_btn_line">
		<button class="notice_write_btn" id="notice_write_btn">공지 작성 </button>
	</div>
	<div class="notice_list_wrap">
		<table class="notice_list_table">
			<thead>
				<tr>
					<th align="center">번호</th>
					<th align="center">분류</th>
					<th align="center">제목</th>
					<th align="center">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty notice_list}">
						<tr>
							<td colspan="4">공지가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${notice_list}" var="notice">
							<tr>
								<td><c:out value="${notice.notice_no}"/></td>
								<td><c:out value="${notice.notice_category}"/></td>
								<td><a href="${pageContext.request.contextPath}/notice/notice_detail?notice_no=${notice.notice_no}"><c:out value="${notice.notice_title}"/></a></td>
								<td><c:out value="${notice.notice_date}"/></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div>
  
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="notice_list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="notice_list${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="notice_list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
		
	</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 

