<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>주문하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(function(){		

		let branch_no = $(".branch_no").val();
		
		let category_burger = $("input[value=햄버거]"); 
		let category_drink = $("input[value=음료]"); 
		let category_side = $("input[value=사이드]"); 
		
		category_burger.parent().show();
		category_drink.parent().hide();
		category_side.parent().hide();
		$("#btn_burger").css("color", "black")
		$("#btn_burger").css("border", "4px solid black");
		
		//버튼을 누르면 목록을 불러온다.
		$("#btn_burger").click(function(){
			category_burger.parent().show();
			category_drink.parent().hide();
			category_side.parent().hide();
			$(this).css("color", "black")
			$(this).css("border", "4px solid black");
			$("#btn_drink, #btn_side").css("color", "#818181");
			$("#btn_drink, #btn_side").css("border", "none");
		});
		$("#btn_drink").click(function(){
			category_burger.parent().hide();
			category_drink.parent().show();
			category_side.parent().hide();			
			$(this).css("color", "black")
			$(this).css("border", "4px solid black");
			$("#btn_burger, #btn_side").css("color", "#818181");
			$("#btn_burger, #btn_side").css("border", "none");
		});
		$("#btn_side").click(function(){
			category_burger.parent().hide();
			category_drink.parent().hide();
			category_side.parent().show();
			$(this).css("color", "black")
			$(this).css("border", "4px solid black");
			$("#btn_drink, #btn_burger").css("color", "#818181");
			$("#btn_drink, #btn_burger").css("border", "none");
		});
		// 메뉴 클릭
		let arr = [];
		let bm_no;
		
		$(".menuList").on("click", function(e){
			if($(this).hasClass("active")){
				console.log("이벤트 중지")
				alert("이미 선택되었습니다.");
				return false;
			}			
			bm_no = $(this).children(".bm_no").val();
			let bm_no_no = $(".add-menu"+bm_no);
			let menu_name = $(this).children(".menu_name").html();
			let menu_price = $(this).children(".menu_price").html();

			//선택돈 메뉴 div 생성
			let html = `<div class="add-menu add-menu`+bm_no+`" id="add-menu`+bm_no+`"></div>`;
			let price = `<div class="menu_count menu_price`+bm_no+`" id="menu_price`+bm_no+`"></div>`;
			let totalP = `<div class="total_menu_price total_menu_price`+bm_no+`" id="total_menu_price`+bm_no+`"></div>`;
			let title = `<div class="menu_title menu_title`+bm_no+`" id="menu_title`+bm_no+`"></div>`;
			let del = `<div class="menu_delete menu_delete`+bm_no+`" id="menu_delete`+bm_no+`"></div>`;
			
			$("#array").append(html);
			$(`#add-menu`+bm_no).append(title);
			$(`#add-menu`+bm_no).append(del);
			$(`#add-menu`+bm_no).append(price);
			$(`#add-menu`+bm_no).append(totalP);

			$("<p>").text(menu_price).addClass("price price"+bm_no).prependTo(`#menu_title`+bm_no);
			$("<p>").text(menu_name).addClass("menuName").prependTo(`#menu_title`+bm_no);
			$("<p>").text(bm_no).addClass("Bm_no none").prependTo(`#add-menu`+bm_no);
			
			$("<button>").attr("type", "button").text("x").addClass("btn-del").prependTo(`#menu_delete`+bm_no);

			$("<button>").attr("type", "button").addClass("minus-count").prependTo(`#menu_price`+bm_no);
			$("<span>").text("1").addClass("count count"+bm_no).prependTo(`#menu_price`+bm_no);
			$("<button>").attr("type", "button").addClass("plus-count").prependTo(`#menu_price`+bm_no);			

			$("<br>").appendTo(`#add-menu`+bm_no);
			$("<br>").appendTo(`#add-menu`+bm_no);
			$("<br>").appendTo(`#add-menu`+bm_no);
			$("<hr>").appendTo(`#add-menu`+bm_no);
			$("<span>").text(menu_price).addClass("total_price"+bm_no).prependTo(`#total_menu_price`+bm_no);
			$("<span>").text("합계금액: ").prependTo(`#total_menu_price`+bm_no);
				
			$("#menuEmpty").hide();
			$(this).addClass("active");
			console.log("엑티브를 생성합니다.")
			bm_no = Number(bm_no);
			arr.push(bm_no)
			console.log(arr)
			console.log(branch_no);
			console.log($(".total_price"+bm_no).text())
			
			$("#order_price").text()
		});
		// 전체 삭제
		$("#all-delete").click(function(){
			$(this).next().children().children().not("#menuEmpty").remove();
			$(".menuList").removeClass("active");
			arr.length = 0;
			$("#menuEmpty").show();
			console.log(arr)
		});
		let any;
		// 단품 삭제
		$("body").on("click", ".btn-del", function(){
			any = $(this).parent().parent().index();
			
			$(".add-menu"+arr[any-1]).removeClass("active");
			arr.splice(any-1,1);
			console.log(arr)
			console.log(any)
			
			$(this).parent().parent().remove();

			if(arr.length == 0){
				$("#menuEmpty").show();				
			}
			
		});
		
		//수량 카운트
		$("body").on("click", ".plus-count", function(){
			any = $(this).parent().parent().index();
			let count = $(this).next().text();			
			count++;
			$(this).next().text(count);
			let price = $(".price"+arr[any-1]).text();
			price = Number(price);
			console.log(price* count);
			$(".total_price"+arr[any-1]).text(price*count);

			
		});
		$("body").on("click", ".minus-count", function(){
			any = $(this).parent().parent().index();
			let count = $(this).prev().text();			
			count--;
			$(this).prev().text(count);
			let price = $(".price"+arr[any-1]).text();
			price = Number(price);
			console.log(price* count);
			$(".total_price"+arr[any-1]).text(price*count);
			
			if(count === 0) {
				$(".add-menu"+arr[any-1]).removeClass("active");
				arr.splice(any-1,1);
				console.log(arr)
				console.log(any)
				$(this).parent().parent().remove();
				if(arr.length == 0){
					$("#menuEmpty").show();				
				}	
			}
		});

		$("#payment").click(function(){
			//주문 수량 배열 
			//배열에 맞춰 arr 안에 있는 숫자를 가져와서 count id에 붙여서
			// countSet에 넣는다
			let countSet = [];
			let count;
			for (let i = 0; i < arr.length; i++) {
			count = $(".count"+arr[i]).text();
			count = Number(count);
			countSet.push(count);
			}
			
			$.ajax({
				async: false,
				url: "${pageContext.request.contextPath}/burger/order",
				type: "POST",
				data: {
					branch_no : branch_no,
					order_bm_no : arr,
					order_count : countSet
				},
				success: function(resp){
					let order_no = resp;
					self.location.replace("/burger/burger/payment?order_no="+order_no);
				},
	        	error: function(){
	        		console.log('false2');
	        	}
			});
		});
	});
