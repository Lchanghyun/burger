<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BGMG Manager</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/manager-index.css">
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
        }
    </style>
</head>
<body>
    <main>
        <header>
                <div class="header-inner">
                    <div class="inner-fl">
                        <p>BGMG</p>
                    </div>
                    <div class="inner-fr">
                       <p>
                            <a href="#" class="btn-login">LOGIN</a>
                            <a href="#" class="btn-email">E-MAIL</a>
                        </p>
                    </div>
                </div>
        </header>
        <section>
            <aside>
                <!--승주야 여기에 메뉴바 넣으면 될 것 같아여-->
            </aside>
           <article>