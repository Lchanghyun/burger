<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
	.whole_wrapper{
		height : calc(100% - 162px) ;
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
	.btn_wrapper{
		position : absolute;
		top: clamp(10px, 16% , 500px);
		left: clamp(600px, 84%, 1700px);  
		width : 240px;  
	}
	.item_list_wrapper{
		text-align : center; 
	}
	.item_name_input{
		padding : 5px;
		font-size : 15px;
		width : 120px;
		text-align : right; 
	}
	.item_price_input{
		padding : 5px;
		font-size : 15px;
		width : 50px;
		text-align : right; 
	}
	.item_list_btn{
		position : absolute;
		top: clamp(10px, 16% , 500px);
		right: clamp(20px, 4%, 400px);  
	}
	.item_list_btn,
	.item_register_btn{
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
	.item_category_select{
		padding : 5px;
		font-size : 15px; 
	}
	.input_wrapper{
		margin : 10px auto;
	}
	button{
		cursor : pointer;
	}
</style>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
<script>
	$(function(){
		$(".item_register_btn").on("click", function(e){
			e.preventDefault();
			
			$(".item_register_form").submit()
		})
		
		$(".item_list_btn").on("click", function(e){
			e.preventDefault()

			location.href="${pageContext.request.contextPath}/item/list"
		})
		
		let msg = '<c:out value="${msg}"/>';

		if(msg!==""){
	    	Swal.fire({ icon: 'error', 
            	title: msg, 
      		});
		}
	})
</script>
<div class="whole_wrapper">
	<div class="page_title">원자재 추가</div>
	<button class="item_list_btn">원자재 목록</button>		 
	<hr class="hr_line">  
	<div class="list_border">
		<div class="item_list_wrapper">
			<div class="input_wrapper">
				<form action="register" method="POST" class="item_register_form">
					<select name="category" class="item_category_select">
						<option value="채소류">채소류</option>
						<option value="육류">육류</option>
						<option value="제과류">제과류</option>
						<option value="음료">음료</option>
						<option value="소모품">소모품</option>
					</select>
					<input type="text" class="item_name_input" name="item_name" placeholder="자재명" required>
					<input type="text" class="item_price_input" name="item_price" placeholder="단가" required>
				</form>
			</div>
			<button class="item_register_btn">등록</button>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/>
