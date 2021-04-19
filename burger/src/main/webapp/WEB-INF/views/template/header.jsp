<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BGMG</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="${path}/resources/js/indexJs.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/index.css">
    <script>
        
    </script>
    <style>
        #join{
            width: 100px;
            height: 30px;
            padding: 3px;
            padding-top: 6px;
            background-color:#EE4E34;
            color: white;
            border: none;
            font-family: 'GmarketSansMedium';
            font-size: 15px;
            font-weight: bold;
            border-radius: 3px;
        }
        #join:hover{
            cursor: pointer;
            background-color:#FCEDDA;
            color: #EE4E34;
        }            
    </style>
</head>
<body>
    <main>
        <header>
                <div class="header-inner">
                    <div>
                        <p><a href="#">ORDER</a></p>
                    </div>
                    <div>
                        <p><a href="#">BURGER&amp;DRINK</a></p>
                    </div>
                    <div class="logo">
                        <img src="${path}/resources/img/bgmg_log.png" alt="로고">
                    </div>
                    <div>
                        <p><a href="#">LOGIN</a></p>
                    </div>
                    <div>
                        <p><a href="#">JOIN</a></p>
                    </div>                
                </div>
        </header>
        <section>
            <article>