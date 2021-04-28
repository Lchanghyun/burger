$(function(){
	$(".photoChangeBtn").click(function(){
		$(this).remove();
		$("#menu_photo").show();
	})
	$(".resetBtn").click(function(){
		$(".menuphotoshow").children().remove();
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