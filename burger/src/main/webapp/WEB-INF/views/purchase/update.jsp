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
        width: 80%;
	    height: 400px;
	    position: fixed;
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
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
    $(function(){
     
   	//파라미터값 가져오기
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
     }

    // 목록
   	$('#back').on('click',function(e){
   		 location.href="${pageContext.request.contextPath}/purchase/superlist"
        })
    
    let list=[]
	let item_no
	let count
	let purchase_no
	
	$(".count_input").on("blur", function(){
		
		count = $(this).val()
		item_no = $(this).parent().parent().prev().val()
		purchase_no = getParameterByName('purchase_no')
		list.push({"item_no" : item_no, "count" : count , "purchase_no" : purchase_no})
		
	})
	
	$("#update_bt").on("click", function(e){
		e.preventDefault()
		
		let temp = JSON.stringify(list)
		console.log(list)
		
		$.ajax({
			url:"${pageContext.request.contextPath}/purchase/update",
			type: "POST",
			data: {
				purchase_item : temp
			},
			success: function(resp){
				location.href="${pageContext.request.contextPath}/purchase/list"
				
			}			
		})
		
	})
 })
    </script>
<body>
    <div class="purchase_wrap">
        <div class="purchase_container">
            <table>
                <thead>
                    <tr>
                        <th><input type="button" value="목록" id="back"></th>
                        <th><input type="button" value="발주 " id="regist_bt"></th>
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
                        <c:if test="${empty PIlist}">
                            <tr>
                                <td>no list</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${PIlist}" var="PI">
                        <input type="hidden" value="${PI.item_no}">
                            <tr>
                            	<td>${PI.category}</td>
                                <td>${PI.item_name}</td>
                                <td>${PI.item_price}</td>
                                <td><input type="number" class="count_input" value="${PI.count}" style="text-align:center"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>