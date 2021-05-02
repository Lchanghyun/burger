<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
    <style type="text/css">
    .notice_list_btn, .notice_edit_btn, .notice_delete_btn{
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
		top : 14%;
		left : 220px;
		font-size : 40px;	
	}
	.btn_wrapper{
		position: absolute;
	    top: clamp(10px, 17% , 500px);
	    left: clamp(600px, 84.6%, 1520px);
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
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
	
	<div style="height: calc(100% - 142px)">
	<div class="page_title">공지사항</div>
	
		<div class="btn_wrapper">
			<button type="submit" class="notice_list_btn" id="list_btn">목록</button>
		<c:if test ="${sessionScope.super_no != null and sessionScope.branch_no == null}">
			<button type="submit" class="notice_edit_btn" id="edit_btn">수정</button>
			<button type="submit" class="notice_delete_btn" id="delete_btn">삭제</button>
		</c:if>
		</div>
		<hr class="hr_line">
				<div class="notice_wrap">
	        	<div class="notice_container">
	            <div class="notice_list_wrap">
		<form:form modelAttribute="notice_detail">
			<form:hidden path="notice_no"/>
			
			<table class="notice_detail_table">
				<tr>
					<td align="center">NO</td>
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
		</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
