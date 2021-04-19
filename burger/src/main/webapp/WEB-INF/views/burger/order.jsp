<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>햄버거 주문하기</title>
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
		
		//버튼을 누르면 목록을 불러온다.
		$("#btn_burger").click(function(){
			category_burger.parent().show();
			category_drink.parent().hide();
			category_side.parent().hide();
		});
		$("#btn_drink").click(function(){
			category_burger.parent().hide();
			category_drink.parent().show();
			category_side.parent().hide();			
		});
		$("#btn_side").click(function(){
			category_burger.parent().hide();
			category_drink.parent().hide();
			category_side.parent().show();		
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
			let html = `<div class="add-menu`+bm_no+`" id="add-menu`+bm_no+`"></div>`;

			
			$("#array").append(html);
			$("<button>").attr("type", "button").text("x").addClass("btn-del").prependTo(`#add-menu`+bm_no);
			$("<button>").attr("type", "button").text("-").addClass("minus-count").prependTo(`#add-menu`+bm_no);
			$("<span>").text("1").addClass("count"+bm_no).prependTo(`#add-menu`+bm_no);
			$("<button>").attr("type", "button").text("+").addClass("plus-count").prependTo(`#add-menu`+bm_no);
			$("<p>").text(menu_price).addClass("price"+bm_no).prependTo(`#add-menu`+bm_no);
			$("<p>").text(menu_name).addClass("menuName").prependTo(`#add-menu`+bm_no);
			$("<p>").text(bm_no).addClass("Bm_no none").prependTo(`#add-menu`+bm_no);
				
			$("#menuEmpty").hide();
			$(this).addClass("active");
			console.log("엑티브를 생성합니다.")
			bm_no = Number(bm_no);
			arr.push(bm_no)
			console.log(arr)
			console.log(branch_no);
		});
		// 전체 삭제
		$("#all-delete").click(function(){
			$(this).next().children().not("#menuEmpty").remove();
			$(".menuList").removeClass("active");
			arr.length = 0;
			$("#menuEmpty").show();
			console.log(arr)
		});
		let any;
		// 단품 삭제
		$("body").on("click", ".btn-del", function(){
			any = $(this).parent().index();
			
			$(".add-menu"+arr[any-1]).removeClass("active");
			arr.splice(any-1,1);
			console.log(arr)
			console.log(any)
			
			$(this).parent().remove();

			if(arr.length == 0){
				$("#menuEmpty").show();				
			}
			
		});
		
		//수량 카운트
		$("body").on("click", ".plus-count", function(){
			let count = $(this).next().text();			
			count++;
			$(this).next().text(count);			
			console.log("count 증가 + "+ count)
		});
		$("body").on("click", ".minus-count", function(){
			let count = $(this).prev().text();			
			count--;
			console.log("count 감소 - "+ count)
			$(this).prev().text(count);			
			if(count === 0) {
				any = $(this).parent().index();
				$(".add-menu"+arr[any-1]).removeClass("active");
				arr.splice(any-1,1);
				console.log(arr)
				console.log(any)
				$(this).parent().remove();
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
	.none{
		display: none;
	}
</style>
</head>
<body>
	<a href="/burger">home으로</a>
	<h3>메뉴</h3>
		<button id="btn_burger">BURGER</button>
		<button id="btn_drink">DRINK</button>
		<button id="btn_side">SIDE</button>
		<br>
		<br>
		<div id="menu" style="width: 700px; float: left;" >
			<c:choose>
				<c:when test="${empty orderList}">
					<p>게시물이 없습니다.</p>
				</c:when>
					<c:otherwise>
					<c:forEach items="${orderList}" var="MenuBranchMenuVo" >
						<c:if test="${MenuBranchMenuVo.menu_status != '2' and MenuBranchMenuVo.menu_status != '3'}">
							<div class="menuList add-menu${MenuBranchMenuVo.bm_no}" style="display: inline-block;">
									<img alt="메뉴사진" src="http://placeimg.com/200/200/hamburger">
									<p class="menu_name">${MenuBranchMenuVo.menu_name}</p>
									<p class="menu_price">${MenuBranchMenuVo.menu_price}</p>
									<input class="branch_no" type="hidden" value="${MenuBranchMenuVo.branch_no}">
									<input class="bm_no" type="hidden" value="${MenuBranchMenuVo.bm_no}">
									<input type="hidden" value="${MenuBranchMenuVo.menu_status}">
									<input type="hidden" value="${MenuBranchMenuVo.category }">
									<p>--------------------------------------</p>
							</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>				
		</div>
		<div id="total">
			<p>총 금액: <span id="total_price"></span></p>	
		</div>
		<button type="button" id="all-delete">전체 삭제</button>
			<div id="array" style="width: 300px; border: 1px solid black; height: 600px; float: right;">
				<div id="menuEmpty">제품을 선택해주세요</div>				
				
			</div>
		<br><br>
		<input type="button" id="payment" value="주문하기">			

</body>
</html>