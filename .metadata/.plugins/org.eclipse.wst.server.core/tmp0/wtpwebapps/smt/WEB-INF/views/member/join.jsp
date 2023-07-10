<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- form 양식 체크하는 js파일 들어갈 자리 -->

<div class="box" style="padding: 20px;">
	<form id="join_form" method="post">
		<h2 style="color: #f56a6a; text-align: center;">회원가입 - Signup</h2>
		<div id="userid_wrap">
			<div style="color: #f56a6a; font-weight: bold;">아이디</div>
			<div class="form">
				<input type="text" name="userid" id="userid" placeholder="👤ID">
			</div>
		</div>
		
		<div id="userpwd_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호</div>
			<div class="form">
				<input type="password" name="userpwd" id="userpwd" placeholder="🔒Password">
			</div>
		</div>
		
		<div id="userpwd2_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호 확인</div>
			<div class="form">
				<input type="password" name="userpwd2" id="userpwd2" placeholder="🔒Re Password">
			</div>
		</div>
		
		<div id="name_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">이름</div>
			<div class="form">
				<input type="text" name="name" id="name" placeholder="Name">
			</div>
		</div>
		
		<div id="bday_wrap">
			<div style="color: #f56a6a; font-weight: bold;">생년월일</div>
			<div class="form">
				<input type="date" name="bday" id="bday">
			</div>
		</div>
		
		<div id="hp_wrap" style="width: 100%">
			<div style="color: #f56a6a; font-weight: bold;">연락처</div>
			<div class="form">
				<div style="width: 32%; float: left;">
					<input type="text" name="hp1" id="hp1" placeholder="HP1" maxlength="3">
				</div>
				<div style="width: 34%; float: left;">
					<input type="text" name="hp2" id="hp2" placeholder="HP2" maxlength="4">
				</div>
				<div style="width: 34%; float: right;">
					<input type="text" name="hp3" id="hp3" placeholder="HP3" maxlength="4"><br>
				</div>
				<br>
			</div>
		</div>
		
		<div id="nickname_wrap" style="padding-top: 40px;">
			<div style="color: #f56a6a; font-weight: bold;">닉네임</div>
			<div class="form">
				<input type="text" name="nick_name" id="nick_name" placeholder="Nick Name">
			</div>
		</div>
		
		<div id="mbti_wrap">
			<div style="color: #f56a6a; font-weight: bold;">MBTI</div>
			<div class="form">
				<select name="mbti_type" id="mbti_type" style="text-align: center;">
					<option value="">- MBTI유형을 선택해주세요. -</option>
					<option value="ENFP">ENFP</option>
					<option value="ENFJ">ENFJ</option>
					<option value="ENTP">ENTP</option>
					<option value="ENTJ">ENTJ</option>
					<option value="ESFP">ESFP</option>
					<option value="ESFJ">ESFJ</option>
					<option value="ESTP">ESTP</option>
					<option value="ESTJ">ESTJ</option>
					<option value="INFP">INFP</option>
					<option value="INFJ">INFJ</option>
					<option value="INTP">INTP</option>
					<option value="INTJ">INTJ</option>
					<option value="ISFP">ISFP</option>
					<option value="ISFJ">ISFJ</option>
					<option value="ISTP">ISTP</option>
					<option value="ISTJ">ISTJ</option>
				</select>
			</div>
		</div>
		
		<div id="pimage_wrap">
			<div style="color: #f56a6a; font-weight: bold;">프로필 이미지</div>
			<div class="form">
				<input type="file" name="pimage" id="pimage" accept=".png, .jpg, .jpeg">
			</div>
		</div>
		
		<div style="padding-top: 30px;">
			<button type="button" id="join_button" class="button special fit">회원가입</button>
		</div>
	</form>
</div>

<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$("#join_button").click(function(){
		alert('전송');
		$("#join_form").attr("action", "${myctx}/join");
		$("#join_form").submit();
	});
});

</script>