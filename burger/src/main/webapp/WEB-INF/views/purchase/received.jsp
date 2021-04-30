<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<style>
    
    .purchase_wrap{
        width: 1680px;
	    height: 845px;
	    position: relative;
	    margin: auto;
	   	
    }
    .purchase_container{
   		width: 1610px;
	    height: 530px;
	    position: absolute;
	    left: 10px;
	    top: 214px;
    }

    .list_wrap{
        width: 1580px;
	    height: 450px;
	    overflow: auto;
	    position: relative;
	    left: 10px;
	    top: 40px;
	    
    }

    table.purchase_table {
        border-collapse: separate;
        border-spacing: 1px;
        text-align: center;
        line-height: 1.5;
        margin: auto; 
    }
    table.purchase_table > thead > tr.tlist > th {
        width: 155px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-top: 2px solid #EE4E34;
        border-bottom: 2px solid #EE4E34;
        position : sticky;
        top: 0px;
        color:#EE4E34;
    	background-color: #FCEDDA;
      
    }
    table.purchase_table td {
        width: 300px;
        padding: 10px; 
        text-align: center;
        vertical-align: top;
        border-bottom: 1px solid #444444;
    
    }
    
    table.purchase_table tr:hover {
    	background-color:#f3e9e9 !important;
  		color:#303f39 !important
    }
    
    button {
    	width: 100px;
	    height: 30px;
	    padding: 3px;
	    padding-top: 6px;
	    background-color: #EE4E34;
	    color: white;
	    border: none;
	    font-family: 'GmarketSansMedium';
	    font-size: 15px;
	    font-weight: bold;
	    border-radius: 3px;
    }
    
    .hr_line{
		position : absolute;
		top : 20%;  
		left : 218px;
		display : block;
		width: 84%;   
		border : 2px solid;
	}
	
	.page_title{
		position : absolute;
		top : 15%;
		left : 220px;
		font-size : 40px;	
	}
	
	.btn_wrapper{
		position: absolute;
	    top: clamp(10px, 17% , 500px);
	    left: clamp(600px, 84.6%, 1700px);
	    width: 240px;
	    z-index: 2;
	}
	button{
		cursor : pointer;
	}
    
    </style>
    
    <script>
  $(function(){
     
     // 목록
	 $('.back').on('click',function(e){
		 location.href="${pageContext.request.contextPath}/purchase/list"
     })

  
  	$('.backsuper').on('click',function(e){
		 location.href="${pageContext.request.contextPath}/purchase/superlist"
     })
  })
    </script>
    
<c:import url="/WEB-INF/views/template/managerHeader.jsp"/>
<div style="height: calc(100% - 142px)">
<div class="page_title">완료 품목</div>
				<div class="btn_wrapper">
					<button class="back" >목록</button>
					<button class="backsuper" >본점목록</button>
				</div>
				<hr class="hr_line">
    <div class="purchase_wrap">
        <div class="purchase_container">
            <div class="list_wrap">
                <table class="purchase_table" id="purchaseList">
                    <thead>
                        <tr class="tlist">
                            <th>카테고리</th>
                            <th>발주품목</th>
                            <th>발주금액</th>
                            <th>수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty RIlist}">
                            <tr>
                                <td>no list</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${RIlist}" var="Re">
                            <tr>
                                <td>${Re.category}</td>
                                <td>${Re.item_name}</td>
                                <td>${Re.item_price}</td>
                                <td>${Re.count}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/template/managerFooter.jsp"/>