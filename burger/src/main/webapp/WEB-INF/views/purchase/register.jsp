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
    <script>
    $(function(){
    	
    	/*
    	var tb1 = $('#purchaseList');
    	var tb2 = $('#itemList');
    	
    	$('#purchaseList, #itemList').find('tbody tr').on('click', moveRow);
    		function moveRow(){
    			
    			var row = $(this);
    			var table_current = row.closest('table');
    			
    			if(table_current.prop('id')== tb1.prop('id')){
    				tb2.find('tbody').append(row);
    			} else {
    				tb1.find('tbody').append(row);
    			}
    			return;
    		}
    		*/
    		
    		/*
    		var rowData = new Array();
    		var tdArr = new Array();
    		var checkbox = $("input[id=itemCk]:checked");
    		
    		checkbox.each(function(i){
    			
    			var tr = checkbox.parent().parent().eq(i);
    			var td = tr.children();
    			
    			rowData.push(tr.text());
    			
    			var cate = td.eq(1).text();
    			var name = td.eq(2).text();
    			var price = td.eq(3).text();
    			
    			console.log("cate");
    		}); 
    		*/
    		/*$('tr.selected','#purchaseList').each(function(){
    			
    			var selectItem = $(this).closest("tr");
    			var moveItem = selectItem.clone();
    			
    			$('tbody', 'itemList').append(moveItem);
    		});
    	}); */
    });
    </script>
<body>
    <div class="purchase_wrap">
        <div class="half">
            <div class="list_wrap">
            <input type="button" value="등록" id="movebt">
                <table class="purchase_table" id="purchaseList">
                    <thead>
                        <tr class="tlist">
                        	<th>선택</th>
                        	<th>카테고리</th>
                            <th>자재명</th>
                            <th>단가</th>
                            <th>수량</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty list}">
                            <tr>
                                <td>no list</td>
                            </tr>
                        </c:if>
                        <c:forEach items="${list}" var="item">
							<tr>
								<td><input type="checkbox" id=itemCk></td>
								<td>${item.category}</td>
								<td>${item.item_name}</td>
								<td>${item.item_price}</td>
								<td><input type="text" style="text-align:center"></td>
							</tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>