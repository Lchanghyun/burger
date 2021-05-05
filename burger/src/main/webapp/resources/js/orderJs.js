'use strict';

$(function(){
	// 주문 마감
	let Now = new Date();
	let nowMonth = Now.getMonth() +1;
	let nowDay = Now.getDate();
	let nowHour = Now.getHours();
	let nowMins = Now.getMinutes();
	
	function pluszero(time){
		var time = time.toString();
		if(time.length < 2){
			time = '0' + time;
			return time;
		}else{
			return time;
		}
	} 
	nowMonth = pluszero(nowMonth);
	nowDay = pluszero(nowDay);
	nowHour = pluszero(nowHour);
	nowMins = pluszero(nowMins);
	
	var nowTime = '05052100';
		//nowMonth + nowDay + nowHour + nowMins;
	console.log(nowTime);
	var startdate = nowMonth + nowDay + '0900';
	var enddate = nowMonth + nowDay + '2200';
	startdate < nowTime && enddate > nowTime 
	
	//품절
	let status = $("input[value=1]");
	if(status.val() === "1"){
		$(status).parent().addClass("unclick");
		$("<p>").text("품 절").addClass("soldout").prependTo(".unclick");
	}
	
	// 메뉴 버튼 show(), hide()
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
	let sum = 0;
	
	$(".menuList").on("click", function(e){
		if($(this).hasClass("active")){
			console.log("이벤트 중지")
			alert("이미 선택되었습니다.");
			return false;
		}			
		bm_no = $(this).children(".bm_no").text();
		let bm_no_no = $(".add-menu"+bm_no);
		let menu_name = $(this).children(".menu_name").html();
		let menu_price = $(this).children(".menu_price").html();

		//선택된 메뉴 div 생성
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
		$("<span>").text(menu_price+"원").addClass("total_price total_price"+bm_no).prependTo(`#total_menu_price`+bm_no);
		$("<span>").text("합계금액: ").prependTo(`#total_menu_price`+bm_no);
			
		$("#menuEmpty").hide();
		$(this).addClass("active");
		console.log("엑티브를 생성합니다.")
		bm_no = Number(bm_no);
		arr.push(bm_no)
		console.log(arr)
		console.log($(".total_price"+bm_no).text())
		$('html, body').animate({scrollTop : $('#payment').offset().top}, 300);
			
		sum += Number($(this).children(".menu_price").text());
		$("#order_price").text(sum);
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
		$(".total_price"+arr[any-1]).text(price*count+"원");
		sum += price;
		$("#order_price").text(sum);
	});
	$("body").on("click", ".minus-count", function(){
		any = $(this).parent().parent().index();
		let count = $(this).prev().text();			
		count--;
		$(this).prev().text(count);
		let price = $(".price"+arr[any-1]).text();
		price = Number(price);
		console.log(price* count);
		$(".total_price"+arr[any-1]).text(price*count+"원");
		sum -= price;
		$("#order_price").text(sum);
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
	
	let branch_no = $("#branch_no").text();
	
	$("#payment").click(function(e){
		e.preventDefault();
		if(startdate < nowTime && enddate > nowTime ){
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
			if($("#order_price").text() >= 10000){	
				$.ajax({
					async: false,
					url: contexPath+"/burger/order",
					type: "POST",
					data: {
						branch_no : branch_no,
						order_bm_no : arr,
						order_count : countSet
					},
					success: function(resp){
						let order_no = resp;
						self.location.replace( contexPath+"/burger/payment?order_no="+order_no);
					},
					error: function(){
						alert("주문이 실패되었습니다. 잠시후 다시 시도해주세요");
					},
					error: function(resp){
						let member_no = resp;
						alert("주문시 로그인이 필요합니다.");
						document.location.href= contexPath+"/join/login_member";
					}
				});
			}else{
				alert("최소 주문 금액은 10,000원 입니다.");
				return;
			}
		}else { 
			if(enddate < nowTime){
				alert("마지막 주문은 오후 10시까지입니다. 다음날 이용 부탁드립니다.");
				return;				
			}else if(startdate > nowTime){
				alert("주문은 오전 9시부터 가능합니다.");
				return;				
			}
		}
	});
});