</script>
<style type="text/css">
	/* 메뉴 리스트 버튼 */
	.btn_list button{
		border: none;
		font-size: 25px;
		background-color: white;
		margin: 0 10px;
		font-weight: bold;
		color: #818181;
	}
	.btn_list button:hover{
		cursor: pointer;
	}
	.btn_list button:focus{
		border: none;
		outline: none;
	}
	/* 주문내역 */
	#array{
		height: auto; 
		min-height: 300px; 
		overflow: auto; 
		width: 1000px; 
		margin-top: 10px;
	}
	.add-menu{
		padding: 0 30px;
	}
	/* 메뉴 타이틀 */	
	.menu_title{
		display: inline-block;	
		width: 800px;
	}
	.menuName{
		font-size: 25px;
		margin-top: 10px;
		margin-bottom: 3px;
	}
	.price{
		font-size: 18px;
		margin: 3px 0;
	}
	/* 주문내역 삭제 버튼*/
	.menu_delete{
		display: inline-block;
		position: relative; 
		left: 100px;
		top: -20px;
	}
	.menu_delete button, 
	#all-delete, #payment{
		border: none;
		background-color: white;
		margin: 0 10px;
		font-size: 30px;
		font-weight: bold;
		color: #818181;
	}
	#all-delete, #payment{
		border: 3px solid #818181;
		border-radius: 3px;
		font-size: 18px;
	}
	#all-delete{
		position: relative;
		left: 800px;	
	}
	#all-delete:hover, 
	#payment:hover{
		border: 4px solid black;
		border-radius: 3px;
		color: black;
		cursor: pointer;
	}
	#payment:hover{
		color: #EE4E34;
		border: 4px solid #EE4E34;
	}
	.menu_delete button:hover{
		cursor: pointer;
		color: black;
	}
	.menu_delete button:focus{
		border: none;
		outline: none;
	}
	/* 수량 카운트 */
	.menu_count{
		display: inline-block;	
		width: 105px;
		height: 30px;
		text-align: center;
		box-shadow: 0 2px 5px -4px grey;
		position: relative;
		left: 800px;
	}
	.menu_count button:hover{
		cursor: pointer;
	}
	.plus-count{
		border: none;
		width: 30px;
		height: 30px;
		background: #d9d9d9 url(/burger/resources/img/+.png) no-repeat 50%;
		border-radius: 5px 0 0 5px;
	}
	.count{
		font-size: 25px;
		font-weight: bold;
		color: #818181;
		width: 45px;
		height: 30px;
		display: inline-block;
		position: relative;
		top: -6px;				
	}
	.minus-count{
		border: none;
		width: 30px;
		height: 30px;
		background: #d9d9d9 url(/burger/resources/img/-.png) no-repeat 50%;
		border-radius: 0 5px 5px 0;
	}	
	/* total 금액 */
	.total_menu_price{
		display: inline-block;
		position: relative;
		left: 610px;
		top: 40px;
		font-size: 25px;
		margin-top: 5px;
	}
	.none{
		display: none;
	}
	#total{
		display: inline-block;
		position: relative;
		left: 710px;
	}
