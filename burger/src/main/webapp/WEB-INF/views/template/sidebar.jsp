<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>

<!-- side-bar -->
	a {
	    color: inherit;
	    text-decoration: none;
	}
	
	.left-side-bar > ul ul {
	    display: none;
	    position: absolute;
	    top: 0;
	    left: 100%;
	    background-color: #dfdfdf;
	}
	
	.left-side-bar {
	    background-color: #dfdfdf;
	    height: 950px;
	    width: 180px;
	    float:left;
	}
	
	.left-side-bar > .status-ico {
	    text-align: right;
	    padding: 10px;
	}
	
	.left-side-bar > ul li {
	    position: relative;
	}
	
	.left-side-bar ul {
	    font-weight: bold;
	    text-align: center;
	    padding: 0;
	}
	
	.left-side-bar ul > li > a {
	    display: block;
	    padding: 10px;
	    white-space: nowrap;
	}
	
	
	.left-side-bar ul > li:hover ul {
	    display: block;
	}
	
	.left-side-bar ul > li:hover > a {
	    color: white;
	    background-color: black;
	}
</style>
<body>

	<div class="upbar">
		
	</div>
	<c:choose>
	<c:when test="${empty sessionScope.super_no}">
    
    </c:when>
    <c:otherwise>
    <div class="left-side-bar">
        <div class="status-ico">
            <span>▶</span>
            <span>▼</span>
        </div>

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
    </c:otherwise>
    </c:choose>