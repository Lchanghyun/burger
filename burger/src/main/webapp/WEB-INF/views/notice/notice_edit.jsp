<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <style type="text/css">
    .list_btn, .edit_btn{
		width: 100px;
	    height: 30px;
	    padding: 3px;
	    padding-top: 6px;
	    background-color: #EE4E34;
	    color: white;
	    border: none;
	    font-family: 'GmarketSansMedium';
	    font-size: 15px;
	    font-weight: bold;
	    border-radius: 3px;
	}
    .hr_line{
		position : absolute;
		top : 20%;  
		left : 218px;
		display : block;
		width: 84%;    
		border : 2px solid;
	}
	.page_title{
		position : absolute;
		top : 15%;
		left : 220px;
		font-size : 40px;	
	}
	.btn_wrapper{
		position: absolute;
	    top: clamp(10px, 17% , 500px);
	    left: clamp(600px, 84.6%, 1700px);
	    width: 400px;
	    z-index: 2;
	}
	
	.notice_wrap{
        width: 1680px;
	    height: 845px;
	    position: relative;
	    margin: auto;
	   	
    }
    .notice_container{
   		width: 1610px;
	    height: 530px;
	    position: absolute;
	    left: 10px;
	    top: 175px;
    }

   .notice_list_wrap{
    width: 1600px;
	height: 496px;
	position: relative;
	left: 170px;
	top: 0px;
}

    </style> 
	
<script>
	$(document).ready(function () {
		var formObj = $("#notice_edit")
		
		
		$(".list_btn").on("click", function () {
			location.href="${pageContext.request.contextPath}/notice/notice_list"
		})
	})
</script>
    	<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
	<div style="height: calc(100% - 142px)">
	<div class="page_title">공지사항 수정</div>
	
	<div class="notice_edit_wrap">
		<form method="post" action="${pageContext.request.contextPath}/notice/notice_edit" id="notice_edit">
			<div class="btn_wrapper">
			<input type="submit" class="edit_btn" value="수정">
			<input type="button" class="list_btn" value="목록으로">
			</div>
			<hr class="hr_line">
			<div class="notice_wrap">
	        <div class="notice_container">
	        <div class="notice_list_wrap">
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
			</div>
			</div>
			</div>
		</form>
	</div>
	</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