</style>
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
	<br><br>
	<div style="display: inline-block;">
		<h3 style="margin: 0 0 0 50px; font-size: 40px;">메뉴</h3>
	</div>
	<div class="btn_list" style="display: inline-block; position: relative; left: 700px;">
		<button id="btn_burger">BURGER</button>
		<button id="btn_drink">DRINK</button>
		<button id="btn_side">SIDE</button>
	</div>
	<br><br>
		<div style="width: 1140px; padding: 30px;">
			<div id="menu" >
				<c:choose>
					<c:when test="${empty orderList}">
						<p>게시물이 없습니다.</p>
					</c:when>
						<c:otherwise>
						<c:forEach items="${orderList}" var="MenuBranchMenuVo" >
							<c:if test="${MenuBranchMenuVo.menu_status != '2' and MenuBranchMenuVo.menu_status != '3'}">
								<div class="menuList add-menu${MenuBranchMenuVo.bm_no}" style="display: inline-block; text-align: center; width: 280px">
										<img alt="메뉴사진" src="http://placeimg.com/200/200/hamburger">
										<p class="menu_name">${MenuBranchMenuVo.menu_name}</p>
										<p class="menu_price">${MenuBranchMenuVo.menu_price}</p>
										<input class="branch_no" type="hidden" value="${MenuBranchMenuVo.branch_no}">
										<input class="bm_no" type="hidden" value="${MenuBranchMenuVo.bm_no}">
										<input type="hidden" value="${MenuBranchMenuVo.menu_status}">
										<input type="hidden" value="${MenuBranchMenuVo.category }">
										<br>
								</div>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>				
			</div>
		</div>
		<div style="display: inline-block;">
			<h3 style="margin: 0 0 0 50px; font-size: 40px;">주문내역</h3>
		</div>
		<button id="all-delete">전체 삭제</button>
			<div style="width: 1000px; margin: 0 auto;">
				<div id="array">
					<div id="menuEmpty" style="padding: 10px 30px;">제품을 선택해주세요</div>								
				</div>
			</div>
		<div id="total">
			<p style="font-size: 25px;">주문 총 금액: <span id="order_price"></span></p>	
		</div>
		<input type="button" id="payment" value="주문하기">			
		<br><br>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
		