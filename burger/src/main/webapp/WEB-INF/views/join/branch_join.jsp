<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		if($('#branch_pw').val() != $('#branch_pw2').val()){
			if($('#branch_pw2').val() != ''){
				alert("비밀번호가 일치하지 않습니다.");
				$('#branch_pw2').val('');
				$('#branch_pw2').focus();
			}
			}
		})
});
</script>


<body>
	<article class="container">
		<div class="outbox" style="width:700px">
		<div class="header">
			<h3>지점관리자 가입</h3>
		</div>
		
		<form action="branch_join" method="post" id="branchJoin" name="branch">
			<div class="form-group">
				<label for="branch_name">지점명</label>
				<input type="text" id="branch_name" name="branch_name" class="input" placeholder="소유 지점명을 입력해주세요" required> 
			</div>
			
			<div class="form-group">
				<label for="branch_id">지점 ID</label>
				<input type="text" id="branch_id" name="branch_id" class="input" required> 
			</div>
			
			<div class="form-group">
				<label for="branch_pw">비밀번호</label>
				<input type="password" id="branch_pw" name="branch_pw" class="input" required>
			</div>
			
			<div class="form-group">
				<label for="branch_pw2">비밀번호 확인</label>
				<input type="password" id="branch_pw2" name="branch_pw" class="input" required>
			</div>
			
			<div class="join_bt" >
					<input type="submit" class="btn_join" id="btn_success" value="회원가입">
					<input type="reset" class="btn_reset" id="btn_reset" value="초기화">
			</div>
		</form>
		</div>
	</article>
</body>
<!-- 
			지점메뉴바 -> 비밀번호 변경 메뉴 -> 일단아이디발급 -> 비밀번호 알아서바꿔라. bgmg+get.seq -> 일단찾아봐볼게 ! -> value of 스트링으로 형변환시켜주고, 그걸 bgmg를 스트링으로해서
			어떤 변수에 넣어놓고, 변수에 붙여줘야한다 insert(seq) 
 -->