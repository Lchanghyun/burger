<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.btn_no_write, .btn_no_list{
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
	    cursor: pointer;
	}
	.hr_line{
		position : absolute;
		top : 20%;  
		left : 218px;
		display : block;
		width: 84%;   
		border : 2px solid;
	}
	.btn_wrapper{
		position: absolute;
	    top: clamp(10px, 17% , 500px);
	    left: clamp(600px, 84.6%, 2000px);
	    width: 240px;
	    z-index: 2;
	}
	.page_title{
		position : absolute;
		top : 15%;
		left : 220px;
		font-size : 40px;	
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
	    top: 214px;
    }

.notice_list_wrap{
    width: 1600px;
	height: 496px;
	position: relative;
	left: 297px;
	top: 0px;
}

.form-notice{
  margin-top:10px;
  width:1000px;
}

.form-notice-content{
  margin-top:10px;
}

#notice_title{
  width:1100px;
}
#notice_content{
  width:1100px;
  height:300px;
  color:#EE4E34;
  resize: none;
  
}
#notice_category{
  
}
</style>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>

	<div class="outbox" style="width:100%">


		<div style="height: calc(100% - 142px)">
			<div class="page_title">공지사항 글쓰기</div>
			<form action="${pageContext.request.contextPath}/notice/notice_write" method="post" id="notice_write" name="notice_write">
				<div class="btn_wrapper">
					<input type="submit" class="btn_no_write" id=write_success value="작성하기">
					<input type="button" class="btn_no_list" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/notice/notice_list'">
				</div>
				<hr class="hr_line">	
					<div class="notice_wrap">
					<div class="notice_container">
					<div class="notice_list_wrap">
				
						<div class="form-notice">
							<label for="noticeCategory">분류</label><br>
							<select name="notice_category" id="notice_category" required>
								<option value="이벤트" selected="selected">이벤트</option>
								<option value="공지사항">공지사항</option>
								<option value="이달의매장/직원">이달의매장/직원</option>
							</select>
						</div>
						<div class="form-notice">
							<label for="noticeTitle">제목</label><br>
							<input type="text" id="notice_title" name="notice_title" required>
						</div>
						
						<div class="form-notice-content">
							<label for="noticeContent">내용</label><br>
							<textarea id="notice_content" name="notice_content" required></textarea>
						</div>
				
					</div>
					</div>
					</div>
			</form>
		</div>
	
	</div>

	
	

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
