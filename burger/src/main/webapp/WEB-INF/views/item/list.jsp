<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/item.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
<script>
	$(function(){
		let msg = '<c:out value="${msg}"/>';

		if(msg!=""){
	    	Swal.fire({ icon: 'info', 
            	title: msg       	  
      		});	
	    }
		
		$(".item_register_btn").on("click", function(){
			location.href="${pageContext.request.contextPath}/item/register"
		})
		
		$(".item_edit_btn").on("click", function(){
			location.href="${pageContext.request.contextPath}/item/edit"
		})
		
		let item_no
		
		$(".item_delete_btn").on("click", function(e){
			e.preventDefault();
						
			item_no = $(this).parent().parent().prev().val() 
			
			Swal.fire({ icon: 'error', 
               	title: '단종 처리하시겠습니까?', 
               	icon: 'warning', 
               	showCancelButton: true, 
               	confirmButtonColor: '#3085d6', 
               	cancelButtonColor: '#d33', 
               	confirmButtonText: '승인', 
               	cancelButtonText: '취소'
        		}).then((result) => { 
        			if (result.isConfirmed) { 
        				Swal.fire({
        					icon: 'success',
        				   	title:'단종 처리되었습니다'
        				});
        				
						$.ajax({
							url: "${pageContext.request.contextPath}/item/delete",
							type: "POST",
							data: {
								item_no : item_no 
							},
							success: function(resp){
								setTimeout(function(){
									location.reload()	
								},1000)
							}
						})
       				}
    			})
		})
	})
</script>
<div class="whole_wrapper">
	<div class="page_title">원자재 목록</div>
	<div class="btn_wrapper">
		<button class="item_register_btn">자재추가</button>
		<button class="item_edit_btn">수정</button>
	</div>
	<hr class="hr_line">  
	<div class="list_border">
		<div class="list_all_wrapper">
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="${pageContext.request.contextPath}/item/list?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/item/list?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="${pageContext.request.contextPath}/item/list?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/item/list?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="${pageContext.request.contextPath}/item/list?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/item/list?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="${pageContext.request.contextPath}/item/list?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/item/list?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="${pageContext.request.contextPath}/item/list?category=소모품" class="category_link select_category">소모품</a>
					</c:when>
					<c:otherwise> 
						<a href="${pageContext.request.contextPath}/item/list?category=소모품" class="category_link">소모품</a>
					</c:otherwise>
				</c:choose>
			</div>
			<table class="item_list_table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>자재명</th>
						<th>단가</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list}">
					<td colspan="4">등록된 원자재가 없습니다.</td>
				</c:if>
				<c:forEach items="${list}" var="item">
					<input type="hidden" name="item_no" value="${item.item_no}">
					<tr>
						<td>${item.category}</td>
						<td>${item.item_name}</td>
						<td>${item.item_price}원</td>
						<td><button class="item_delete_btn">삭제</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/>