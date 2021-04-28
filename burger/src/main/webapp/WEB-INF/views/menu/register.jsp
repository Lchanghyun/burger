<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menuAdmin.css">
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/menuRegister.js"></script>
	<div class="adminbox">
		<div class="menu-register-box">
	        <form id="menu" action="${pageContext.request.contextPath}/menu/register" method="post" enctype="multipart/form-data">
	            <div class="menu-register-btn">
	            	<div class="menuAdminTitle">메뉴등록</div>
	            	<div>
		                <input type="reset" value="초기화" class="resetBtn">
		                <input type="submit" value="등록" class="registformBtn">
		                <input type="button" value="취소" class="cancleBtn">
	                </div>
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
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"></jsp:include>