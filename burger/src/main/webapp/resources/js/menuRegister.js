$(function(){
	$(".resetBtn").click(function(){
		$(".menuphotoshow").children().remove();
	})
	$(".registformBtn").click(function(e){
		e.preventDefault();
		if(!$(".menu_name").val()){
			alert("메뉴명을 입력하세요.");
			return;
		}
		if(!$(".menu_price_if").val()){
			alert("가격을 입력하세요.");
			return;
		}
		if($(".menu_price_if").val() <= 0){
			alert("가격을 다시 입력하세요");
			return;
		}
		if(!$("#menu_photo").val()){
			alert("이미지를 선택하세요.");
			return;
		}
		let menu_name = $(".menu_name").val();
		$.ajax({
			url: "/burger/menu/checkMenu",
			type: "POST",
			data: {
				menu_name : menu_name
			},
			success: function(res){
				if(res === 'o'){
					alert("이미 존재하는 메뉴 이름입니다.");
				}
				else{
					$("#menu").submit();
				}
			}
		})
	})
	$(".cancleBtn").click(function(){
		history.back();
	})
	$("#menu_photo").on("change", function(e){
		let files = e.target.files;
		let file = files[0];
		let formData = new FormData();
		formData.append("file",file);
		$.ajax({
			url:"/burger/menu/thumbUpload",
			processData : false,
			contentType: false,
			data : formData,
			dataType:"text",
			type:"POST",
			success: function(res){
				$(".menuphotoshow").children().remove();
				let str = "<div><img src='/burger/menu/photoShow?fileName="+res+"'></div>";
				$(".menuphotoshow").append(str);
			}
		})
	})
})