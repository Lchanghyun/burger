$(function(){
	$(".StopModify").hide();
	$(".CategorySelectBtn").hide();
	$(".CategoryCancleBtn").hide();
	
	$(".menuinsertBtn").click(function(){
		location.href = "/burger/menu/register";
	})
	$(".menuRemove").click(function(){
		let menuName = $(this).parent().prev().prev().prev().children().last().text();
		let conf = confirm(menuName+"을(를) 단종시키겠습니까?");
		if(conf){
			let menu_no = $(this).prev().val();
			$.ajax({
				url: "/burger/menu/remove",
				type:"POST",
				data:{
					menu_no: menu_no,
				},
				success:function(res){
					if(res=='remove'){
						alert("단종되었습니다.");
						location.reload();
					}
				}
			})
		}
	})
	$(".menuStopCancle").click(function(){
		$(this).parent().prev().prev().prev().children().hide();
		$(this).hide();
		$(this).parent().prev().prev().prev().find(".StopModify").show();
		$(this).next().next().show();
		$(this).next().next().next().show();
	})
	$(".CategorySelectBtn").click(function(){
		let category = $(this).parent().prev().prev().prev().find(".StopModify").val();
		let menu_no = $(this).prev().val();
		$.ajax({
			url: "/burger/menu/stopModify",
			type: "POST",
			data: {
				menu_no : menu_no,
				category : category
			},
			success: function(msg){
				if(msg === 'success'){
					location.reload();
				}
			}
		})
	})
	$(".CategoryCancleBtn").click(function(){
		$(this).parent().prev().prev().prev().children().show();
		$(this).hide();
		$(this).prev().prev().prev().show();
		$(this).prev().hide();
		$(this).parent().prev().prev().prev().find(".StopModify").hide();
	})
	$(".listphotoshow").click(function(){
		let save_name = $(this).prev().val();
		let menu_name = $(this).next().text();
		let openPhoto = window.open("","photo", "width=600px, height=550px");
		openPhoto.document.write("<html><head><title>"+menu_name+"</title></head><body><div><img width='590px' height='530px' src='/burger/menu/photoShow?fileName="+save_name+"'></div></body></html>");
	})
	$(".menuAdd").click(function(){
		let menu_no = $(this).prev().val();
		$.ajax({
			url: "/burger/menu/menuAdd",
			type:"POST",
			data:{
				menu_no: menu_no,
			},
			success:function(res){
				if(res=='add'){
					alert("추가되었습니다.");
					location.reload();
				}
			}
		})
	})
	$(".menuBranchRemove").click(function(){
		let menuName = $(this).parent().prev().prev().prev().children().last().text();
		let conf = confirm(menuName+"을(를) 판매 중지하시겠습니까?");
		if(conf){
			let menu_no = $(this).prev().val();
			$.ajax({
				url: "/burger/menu/removeBranchMenu",
				type:"POST",
				data:{
					menu_no: menu_no,
					menu_status:'2'
				},
				success:function(res){
					if(res=='ok'){
						alert("판매가 중지되었습니다.");
						location.reload();
					}
				}
			})
		}
	})
	$(".stopResale").click(function(){
		let menuName = $(this).parent().prev().prev().children().last().text();
		let conf = confirm(menuName+"을(를) 재 판매하시겠습니까?");
		if(conf){
			let menu_no = $(this).prev().val();
			$.ajax({
				url: "/burger/menu/removeBranchMenu",
				type:"POST",
				data:{
					menu_no: menu_no,
					menu_status:'0'
				},
				success:function(res){
					if(res=='ok'){
						alert("판매를 다시 시작했습니다.");
						location.reload();
					}
				}
			})
		}
	})
	$(".menuSoldout").click(function(){
		let menuName = $(this).parent().prev().prev().children().last().text();
		let conf = confirm(menuName+"을(를) 품절 처리하시겠습니까?");
		if(conf){
			let menu_no = $(this).prev().val();
			$.ajax({
				url: "/burger/menu/soldoutAndResale",
				type:"POST",
				data:{
					menu_no: menu_no,
					menu_status: '1'
				},
				success:function(res){
					if(res=='success'){
						alert("품절 처리되었습니다.");
						location.reload();
					}
				}
			})
		}
	})
	$(".menuResale").click(function(){
		let menuName = $(this).parent().prev().prev().children().last().text();
		let menu_no = $(this).prev().val();
		$.ajax({
			url: "/burger/menu/soldoutAndResale",
			type:"POST",
			data:{
				menu_no: menu_no,
				menu_status: '0'
			},
			success:function(res){
				if(res=='success'){
					alert(menuName+" 판매를 시작했습니다.");
					location.reload();
				}
			}
		})
	})
})