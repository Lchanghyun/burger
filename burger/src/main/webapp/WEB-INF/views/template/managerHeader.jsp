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
                            <a href="${pageContext.request.contextPath}/join/logout_auth" class="btn-login">LOGOUT</a>
                            <c:choose>
								<c:when test ="${sessionScope.super_no != null}">
                            <a href="${pageContext.request.contextPath}/chart/supervisorChart" class="btn-email">HOME</a>
                            </c:when>
                           		 <c:when test = "${sessionScope.branch-no != null}">
                           	<a href="${pageContext.request.contextPath}/chart/branchChart" class="btn-email">HOME</a>
                           	</c:when>
                            </c:choose>
                        </p>
                    </div>
                </div> 
        </header>
        <section>
            <aside>
			   
		<c:choose>
			<c:when test ="${sessionScope.super_no != null}">
		    <div class="left-side-bar">
			        <ul>
			            <li>
			                <a href="${pageContext.request.contextPath}/chart/supervisorChart">매출관리</a>
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
			          <li>
			                <a onclick="">자재, 발주</a>
			                <ul>
			                    <li><a href="${pageContext.request.contextPath}/item/list">자재목록</a></li>
			                    <li><a href="${pageContext.request.contextPath}/purchase/superlist">발주목록</a></li>
			                </ul>
			            </li>
			        </ul>
			    </div>
	</c:when>

	<c:when test = "${sessionScope.branch-no != null}"	>
    <div class="left-side-bar">
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/chart/branchChart">매출관리</a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/notice/notice_list">공지사항</a>
            </li>
            
            <li>
                <a href="${pageContext.request.contextPath}/menu/branchlist">메뉴관리</a>
            </li>
            <li>
                <a onclick="">주문현황</a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/today/chart">주문분석</a></li>
                    <li><a href="${pageContext.request.contextPath}/today/order">주문현황</a></li>
                </ul>
            </li>
            <li>
                <a onclick="">자재, 발주</a>
                <ul>
                	<li><a href="${pageContext.request.contextPath}/stock/chart">재고분석</a></li>
                    <li><a href="${pageContext.request.contextPath}/purchase/list">발주목록</a></li>
                </ul>
            </li>
        </ul>
    </div>
</c:when>
</c:choose>
	  </aside>
 <article>