<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
    .purchase_wrap{
        width: 80%;
	    height: 400px;
	    position: relative;
	    left: 245px;
	    top: 260px;
    }
    
    .purchase_container{
        width: 95%;
	    height: 300px;
	    position: absolute;
	    left: 35px;
	    top: 45px;
    }

    .list_wrap{
        width: 100%;
        height: 200px;
        overflow: auto;
    }
    table.purchase_table {
        border-collapse: separate;
        border-spacing: 1px;
        text-align: center;
        line-height: 1.5;
        margin: 20px 10px;
        
    }
    table.purchase_table > thead > tr.tlist > th {
        width: 155px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        color: #fff;
        background: #ce4869 ;
    }
    table.purchase_table td {
        width: 155px;
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
        background: #eee;
    }
    </style>
    
    <script>
  $(function(){
	  
	 // 날짜 조회
     $('#load_bt').on('click', function(){
    	  var date = new Date($('#date-input').val());
    	  day = date.getDate();
    	  month = date.getMonth() + 1;
    	  year = date.getFullYear();
    	  alert([day, month, year].join('/'));
    	}) 
     
    </script>
    <c:import url="/WEB-INF/views/template/managerHeader.jsp"/>
<div style="height: calc(100% - 162px)">
    <div class="purchase_wrap">
        <div class="purchase_container">
            <table>
                <thead>
                    <tr>
                        <th>발주일자</th>
                        <th><input type="date" id="st_dt"></th>
                        <th><input type="date" id="en_dt"></th>
                        <th><input type="button" value="조회" id="date_dt"></th>
                    </tr>
                </thead>
            </table>
            <div class="list_wrap">
                <table class="purchase_table" id="purchaseList">
                    <thead>
                        <tr class="tlist">
                        	<th>지점명</th>
                            <th>발주번호</th>
                            <th>처리상태</th>                           
                            <th>일자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty SPlist}">
                            <tr>
                                <td>no list</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${SPlist}" var="Super">
                            <tr>
                            	<td>${Super.branch_name}</td>
                                <td><input type="hidden" name="purchase_no" value="${Super.purchase_no}">
	                                <a href="${pageContext.request.contextPath}/purchase/superpurchaselist?purchase_no=${Super.purchase_no}">
	                                 ${Super.purchase_no}
	                                </a>
                                </td>
                                <td>
                                	<c:set var="status" value="${Super.status}"/>
	                                <c:choose>
    	                            	<c:when test="${status == '발주완료'}">
    	                            		<a href="${pageContext.request.contextPath}/purchase/superreceived?purchase_no=${Super.purchase_no}">
    	                            			${Super.status}
    	                            		</a>
    	                            	</c:when>
    	                            	
    	                            	<c:when test="${status != '발주완료'}">
    	                            			${Super.status}
    	                            	</c:when>		
       	                        	</c:choose>
                                </td>
                                <td>${Super.purchase_date}</td>  
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/template/managerFooter.jsp"/>