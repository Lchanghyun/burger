<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
	<style>
        .menu-register-box{
            width:800px;
            margin:0 auto;
            padding:5rem 1rem;
            display: flex;
            justify-content: center;
        }
        .resetBtn, .registformBtn, .cancleBtn{
        	padding:0.3rem;
        	font-size:17px;
        	background-color:green;
        	color:white;
        	outline:none;
        	border:none;
        	margin-right:10px;
        	width:70px;
        }
        .menu-register-btn{
            margin-bottom: 20px;
        }
        .tableforborder{
        	border:1px solid green;
        }
        .registermenu-table{
            width:700px;
            border-spacing:0;
        }
        tbody > tr > th{
            height: 40px;
            background-color:lightgray;
        }
        .td-border{
        	border-bottom:1px dotted black;
        }
        input[name=menu_name]{
            width:350px;
            margin-left:10px;
        }
        input[name=menu_name],
        input[name=menu_price]{
        	height:20px;
        	outline:none;
        }
        input[name=category],
        input[name=menu_price],
        input[name=file]{
        	margin-left:10px;
        }
        input[name=file]{
        	margin:10px;
        	outline:none;
        }
        .menuphotoshow{
        	padding:0 0.5rem 0.5rem 0.5rem;
        }
    </style>
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
                            <th width="30%">카테고리</th>
                            <td class="td-border" width="70%">
                                <input type="radio" id="c-hamburger" name="category" checked value="햄버거"><label for="c-hamburger">햄버거</label>
                                <input type="radio" id="c-side" name="category" value="사이드"><label for="c-side">사이드</label>
                                <input type="radio" id="c-drink" name="category" value="음료"><label for="c-drink">음료</label>
                            </td>
                        </tr>
                        <tr>
                            <th>메뉴명</th>
                            <td class="td-border"><input type="text" name="menu_name" class="menu_name" ></td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td class="td-border"><input type="number" name="menu_price" class="menu_price_if" > 원</td>
                        </tr>
                        <tr>
                            <th class="photobox">메뉴사진</th>
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
</body>
</html>