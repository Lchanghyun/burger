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
<!-- 본사 -->
<c:choose>
	<c:when test ="${sessionScope.super_no != null}">
    <div class="left-side-bar">
			        <ul>
			            <li>
			                <a href="${pageContext.request.contextPath}/chart/supervisorChart">매출관리</a>
			            </li>
			            <li>
			                <a onclick="">자재, 발주</a>
			                <ul>
			                    <li><a href="${pageContext.request.contextPath}/item/list">자재목록</a></li>
			                    <li><a href="${pageContext.request.contextPath}/purchase/superpurchaselist">발주목록</a></li>
			                </ul>
			            </li>
			            <li>
			                <a href="${pageContext.request.contextPath}/notice/notice_list">공지사항</a>
			            </li>
			            <li>
			                <a href="${pageContext.request.contextPath}/join/branch_join">지점 아이디 발급</a>
			            </li>
			            <li>
			              <a href="${pageContext.request.contextPath}/menu/superlist">메뉴 관리</a>
			          </li>
			        </ul>
			    </div>
	</c:when>
<!-- 지점 -->
	<c:when test = "${sessionScope.branch_no != null }"	>
    <div class="left-side-bar">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/chart/branchChart">매출관리</a>
            </li>
            <li>
                <a onclick="">자재, 발주</a>
                <ul>
                	<li><a href="${pageContext.request.contextPath}/stock/chart">재고분석</a></li>
                    <li><a href="${pageContext.request.contextPath}/purchase/list">발주목록</a></li>
                </ul>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/notice/notice_list">공지사항</a>
            </li>
            <li>
                <a onclick="">주문현황</a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/today/chart">주문분석</a></li>
                    <li><a href="${pageContext.request.contextPath}/today/order">주문현황</a></li>
                </ul>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/menu/branchlist">메뉴관리</a>
            </li>
        </ul>
    </div>
</c:when>
    <c:otherwise>
		<jsp:forward page="/error/404">    	
    </c:otherwise>
</c:choose>    