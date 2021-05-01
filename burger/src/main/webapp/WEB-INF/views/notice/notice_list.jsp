<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style type="text/css">
			.notice_table > li {list-style: none; float: left; padding: 6px;}
			
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
	    width: 240px;
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
	    top: 214px;
    }

    .notice_list_wrap{
           width: 1600px;
		   height: 496px;
		   overflow: auto;
		   position: relative;
		   left: -10px;
		   top: 30px;
	    
    }

    table.notice_table {
        border-collapse: collapse;
        border-spacing: 1px;
        text-align: center;
        line-height: 1.5;
        margin: auto; 
    }
    table.notice_table > thead > tr.tlist > th {
        width: 155px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-top: 2px solid #EE4E34;
        border-bottom: 2px solid #EE4E34;
        position : sticky;
        top: 0px;
        color:#EE4E34;
    	background-color: #FCEDDA;
      
    }
    table.notice_table td {
        width: 300px;
        padding: 10px; 
        text-align: center;
        vertical-align: top;
        border-bottom: 1px solid #444444;
    
    }
		</style>
<script>
	$(function(){
		$(".notice_write_btn").on("click", function(){
			location.href="${pageContext.request.contextPath}/notice/notice_write"
		})
	})
</script>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
	<div style="height: calc(100% - 142px)">
	<div class="page_title">공지사항</div>
				<div class="btn_wrapper">
					<!-- 버튼넣기 -->
				</div>
				<hr class="hr_line">
				<div class="notice_wrap">
	        	<div class="notice_container">
	            <div class="notice_list_wrap">
		<table class="notice_table">
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

</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 

