<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jsp header공간 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Daum 주소찾기 API 설정 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//아이디 중복체크
	$(function(){
		$('#member_id').blur(function(){
			var member_id = $('#member_id').val();
		
	
		$.ajax({
			url:"${pageContext.request.contextPath}/join/idCheck",
			type:'get',
			data: {member_id : member_id},
			success:function(resp){
				
				if(resp == "NNNNN"){
					//아이디 중복시
					$('#idCheckBox2').text("사용중인 아이디입니다.");
					$('#idCheckBox2').css("color", "red");
				}
				else if(resp == "NNNNY"){
					
					$('#idCheckBox2').text("사용 가능한 아이디입니다.");
					$('#idCheckBox2').css("color", "blue");
				}
			
			}
		});
		});
	});
	
	// 비밀번호와 비밀번호 확인 맞는지 체크
	$(function(){
		$('#member_pw2').blur(function(){
			if($('#member_pw').val() == $('#member_pw2').val()){
				$('#pw2CheckBox').text('비밀번호가 일치합니다.');
				$('#pw2CheckBox').css('color', 'blue');
			}	
			if($('#member_pw').val() != $('#member_pw2').val()){
				if($('#member_pw2').val() != ''){
					alert("비밀번호가 일치하지 않습니다.");
					$('#member_pw2').val('');
					$('#member_pw2').focus();
				}
				}
			})
	});
	
	// 아이디 정규식 체크
	$(function(){
		var regexId = /^[a-zA-Z0-9]{6,16}$/;
		$('#member_id').blur(function(){
			if(regexId.test($('#member_id').val())){
				$('#idCheckBox').text('올바른 아이디양식입니다.');
				$('#idCheckBox').css('color', 'blue');
			}
			else{
				$('#idCheckBox').text('6~16자리로 입력해주세요.');
				$('#idCheckBox').css('color', 'red');
				$('#member_id').focus();
				
			}
		})
	})
	//비밀번호 정규식 (위칸만 정규화시키면 아래는 체크해야하니 안해줘도된다고생각함)
	//6~12자 영문+숫자+특수문자 포함 
	$(function(){
		
		var regexPw = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		$('#member_pw').blur(function(){
			if(regexPw.test($('#member_pw').val())){
				$('#pwCheckBox').text('올바른 비밀번호입니다.');
				$('#pwCheckBox').css('color', 'blue');
			}
			else{
				$('#pwCheckBox').text('영문+숫자+특수문자 조합6~12자리로 입력해주세요.');
				$('#pwCheckBox').css('color', 'red');
				$('#membeR_pw').focus();
				
			}
		});
	});
	//Phone 정규식
	$(function(){
		var regexPhone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		$('#memberPhone').blur(function(){
			if(regexPhone.test($('#memberPhone').val())){
				$('#phoneCheckBox').text('올바른 전화번호 양식입니다.');
				$('#phoneCheckBox').css('color', 'blue');
			}
			else{
				$('#phoneCheckBox').text('01012345678 식으로 입력해주세요.');
				$('#phoneCheckBox').css('color', 'red');
				$('#phoneCheckBox').focus();
			}
		})
	})

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
<script>
//주소확인
if(address.val()==''){
	inval_Arr[7] = false;
	alert('주소를 확인하세요.');
	return false;
}else
	inval_Arr[7] = true;

//회원가입 버튼
$(function(){
	$(".btn_success").on("click", function(){
		//아이디 공백시 focus 해주기
		if($('#member_id').val()==null){
			alert("아이디를 입력해주세요!")
			$('#member_id').focus();
			return;
		}
		//비밀번호 공백시 focus 해주기
		if($('#member_pw').val()==null){
			alert("비밀번호를 입력해주세요!")
			$('#member_pw').focus();
			return;
		}
		if($('#member_pw2').val()==null){
			alert("비밀번호를 입력해주세요!")
			$('#member_pw2').focus();
			return;
		}
		if($('#member_name').val()==null){
			alert("이름을 입력해주세요!")
			$('#member_name').focus();
			return;
		}
		if($('#member_phone').val()==null){
			alert("휴대전화 번호를 입력해주세요!")
			$('#member_phone').focus();
			return;
		}
		
		$("#memberJoin").submit()
		alert('회원가입해주셔서 감사합니다.');
	});
});

</script>

<body>
	<article class="container">
		<div class="outbox" style="width:700px">
		<div class="row center">
			<h3>회원 가입</h3>
		</div>
			<form action="member_join" method="post" id="memberJoin" name="member">
		
			<div class="form-group">
				<label for="member_id">아이디</label>
				<input type="text" id="member_id" name="member_id" class="input" placeholder="아이디를 입력해주세요" required>
				<span class="idCheckBoxFont" id="idCheckBox" name="idCheckBox"></span>
				<span class="idCheckBoxFont" id="idCheckBox2" name="idCheckBox2"></span>
			</div>
			
			<div class="form-group">
				<label for="member_pw">비밀번호</label>
				<input type="password" id="member_pw" name="member_pw" class="input" placeholder="비밀번호를 입력해주세요" required>
				<span class="pwCheckBoxFont" id="pwCheckBox"></span>
			</div>
		
			<div class="form-group">
				<label for="member_pw2">비밀번호 확인</label>
				<input type="password" id="member_pw2" class="input" placeholder="비밀번호를 입력해주세요" required>
				<span class="pwCheckBoxFont" id="pw2CheckBox"></span>
			</div>
			
			<div class="form-group">
				<label for="member_name">이름</label>
				<input type="text" id="memberName" name="member_name" class="input" placeholder="이름을 입력해주세요" required>
			</div>
			
			<div class="form-group">
				<label for="member_phone">휴대전화 번호('-'없이 번호만 입력해주세요)</label>
				<input type="text" id="memberPhone" name="member_phone"class="input" placeholder="010-0000-0000과 같이 입력해주세요" required>
				<span class="phoneCheckBoxFont" id="phoneCheckBox"></span>
			
			</div>
			
			<div class="form-group">
				<label for="member_address">주소</label>
				<input type="text" name="member_address" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="member_address" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" name="member_address" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
			</div>
			
			<div class="form-group">
				<label for="member_gender">성별</label>
				<input type="radio" id="gender_men" name="member_gender" value="남" class="input" checked>남성
				<input type="radio" id="gender_women" name="member_gender" value="여" class="input">여성
				<input type="radio" id="gender_x" name="member_gender" value="선택안함" class="input">선택안함
			</div>
			
			<div class="form-group">
				<label for="member_age_group">연령대</label>
				<input type="radio" id="10_age_group" name="member_age_group" value="10대" class="input" checked>10대
				<input type="radio" id="20_age_group" name="member_age_group" value="20대" class="input">20대
				<input type="radio" id="30_age_group" name="member_age_group" value="30대" class="input">30대
				<input type="radio" id="40_age_group" name="member_age_group" value="40대" class="input">40대
				<input type="radio" id="50_age_group" name="member_age_group" value="50대이상" class="input">50대 이상
			</div>
			
			<div class="join_bt" >
					<input type="submit" class="btn_join" id="btn_success" value="회원가입">
					<input type="reset" class="btn_reset" id="btn_reset" value="초기화">
			</div>
			</form>
		</div>
	</article>
</body>
<!-- jsp footer 공간! -->