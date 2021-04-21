<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menuAdmin.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
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
    				url: "checkMenu",
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
    			location.href = "superlist";
    		})
    		$("#menu_photo").on("change", function(e){
    			let files = e.target.files;
    			let file = files[0];
    			let formData = new FormData();
    			formData.append("file",file);
    			$.ajax({
    				url:"thumbUpload",
    				processData : false,
    				contentType: false,
    				data : formData,
    				dataType:"text",
    				type:"POST",
    				success: function(res){
    					$(".menuphotoshow").children().remove();
    					let str = "<div><img src='photoShow?fileName="+res+"'></div>";
    					$(".menuphotoshow").append(str);
    				}
    			})
    		})
    	})
    </script>
</head>
<body>
	<div class="adminbox">
		<div class="menubar">메뉴바</div>
		<div class="menu-register-box">
	        <form id="menu" action="register" method="post" enctype="multipart/form-data">
	            <div class="menu-register-btn">
	                <input type="reset" value="초기화" class="resetBtn">
	                <input type="submit" value="등록" class="registformBtn">
	                <input type="button" value="취소" class="cancleBtn">
	            </div>
	            <div class="tableforborder">
	                <table class="registermenu-table">
	                    <tbody>
	                        <tr>
	                            <th width="30%">카테고리 <span class="requiredSign">*</span></th>
	                            <td class="td-border" width="70%">
	                                <input type="radio" id="c-hamburger" name="category" checked value="햄버거"><label for="c-hamburger">햄버거</label>
	                                <input type="radio" id="c-side" name="category" value="사이드"><label for="c-side">사이드</label>
	                                <input type="radio" id="c-drink" name="category" value="음료"><label for="c-drink">음료</label>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>메뉴명 <span class="requiredSign">*</span></th>
	                            <td class="td-border"><input type="text" name="menu_name" class="menu_name" ></td>
	                        </tr>
	                        <tr>
	                            <th>가격 <span class="requiredSign">*</span></th>
	                            <td class="td-border"><input type="number" name="menu_price" class="menu_price_if" > 원</td>
	                        </tr>
	                        <tr>
	                            <th class="photobox">메뉴사진 <span class="requiredSign">*</span></th>
	                            <td>
	                                <input type="file" id="menu_photo" name="file" accept=".png, .jpg, .gif" >
	                                <div class="menuphotoshow"></div>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	        </form>
	    </div>
    </div>
</body>
</html>