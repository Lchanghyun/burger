<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/branch_join.css">

<!-- Daum 주소찾기 API 설정 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(function(){
	$(".btn_success").on("click", function(){
		//아이디 공백시 focus 해주기
		if($('#branch_id').val()==null){
			alert("아이디를 입력해주세요!")
			$('#branch_id').focus();
			return;
		}
		//비밀번호 공백시 focus 해주기
		if($('#branch_pw').val()==null){
			alert("비밀번호를 입력해주세요!")
			$('#branch_pw').focus();
			return;
		}
		if($('#branch_name').val()==null){
			alert("지점명을 입력해주세요!")
			$('#branch_name').focus();
			return;
		}
		
		$("#branchJoin").submit()
	});
});

//비밀번호 체크
$(function(){
		$('#branch_pw2').blur(function(){
			if($('#branch_pw').val() == $('#branch_pw2').val()){
				$('#pw2CheckBox').text('비밀번호가 일치합니다.');
				$('#pw2CheckBox').css('color', 'blue');
			}	
			if($('#branch_pw').val() != $('#branch_pw2').val()){
				if($('#branch_pw2').val() != ''){
					alert("비밀번호가 일치하지 않습니다.");
					$('#branch_pw2').val('');
					$('#branch_pw2').focus();
				}
				}
			})
	});
//아이디 정규식 체크
$(function(){
	var regexId = /^[a-zA-Z0-9]{6,16}$/;
	$('#branch_id').blur(function(){
		if(regexId.test($('#branch_id').val())){
			$('#idCheckBox').text('올바른 아이디양식입니다.');
			$('#idCheckBox').css('color', 'blue');
		}
		else{
			$('#idCheckBox').text('6~16자리로 입력해주세요.');
			$('#idCheckBox').css('color', 'red');
			$('#branch_id').focus();
			
		}
	})
})
//비밀번호 정규식 (위칸만 정규화시키면 아래는 체크해야하니 안해줘도된다고생각함)
//6~12자 영문+숫자+특수문자 포함 
$(function(){
	
	var regexPw = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	$('#branch_pw').blur(function(){
		if(regexPw.test($('#branch_pw').val())){
			$('#pwCheckBox').text('올바른 비밀번호입니다.');
			$('#pwCheckBox').css('color', 'blue');
		}
		else{
			$('#pwCheckBox').text('영문+숫자+특수문자 조합6~12자리로 입력해주세요.');
			$('#pwCheckBox').css('color', 'red');
			
			
		}
	});
});
</script>
<script>
//Daum 주소 체크
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오r는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<jsp:include page="/WEB-INF/views/template/managerHeader.jsp"/>
		

		<div class="outbox" style="width:700px">
		<div class="header">
			<h1>지점관리자 가입</h1>
		</div>
		
		<form action="${pageContext.request.contextPath}/join/branch_join" method="post" id="branchJoin" name="branch">
			<div class="form-group">
				<label for="branch_name">지점명</label>
				<input type="text" id="branch_name" name="branch_name" class="input" placeholder="지점명을 입력해주세요" required> 
			</div>
			
			<div class="form-group">
				<label for="branch_id">지점 ID</label>
				<input type="text" id="branch_id" name="branch_id" class="input" placeholder="아이디를 입력해주세요" required> 
				<span class="idCheckBoxFont" id="idCheckBox"></span>
			</div>
			
			<div class="form-group">
				<label for="branch_pw">비밀번호</label>
				<input type="password" id="branch_pw" name="branch_pw" class="input" placeholder="비밀번호를 입력해주세요" required>
				<span class="pwCheckBoxFont" id="pwCheckBox"></span>
			</div>
			
			<div class="form-group">
				<label for="branch_pw2">비밀번호 확인</label>
				<input type="password" id="branch_pw2" class="input" placeholder="비밀번호를 입력해주세요" required>
				<span class="pwCheckBoxFont" id="pw2CheckBox"></span>
			</div>
			
			<div class="form-group">
				<label for="branch_address">주소</label>
				<input type="text" name="branch_address" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="branch_address" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" name="branch_address" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
			</div>
						
			<div class="join_bt" >
					<input type="submit" class="btn_join" id="btn_success" value="회원가입">
					<input type="reset" class="btn_reset" id="btn_reset" value="초기화">
			</div>
		</form>
		</div>
		</div>
	
<jsp:include page="/WEB-INF/views/template/managerFooter.jsp"/> 
	