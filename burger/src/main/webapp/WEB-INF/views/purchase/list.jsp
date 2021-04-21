<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    
    input[type=button] {
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
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
  $(function(){
	  
	 // 날짜 조회
     $('#load_bt').on('click', function(){
    	 
    	 alert($('input[name=branch_no]').val());
    	/*  var date = new Date($('#date-input').val());
    	  day = date.getDate();
    	  month = date.getMonth() + 1;
    	  year = date.getFullYear();
    	  alert([day, month, year].join('/'));*/
    	});
     
	 // 신규 발주
     $('#new_rg').on('click',function(){
    	$(form).submit();
     }) 
  }) 
</script>
<c:import url="/WEB-INF/views/template/managerHeader.jsp"/>
<div style="height: calc(100% - 162px)">
	<div class="page_title">발주 현황</div>
				<div class="btn_wrapper">
					<input type="button" id="load_bt" value="날짜조회">
					<input type="button" id="new_rg" value="신규발주">
				</div>
				<hr class="hr_line">
	<form method="post" action="regist" name="form">
	<input type="hidden" name="branch-no" value="1">
	<input type="hidden" name="super_no" value="1">
	<input type="hidden" name="status" value="발주대기">
    <div class="purchase_wrap">
        <div class="purchase_container">
            <div class="list_wrap">
                <table class="purchase_table" id="purchaseList">
                    <thead>
                        <tr class="tlist">
                            <th style="width:100px">발주번호</th>
                            <th>처리상태</th>
                            <th>일자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty Plist}">
                            <tr>
                                <td>no list</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${Plist}" var="Purchase">
                            <tr>
                                <td>
	                                <a href="${pageContext.request.contextPath}/purchase/purchase_list?purchase_no=${Purchase.purchase_no}">
	                                ${Purchase.purchase_no}
	                                </a>
                                </td>
                                <td>
                                <c:set var="status" value="${Purchase.status}"/>
	                                <c:choose>
    	                            	<c:when test="${status == '발주완료'}">
    	                            		<a href="${pageContext.request.contextPath}/purchase/received?purchase_no=${Purchase.purchase_no}">
    	                            			${Purchase.status}
    	                            		</a>
    	                            	</c:when>
    	                            	
    	                            	<c:when test="${status != '발주완료'}">
    	                            		<a href="${pageContext.request.contextPath}/purchase/update?purchase_no=${Purchase.purchase_no}">
    	                            			${Purchase.status}
    	                            		</a>
    	                            	</c:when>		
       	                        	</c:choose>
                                </td>
                                <td>${Purchase.purchase_date}</td>
                            </tr>
                        </c:forEach>
                    </tbody> 
                </table>
            </div>
        </div>
    </div>
 </form>
</div>
<c:import url="/WEB-INF/views/template/managerFooter.jsp"/>