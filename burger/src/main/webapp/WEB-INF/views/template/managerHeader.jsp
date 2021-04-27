<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="/" />
    <meta charset="UTF-8">
    <title>BGMG Manager</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/manager-index.css">
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
			    <div class="left-side-bar">
			        <ul>
			            <li>
			                <a href="#">매출관리</a>
			                <ul>
			                    <li><a href="#">1</a></li>
			                    <li><a href="#">2</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="<%=request.getContextPath()%>/purchase/list">발주관리</a>
			                <ul>
			                    <li><a href="<%=request.getContextPath()%>/purchase/list">발주수정</a></li>
			                    <li><a href="#">2</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="#">공지사항</a>
			                <ul>
			                    <li><a href="#">1</a></li>
			                    <li><a href="#">2</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="#">EVENT 관리</a>
			                <ul>
			                    <li><a href="#">1</a></li>
			                    <li><a href="#">2</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="#">지점 아이디 발급</a>
			                <ul>
			                    <li><a href="#">1</a></li>
			                    <li><a href="#">2</a></li>
			                </ul>
			            </li>
			            <li>
			              <a href="#">메뉴 관리</a>
			              <ul>
			                  <li><a href="#">1</a></li>
			                  <li><a href="#">2</a></li>
			              </ul>
			          </li>
			        </ul>
			    </div>
	  </aside>
 <article>