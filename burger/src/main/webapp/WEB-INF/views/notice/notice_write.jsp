<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<body>
	<article class="container">
		<div class="outbox" style="width:100%">
			<form action="notice_write" method="post" id="notice_write">
				<div class="form-notice">
					<select name="category">
						<option value="" selected="selected">공지사항 선택</option>
						<option value="사내 공고">사내 공고</option>
						<option value="인사 변동">인사 변동</option>
						<option value="이벤트">이벤트</option>
						<option value="컴플레인">컴플레인</option>
						<option value="이달의 매장/직원">이달의 매장/직원</option>
					</select>
				</div>
				<div class="form-notice">
					<label for="noticeTitle">제목</label>
					<input type="text" id="notice_title" name="notice_title">
				</div>
				
				<div class="form-notice">
					<label for="noticeContent">내용</label>
					<textarea id="notice_content" name="notice_content"></textarea>
				</div>
				
				<div class="form-notice">
					<input type="submit" class="btn_no_write" id=write_success value="작성하기">
					<input type="button" class="btn_no_list" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/notice/notice_list'">
				</div>		
			</form>
		</div>
	</article>
</body>

<!-- 기획공고, 인사공고, 이벤트공고, 컴플레인공고 -->