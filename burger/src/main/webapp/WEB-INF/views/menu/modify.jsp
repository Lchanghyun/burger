<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴수정</title>
	<style>
        .menu-register-box{
            width:800px;
            margin:0 auto;
            padding:5rem 1rem;
            display: flex;
            justify-content: center;
        }
        .resetBtn, .modifyBtn, .cancleBtn{
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
        .photoChangeBtn{
        	margin:10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	$(function(){
    		let str = "<div><img src='photoShow?fileName=/thumbnail/th_${menu.upload_name}'></div>";
			console.log(str);
			$(".menuphotoshow").append(str);
			$("#menu_photo").hide();
			
    		$(".photoChangeBtn").click(function(){
    			//$(".menuphotoshow").children().remove();
    			$(this).remove();
    			$("#menu_photo").show();
    		})
    		$(".resetBtn").click(function(){
    			$(".menuphotoshow").children().remove();
    		})
    		$(".cancleBtn").click(function(){
    			location.href = "superlist";
    		})
    		$("#menu").submit(function(e){
    			if(!($(".menu_price_if").val()>0)){
    				e.preventDefault();
    				alert("가격을 다시 입력해주세요");
    			}
    		})
    		$("#menu_photo").on("change", function(e){
    			console.log("썸네일");
    			let files = e.target.files;
    			let file = files[0];
    			console.log(file);
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
    					console.log(res);
    					$(".menuphotoshow").children().remove();
    					let str = "<div><img src='photoShow?fileName="+res+"'></div>";
    					console.log(str);
    					$(".menuphotoshow").append(str);
    				}
    			})
    		})
    	})
    </script>
</head>
<body>
	<div class="menu-register-box">
        <form id="menu" action="modify" method="post" enctype="multipart/form-data">
            <div class="menu-register-btn">
            	<input type="hidden" value="${menu.menu_no}" name="menu_no">
                <input type="reset" value="초기화" class="resetBtn">
                <input type="submit" value="수정" class="modifyBtn">
                <input type="submit" value="취소" class="cancleBtn">
            </div>
            <div class="tableforborder">
                <table class="registermenu-table">
                    <tbody>
                        <tr>
                            <th width="30%">카테고리</th>
                            <td class="td-border" width="70%">
                            	<c:choose>
                            		<c:when test="${menu.category eq '햄버거'}">
	                            		<input type="radio" id="c-hamburger" name="category" checked value="햄버거"><label for="c-hamburger">햄버거</label>
		                                <input type="radio" id="c-side" name="category" value="사이드"><label for="c-side">사이드</label>
		                                <input type="radio" id="c-drink" name="category" value="음료"><label for="c-drink">음료</label>
                            		</c:when>
                            		<c:when test="${menu.category eq '사이드'}">
	                            		<input type="radio" id="c-hamburger" name="category" value="햄버거"><label for="c-hamburger">햄버거</label>
		                                <input type="radio" id="c-side" name="category" value="사이드" checked><label for="c-side">사이드</label>
		                                <input type="radio" id="c-drink" name="category" value="음료"><label for="c-drink">음료</label>
                            		</c:when>
                            		<c:otherwise>
                            			<input type="radio" id="c-hamburger" name="category" value="햄버거"><label for="c-hamburger">햄버거</label>
		                                <input type="radio" id="c-side" name="category" value="사이드"><label for="c-side">사이드</label>
		                                <input type="radio" id="c-drink" name="category" value="음료" checked><label for="c-drink">음료</label>
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th>메뉴명</th>
                            <td class="td-border"><input type="text" name="menu_name" required value="${menu.menu_name}"></td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td class="td-border"><input type="number" name="menu_price" required class="menu_price_if" value="${menu.menu_price}"> 원</td>
                        </tr>
                        <tr>
                            <th class="photobox">메뉴사진</th>
                            <td class="photoPlace">
                                <input type="button" value="사진변경하기" class="photoChangeBtn">
                                <input type="file" id="menu_photo" name="file" accept=".png, .jpg, .gif">
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