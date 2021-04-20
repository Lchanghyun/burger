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
     
     // 목록
	 $('#back').on('click',function(e){
		 location.href="${pageContext.request.contextPath}/purchase/list"
     })
  })
    </script>
    
<c:import url="/WEB-INF/views/template/managerHeader.jsp"/>
<div style="height: calc(100% - 162px)">
    <div class="purchase_wrap">
        <div class="purchase_container">
            <table>
                <thead>
                    <tr>
                        <th><input type="button" value="목록" id="back"></th>
                        <th><input type="button" value="신규 등록" id="new_rg"></th>
                    </tr>
                </thead>
            </table>
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