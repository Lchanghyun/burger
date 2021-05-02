<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>

<style>


#imgslide { margin-top: 10px;}

.imgs {
    position: relative;
    overflow: hidden;
    height:629px;
    background-color:#FCEDDA;
    width: 1300px;
}

.imgs>img {
    width: 1300px;
    position: absolute;
    transition: all 1s;
} 
</style>

<script>
var imgs = 3;
var now = 0;

function slide() {
    now = now == imgs ? 0 : now += 1; 

    $(".imgs>img").eq(now - 1).css({"margin-left": "-1300px"});
    $(".imgs>img").eq(now).css({"margin-left": "0px"});
}

function start() {
    $(".imgs>img").eq(0).siblings().css({"margin-left":"-1300px"});
    
    setInterval(function () { slide()}, 3000);
}
start();
</script>  

<div class="imgs">
  
  <img src="${path}/resources/img/indeximage3.png" alt="no">
  <img src="${path}/resources/img/indeximage4.png" alt="no">
  <img src="${path}/resources/img/indeximage.png" alt="no">
  <img src="${path}/resources/img/indeximage6.png" alt="no">
</div>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>