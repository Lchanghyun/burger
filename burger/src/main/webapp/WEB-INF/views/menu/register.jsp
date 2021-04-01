<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
<style>
        .menu-register-box{
            width:600px;
            margin:0 auto;
            padding:1rem;
            display: flex;
            justify-content: center;
        }
        .menu-register-form{
            
        }
        .menu-register-btn{
            margin-bottom: 20px;
        }
        .registermenu-table{
            width:550px;
        }
        tbody > tr > th{
            height: 35px;
        }
        input[name=menu_name]{
            width:350px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	$(function(){
    		$("#menu_photo").on("change", function(e){
    			let files = e.target.files;
    			let file = files[0];
    			console.log(file);
    		})
    	})
    </script>
</head>
<body>
	<div class="menu-register-box">
        <form id="menu" action="register" method="post" enctype="multipart/form-data">
            <div class="menu-register-btn">
                <input type="reset" value="초기화">
                <input type="submit" value="등록">
            </div>
            <div>
                <table class="registermenu-table">
                    <tbody>
                        <tr>
                            <th width="30%">카테고리</th>
                            <td width="70%"> <!--가격 -로 못가게 alert-->
                                <input type="radio" id="c-hamburger" name="category" checked value="햄버거"><label for="c-hamburger">햄버거</label>
                                <input type="radio" id="c-side" name="category" value="사이드"><label for="c-side">사이드</label>
                                <input type="radio" id="c-drink" name="category" value="음료"><label for="c-drink">음료</label>
                            </td>
                        </tr>
                        <tr>
                            <th>메뉴명</th>
                            <td><input type="text" name="menu_name"></td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td><input type="number" name="menu_price"> 원</td>
                        </tr>
                        <tr>
                            <th>메뉴사진첨부</th>
                            <td>
                                <input type="file" id="menu_photo" name="file">
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