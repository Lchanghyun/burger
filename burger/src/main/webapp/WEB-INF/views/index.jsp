<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="template/header.jsp"></jsp:include>
				바디 입니다<br><br>
                ID: Kenekeke<br>
                Password: ******<br><br>
                한글입니다<br>
                이거는 M입니다<br><br>
                <div style="padding-left: 10px;">
                    <input type="button" value="회원가입" id="join">
       			</div>
</head>


<jsp:include page="template/footer.jsp"></jsp:include>
	