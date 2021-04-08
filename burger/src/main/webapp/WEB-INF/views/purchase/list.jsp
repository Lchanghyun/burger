<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>

<style>
    div{
        box-sizing: border-box;
        border : 1px solid black;
    }
    
    .purchase_wrap{
        width: 100%;
        height: 980px;
    }
    
    .purchase_empty{
        width: 2%;
        height: 980px;
        display: inline-block;
    }
    
    .half{
        width: 48%;
        height: 980px;
        display: inline-block;
    }

    .list_wrap{
        width: 100%;
        height: 200px;
    }

    table.purchase_table {
        border-collapse: separate;
        border-spacing: 1px;
        text-align: center;
        line-height: 1.5;
        margin: 20px 10px;
        overflow: auto;
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
    $('#load_bt').on('click', function(){
    	  var date = new Date($('#date-input').val());
    	  day = date.getDate();
    	  month = date.getMonth() + 1;
    	  year = date.getFullYear();
    	  alert([day, month, year].join('/'));
    	});
    </script>
    <body>
    
        <div class="purchase_wrap">
            <div class="purchase_empty"></div>
                <div class="half">
                    <div class="list_wrap">
                        <table class="purchase_table">
                            <thead>
                                <tr>
                                    <th>발주일자</th>
                                    <th><input type="date" id="st_dt"></th>
                                    <th><input type="date" id="en_dt"></th>
                                    <th><input type="button" value="조회" id="load_dt">
                                </tr>
                                <tr class="tlist">
                                    <th>발주번호</th>
                                    <th>수신처</th>
                                    <th>일자</th>
                                    <th>처리상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty purchaselist}">
                            	<tr>
                            		<td>no list</td>
                            	</tr>
                            	</c:if>
                            	<c:forEach items="${list}" var="Purchase">
                                <tr>
                                    <td>${Purchase.purchase_no}</td>
                                    <td>${Purchase.super_no}</td>
                                    <td>${Purchase.purchase_no}</td>
                                    <td>${Purchase.status}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="half">
                    
                </div>
            
        </div>
    </body>
    </html>