<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box" style="padding: 20px; width: 100%">
	<form id="modify_form" method="post">
		<h2 style="color: #f56a6a; text-align: center;">회원정보 수정</h2>
		<div id="userid_wrap">
			<div style="color: #f56a6a; font-weight: bold;">아이디</div>
			<div>
				<input type="text" name="userid" id="userid" readonly="readonly"
					value="${member.userid}">
			</div>
		</div>

		<div id="userpwd_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호</div>
			<div>
				<input type="password" name="userpwd" id="userpwd">
			</div>
			<span class="pwd_warn">비밀번호는 문자,숫자,!_,.만 사용가능하며, 4~8자 이내여야
				합니다.</span> <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>

		<div id="userpwd2_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호 확인</div>
			<div>
				<input type="password" name="userpwd2" id="userpwd2"
					placeholder="🔒Re Password">
			</div>
			<span class="final_pw2_ck">비밀번호 확인을 입력해주세요.</span> <span
				class="pw2_re_yes">비밀번호가 일치합니다.</span> <span class="pw2_re_no">비밀번호가
				일치하지 않습니다.</span>
		</div>

		<div id="name_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">이름</div>
			<div>
				<input type="text" name="name" id="name" readonly="readonly"
					value=${member.name }>
			</div>
		</div>

		<div id="bday_wrap">
			<div style="color: #f56a6a; font-weight: bold;">생년월일</div>
			<div>
				<input type="date" name="bday" id="bday" readonly="readonly" value="${member.bday}">
			</div>
		</div>

		<div id="mail_wrap" style="width: 100%">
			<div style="color: #f56a6a; font-weight: bold;">이메일</div>
			<div>
				<input type="email" name="email" id="email" placeholder="Email"
					readonly="readonly" value="${member.email}">
			</div>
		</div>

		<div id="nickname_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">닉네임</div>
			<div>
				<input type="text" name="nick_name" id="nick_name"
					placeholder="Nick Name" value="${member.nick_name}">
			</div>
			<span class="nick_ck_yes">사용 가능한 닉네임입니다.</span> <span
				class="nick_ck_no">닉네임이 이미 존재합니다.</span> <span class="nick_warn">닉네임은
				특수문자를 제외한 10글자 이내만 가능합니다.</span> <span class="final_nick_ck">닉네임을
				입력해주세요.</span>
		</div>

		<div id="mbti_wrap">
			<div style="color: #f56a6a; font-weight: bold;">MBTI</div>
			<div>
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
			<div>
				<input type="file" name="pimage" id="pimage"
					accept=".png, .jpg, .jpeg">
			</div>
		</div>

		<div style="padding-top: 30px;">
			<button type="button" id="modify_button" class="button special fit">
				<span>정보 수정</span>
			</button>
		</div>
	</form>
</div>

<script>
	var code = ""; //이메일전송 인증번호 저장위한 코드

	/* 유효성 검사 통과유무 변수 */
	var userpwd_ck = false; // 비밀번호
	var userpwd2_ck = false; // 비밀번호 확인
	var pwd_cor_ck = false; // 비밀번호 - 확인 일치 확인
	var nick_name_ck = false; // 닉네임
	var nick_ck = false; // 닉네임 중복 검사
	var pwd_warn_ck = false; // 비밀번호 형식체크
	var nick_warn_ck = false; // 닉네임 형식체크

	$(document).ready(
			function() {
				//회원가입 버튼(회원가입 기능 작동)
				$("#modify_button")
						.click(
								function() {
									/* 입력값 변수 */
									var pw = $('#userpwd').val(); // 비밀번호 입력란
									var pwck = $('#userpwd2').val(); // 비밀번호 확인 입력란
									var nickname = $('#nick_name').val(); // 닉네임 입력란

									/* 비밀번호 유효성 검사 */
									if (pw == "") {
										$('.final_pw_ck').css('display',
												'block');
										userpwd_ck = false;
									} else {
										$('.final_pw_ck')
												.css('display', 'none');
										userpwd_ck = true;
									}

									/* 비밀번호 확인 유효성 검사 */
									if (pwck == "") {
										$('.final_pwck_ck').css('display',
												'block');
										userpwd2_ck = false;
									} else {
										$('.final_pwck_ck').css('display',
												'none');
										userpwd2_ck = true;
									}

									/* 닉네임 유효성 검사 */
									if (nickname == "") {
										$('.final_nick_ck').css('display',
												'block');
										nick_name_ck = false;
									} else {
										$('.final_nick_ck').css('display',
												'none');
										nick_name_ck = true;
									}

									/* 최종 유효성 검사 */
									if (userpwd_ck&& userpwd2_ck && pwd_cor_ck&& nick_name_ck && nick_ck
											&&pwd_warn_ck&& nick_warn_ck) {
										$("#modify_form").attr("action",
												"${myctx}/member_modify_go");
										$("#modify_form").submit();
										alert('회원 수정 완료');

									}

									return false;

								});
			});
	/* 닉네임 중복 검사 */
	$('#nick_name').on("propertychange change keyup paste input", function() {
		var nick_name = $('#nick_name').val();
		var data = {
			nick_name : nick_name
		}

		$.ajax({
			type : "post",
			url : "/userNickChk",
			data : data,
			success : function(result) {
				// console.log("성공 여부" + result);
				if (result != 'fail') {
					$('.nick_ck_yes').css("display", "inline-block");
					$('.nick_ck_no').css("display", "none");
					nick_ck = true;
				} else {
					$('.nick_ck_no').css("display", "inline-block");
					$('.nick_ck_yes').css("display", "none");
					nick_ck = false;
				}

			}// success 종료
		}); // ajax 종료

		/* 닉네임 형식 체크 */
		if (nickF_ck(nick_name)) {
			$('.nick_warn').css('display', 'none');
			nick_warn_ck = true;
		} else {
			$('.nick_warn').css('display', 'block');
			nick_warn_ck = false;
		}
	});// function 종료

	/* 비밀번호 확인 일치 유효성 검사 */
	$('#userpwd2').on("propertychange change keyup paste input", function() {
		var pw = $('#userpwd').val();
		var pwck = $('#userpwd2').val();
		$('.final_pw2_ck').css('display', 'none');

		if (pw == pwck) {
			$('.pw2_re_yes').css('display', 'block');
			$('.pw2_re_no').css('display', 'none');
			pwd_cor_ck = true;
		} else {
			$('.pw2_re_yes').css('display', 'none');
			$('.pw2_re_no').css('display', 'block');
			pwd_cor_ck = false;
		}
	});

	/* 비밀번호 형식 체크 */
	$('#userpwd').on("propertychange change keyup paste input", function() {
		var pwd = $('#userpwd').val();

		if (pwdF_ck(pwd)) {
			$('.pwd_warn').css('display', 'none');
			pwd_warn_ck = true;
		} else {
			$('.pwd_warn').css('display', 'block');
			pwd_warn_ck = false;
		}
	});

	/* Form 형식 체크 */
	function pwdF_ck(userpwd) {
		let pattern = /^[\w!\.]{4,8}$/;
		return pattern.test(userpwd);
	}
	function nickF_ck(nick_name) {
		let pattern = /^[가-힣a-zA-Z0-9]{0,11}$/
		return pattern.test(nick_name);
	}
</script>