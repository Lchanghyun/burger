<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
	.category_link{
		text-decoration : none;
		font-size : 25px; 
		color : black;
		padding : 0 40px;
	}
	.select_category{
		font-size : 28px;
		font-weight : bold;
	}
	.category_link:hover{
		font-weight: bold;
	}
	.item_list_table{
		margin : 10px auto;
		border : 1px solid black;
		border-collapse: collapse;
		width : 1100px;
	}
	.item_list_table >thead>tr> th,
	.item_list_table >tbody>tr> td {
		border-bottom : 1px solid black;
		padding : 12px;
		width : 240px;  
		text-align : center;
		font-size : 18px;
	}
	.list_all_wrapper{
		text-align : center;
	}
	.list_border{
		width : clamp(800px, 1600px, 2000px);
		height : 490px;
		border : 1px solid black;
		position : absolute; 
		top : 27%;
		left : clamp(210px, 12%, 12%);
		display : flex;
		flex-direction : cloumn;
		justify-content : center;
		padding : 30px 0 0 0;
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
	.item_list_btn{
		position : absolute;
		top: clamp(10px, 16% , 500px);
		right: clamp(20px, 4%, 400px);  
	}
	.item_edit_btn{
		position : absolute;
		right: clamp(200px, 15%, 500px);     
	}
	.item_edit_btn,
	.item_list_btn{
		border : none;				
		border-radius: 5px;
		width : 120px;
		padding : 3px;
		font-size : 18px;
		font-weight: bold;
		color : white;
		background-color : #EE4E34; 
		margin-right : 10px;  
		height : 35px; 
	}
	.item_name_input{
		padding : 5px;
		font-size : 15px;
		width : 150px;
		text-align : right; 		
	} 
	.item_price_input{
		padding : 5px;
		font-size : 15px;
		width : 80px;
		text-align : right; 
	}
	.item_category_select{
		padding : 5px;
		font-size : 15px; 
		width : 100px;	
		text-align : center; 
	}
	button{
		cursor : pointer;
	}
</style>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
<script>
	$(function(){
		
		$(".item_list_btn").on("click", function(e){
			e.preventDefault()
			
			location.href="${pageContext.request.contextPath}/item/list"
		})
		let category = '<c:out value="${category}"/>';
	
		let list=[]
		let item_no
		let item_price
		let item_category
		
		$(".item_price_input").on("blur", function(){
			item_price = $(this).val()
			item_category=$(this).parent().prev().prev().children().val() 
			item_no = $(this).parent().parent().prev().val()
			item_name = $(this).parent().prev().children().val()
			list_check(item_no)
			list.push({"item_no" : item_no, "item_price" : item_price, "item_name" : item_name, "category" : item_category})
		})
		$(".item_name_input").on("blur", function(){
			item_name=$(this).val()
			item_category=$(this).parent().prev().children().val()
			item_no = $(this).parent().parent().prev().val()
			item_price=$(this).parent().next().children().val()
			list_check(item_no)
			list.push({"item_no" : item_no, "item_price" : item_price, "item_name" : item_name, "category" : item_category})
		})
		$(".item_category_select").on("change", function(){
			item_category=$(this).val()
			item_no=$(this).parent().parent().prev().val()
			item_name=$(this).parent().next().children().val()
			item_price=$(this).parent().next().next().children().val()
			list_check(item_no) 
			list.push({"item_no" : item_no, "item_price" : item_price, "item_name" : item_name, "category" : item_category})
		})
		
		function list_check(item_no){
			$.each(list, function(index, element){
				if(element.item_no === item_no){
					delete list[index]
					return false;
				}
			})
		}
		$(".item_edit_btn").on("click", function(e){
			e.preventDefault()
			
			let temp = JSON.stringify(list)
			console.log(list)
			Swal.fire({ icon: 'error', 
               	title: '수정하시겠습니까?', 
               	icon: 'warning', 
               	showCancelButton: true, 
               	confirmButtonColor: '#3085d6', 
               	cancelButtonColor: '#d33', 
               	confirmButtonText: '수정', 
               	cancelButtonText: '취소'
        		}).then((result) => { 
        			if (result.isConfirmed) { 
        				Swal.fire({
        					icon: 'success',
        				   	title:'수정되었습니다'
        				});
        				
        				
   						$.ajax({
   							url:"${pageContext.request.contextPath}/item/edit",
   							type: "POST",
   							data: {
   								item_list : temp,
   								category : category
   							},
   							success: function(resp){
   								setTimeout(function(){
   									location.href="${pageContext.request.contextPath}/item/edit"
   		        				},1500)
   							}			
   						})	
     				}
       			})
		})
		
	})
</script>
<div style="height: calc(100% - 162px);">
	<div class="page_title">원자재 수정</div>
	<button class="item_list_btn">원자재 목록</button>
	<hr class="hr_line">
	<div class="list_border">
		<div class="list_all_wrapper">
			<div class="category_wrapper">
				<c:choose>
					<c:when test="${category eq '채소류'}">
						<a href="edit?category=채소류" class="category_link select_category">채소류</a>
					</c:when>
					<c:otherwise>
						<a href="edit?category=채소류" class="category_link">채소류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '육류'}">
						<a href="edit?category=육류" class="category_link select_category">육류</a>
					</c:when>
					<c:otherwise>
						<a href="edit?category=육류" class="category_link">육류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '제과류'}">
						<a href="edit?category=제과류" class="category_link select_category">제과류</a>
					</c:when>
					<c:otherwise>
						<a href="edit?category=제과류" class="category_link">제과류</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '음료'}">
						<a href="edit?category=음료" class="category_link select_category">음료</a>
					</c:when>
					<c:otherwise>
						<a href="edit?category=음료" class="category_link">음료</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '소모품'}">
						<a href="edit?category=소모품" class="category_link select_category">소모품</a>
					</c:when>
					<c:otherwise>
						<a href="edit?category=소모품" class="category_link">소모품</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${category eq '단종'}">
						<a href="edit?category=단종" class="category_link select_category">단종</a>
					</c:when>
					<c:otherwise>
						<a href="edit?category=단종" class="category_link">단종</a>
					</c:otherwise>
				</c:choose>
			</div>
			<table class="item_list_table">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>자재명</th>
						<th>단가</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list}">
					<td colspan="3">등록된 원자재가 없습니다.</td>
				</c:if>
				<c:forEach items="${list}" var="item">
					<input type="hidden" name="item_no" value="${item.item_no}">
					<tr>
						<td>
							<select name="category" class="item_category_select">
								<c:if test="${item.category eq '채소류'}">
									<option value="채소류" selected>채소류</option>
									<option value="육류">육류</option>
									<option value="제과류">제과류</option>
									<option value="음료">음료</option>
									<option value="소모품">소모품</option>
								</c:if>
								<c:if test="${item.category eq '육류'}">
									<option value="육류" selected>육류</option>
									<option value="채소류">채소류</option>
									<option value="제과류">제과류</option>
									<option value="음료">음료</option>
									<option value="소모품">소모품</option>
								</c:if>
								<c:if test="${item.category eq '제과류'}">
									<option value="제과류" selected>제과류</option>
									<option value="채소류">채소류</option>
									<option value="육류">육류</option>
									<option value="음료">음료</option>
									<option value="소모품">소모품</option>
								</c:if>
								<c:if test="${item.category eq '음료'}">
									<option value="음료" selected>음료</option>
									<option value="채소류">채소류</option>
									<option value="육류">육류</option>
									<option value="제과류">제과류</option>
									<option value="소모품">소모품</option>
								</c:if>
								<c:if test="${item.category eq '소모품'}">
									<option value="소모품" selected>소모품</option>
									<option value="채소류">채소류</option>
									<option value="육류">육류</option>
									<option value="제과류">제과류</option>
									<option value="음료">음료</option>
								</c:if>
								<c:if test="${item.category eq '단종'}">
									<option value="단종" selected>단종</option>
									<option value="채소류">채소류</option> 
									<option value="육류">육류</option>
									<option value="제과류">제과류</option>
									<option value="음료">음료</option>
									<option value="소모품">소모품</option>
								</c:if>
							</select>
						</td>
						<td><input type="text" name="item_name" value="${item.item_name}" class="item_name_input" required></td>
						<td><input type="text" name="item_price" value="${item.item_price}" class="item_price_input" required></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<button class="item_edit_btn">수정 완료</button> 
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/>