<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="box" style="padding: 20px; width: 100%">
	<form id="join_form" method="post">
		<h2 style="color: #f56a6a; text-align: center;">회원가입 - Signup</h2>
		<div id="userid_wrap">
			<div style="color: #f56a6a; font-weight: bold;">아이디</div>
			<div>
				<input type="text" name="userid" id="userid" placeholder="👤ID">
			</div>
			<span class="id_ck_yes">사용 가능한 아이디입니다.</span>
			<span class="id_ck_no">아이디가 이미 존재합니다.</span>
			<span class="id_warn">아이디는 영문자,숫자,_,!만 사용 가능하며, 4~8자 이내여야 합니다.</span>
			<span class="final_id_ck">아이디를 입력해주세요.</span>
		</div>

		<div id="userpwd_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호</div>
			<div>
				<input type="password" name="userpwd" id="userpwd"
					placeholder="🔒Password">
			</div>
			<span class="pwd_warn">비밀번호는 문자,숫자,!_,.만 사용가능하며, 4~8자 이내여야 합니다.</span>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>

		<div id="userpwd2_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호 확인</div>
			<div>
				<input type="password" name="userpwd2" id="userpwd2"
					placeholder="🔒Re Password">
			</div>
			<span class="final_pw2_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pw2_re_yes">비밀번호가 일치합니다.</span>
            <span class="pw2_re_no">비밀번호가 일치하지 않습니다.</span>
		</div>

		<div id="name_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">이름</div>
			<div>
				<input type="text" name="name" id="name" placeholder="Name">
			</div>
			<span class="name_warn">이름은 한글로 2자 이상만 가능합니다.</span>
			<span class="final_name_ck">이름을 입력해주세요.</span>
		</div>

		<div id="bday_wrap">
			<div style="color: #f56a6a; font-weight: bold;">생년월일</div>
			<div>
				<input type="date" name="bday" id="bday">
			</div>
			<span class="bday_warn">날짜 형식에 맞지않습니다. [19yy-mm-dd] or [20yy-mm-dd]</span>
			<span class="final_bday_ck">생년월일을 입력해주세요.</span>
		</div>

		<div id="mail_wrap" style="width: 100%">
			<div style="color: #f56a6a; font-weight: bold;">이메일</div>
			<div>
				<input type="email" name="email" id="email" placeholder="Email">
			</div>
			<span class="mail_ck_yes">사용가능한 이메일 입니다.</span>
			<span class="mail_ck_no">이미 가입된 이메일 입니다.</span>
			<span class="mail_warn"></span>
			<span class="final_email_ck">이메일을 입력해주세요.</span>
		</div>

		<div id="mail_ck_wrap" style="width: 100%">
			<div style="color: #f56a6a; font-weight: bold;">인증번호 확인</div>
			<div class="mail_ck_box" style="width: 83%; float: left;" id="mail_ck_false">
				<input type="text" name="email_ck" id="email_ck" disabled="disabled" placeholder="Email-Number">
			</div>
			<div align="right"
				style="width: 15%; float: right; text-align: center;">
				<button type="button" id="email_ck_button" class="button fit"><span>전송</span></button>
			</div>
			<div style="clear: both;"></div>
			<span id="mail_ck_warn"></span>
		</div>


		<div id="nickname_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">닉네임</div>
			<div>
				<input type="text" name="nick_name" id="nick_name" placeholder="Nick Name">
			</div>
			<span class="nick_ck_yes">사용 가능한 닉네임입니다.</span>
			<span class="nick_ck_no">닉네임이 이미 존재합니다.</span>
			<span class="nick_warn">닉네임은 특수문자를 제외한 10글자 이내만 가능합니다.</span>
			<span class="final_nick_ck">닉네임을 입력해주세요.</span>
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
			<button type="button" id="join_button" class="button special fit"><span>회원가입</span></button>
		</div>
	</form>
</div>

<script>

	var code = "";                //이메일전송 인증번호 저장위한 코드

	 /* 유효성 검사 통과유무 변수 */
	 var userid_ck = false;			// 아이디
	 var id_ck = false;				// 아이디 중복 검사
	 var userpwd_ck = false;		// 비밀번호
	 var userpwd2_ck = false;		// 비밀번호 확인
	 var pwd_cor_ck = false;        // 비밀번호 - 확인 일치 확인
	 var name_ck = false;			// 이름
	 var bday_ck = false;			// 생년월일 체크
	 var email_ck = false;			// 이메일
	 var mail_ck = false;			// 이메일 중복 검사
	 var emailnum_ck = false;		// 이메일 인증번호 확인
	 var nick_name_ck = false;		// 닉네임
	 var nick_ck = false;			// 닉네임 중복 검사
	 var id_warn_ck = false;		// 아이디 형식체크
	 var pwd_warn_ck = false;		// 비밀번호 형식체크
	 var name_warn_ck = false;		// 이름 형식체크
	 var bday_warn_ck = false;		// 생년월일 형식체크
	 var mail_warn_ck = false;		// 이메일 형식체크
	 var nick_warn_ck = false;		// 닉네임 형식체크
	 
	
	$(document).ready(function() {
		//회원가입 버튼(회원가입 기능 작동)
		$("#join_button").click(function() {
			 /* 입력값 변수 */
	        var id = $('#userid').val();			// id 입력란
	        var pw = $('#userpwd').val();			// 비밀번호 입력란
	        var pwck = $('#userpwd2').val();		// 비밀번호 확인 입력란
	        var name = $('#name').val();			// 이름 입력란
	        var bday = $('#bday').val();		// 생일 입력란
	        var email = $('#email').val();			// 이메일 입력란
	        var nickname = $('#nick_name').val();	// 닉네임 입력란
	        
	        /* 아이디 유효성검사 */
	        if(id == ""){
	            $('.final_id_ck').css('display','block');
	            userid_ck = false;
	        }else{
	            $('.final_id_ck').css('display', 'none');
	            userid_ck = true;
	        }
	        
	        /* 비밀번호 유효성 검사 */
	        if(pw == ""){
	            $('.final_pw_ck').css('display','block');
	            userpwd_ck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            userpwd_ck = true;
	        }
	        
	        /* 비밀번호 확인 유효성 검사 */
	        if(pwck == ""){
	            $('.final_pwck_ck').css('display','block');
	            userpwd2_ck = false;
	        }else{
	            $('.final_pwck_ck').css('display', 'none');
	            userpwd2_ck = true;
	        }
	        
	        /* 이름 유효성 검사 */
	        if(name == ""){
	            $('.final_name_ck').css('display','block');
	            name_ck = false;
	        }else{
	            $('.final_name_ck').css('display', 'none');
	            name_ck = true;
	        }
	        
	        /* 생년월일 유효성 검사 */
	        if(bday == ""){
	            $('.final_bday_ck').css('display','block');
	            bday_ck = false;
	        }else{
	            $('.final_bday_ck').css('display', 'none');
	            bday_ck = true;
	        }
	        
	        /* 이메일 유효성 검사 */
	        if(email == ""){
	            $('.final_email_ck').css('display','block');
	            email_ck = false;
	        }else{
	            $('.final_email_ck').css('display', 'none');
	            email_ck = true;
	        }
	        
	        /* 닉네임 유효성 검사 */
	        if(nickname == ""){
	            $('.final_nick_ck').css('display','block');
	            nick_name_ck = false;
	        }else{
	            $('.final_nick_ck').css('display', 'none');
	            nick_name_ck = true;
	        }
	        
	        
	        /* 최종 유효성 검사 */
	        if(userid_ck&&id_ck&&userpwd_ck&&userpwd2_ck&&pwd_cor_ck&&name_ck&&bday_ck&&
	        		email_ck&&mail_ck&&emailnum_ck&&
	        		nick_name_ck&&nick_ck&&
	        		id_warn_ck&&pwd_warn_ck&&name_warn_ck&&bday_warn_ck&&mail_warn_ck&&nick_warn_ck){
	        	$("#join_form").attr("action", "${myctx}/join");
				$("#join_form").submit();
				alert('회원가입 완료');
	 
	        }
	        
	        return false; 
	        
		});
	});

	//아이디 중복검사
	$('#userid').on("propertychange change keyup paste input", function() {
		var userid = $('#userid').val(); // #userid에 입력되는 값
		var data = {
			userid : userid
		} // '컨트롤에 넘길 데이터 이름' : '데이터(#userid에 입력되는 값)'

		$.ajax({
			type : "post",
			url : "/userIdChk",
			data : data,
			success : function(result) {
				// console.log("성공 여부" + result);
				if (result != 'fail') {
					$('.id_ck_yes').css("display", "inline-block");
					$('.id_ck_no').css("display", "none");
					id_ck = true;
				} else {
					$('.id_ck_no').css("display", "inline-block");
					$('.id_ck_yes').css("display", "none");
					id_ck = false;
				}

			}// success 종료
		}); // ajax 종료
		
		/* 아이디 형식 체크 */
		if(idF_ck(userid)){
	        $('.id_warn').css('display', 'none');
	        id_warn_ck = true;
	    }else{
	    	$('.id_warn').css('display', 'block');
	        id_warn_ck = false;
	    } 
	});// function 종료
	
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
	
	/* 이메일 중복 검사 */
	$('#email').on("propertychange change keyup paste input", function() {
		var email = $('#email').val();
		var data = {
			email : email
		}

		$.ajax({
			type : "post",
			url : "/userEmailChk",
			data : data,
			success : function(result) {
				// console.log("성공 여부" + result);
				if (result != 'fail') {
					$('.mail_ck_yes').css("display", "inline-block");
					$('.mail_ck_no').css("display", "none");
					mail_ck = true;
				} else {
					$('.mail_ck_no').css("display", "inline-block");
					$('.mail_ck_yes').css("display", "none");
					mail_ck = false;
				}

			}// success 종료
		}); // ajax 종료
	});// function 종료

	/* 인증번호 이메일 전송 */
	$("#email_ck_button").click(function() {
		
		var email = $("#email").val();		// 입력한 이메일 변수
		var cehckBox = $("#email_ck");		//인증번호 입력란
	    var boxWrap = $(".mail_ck_box");	// 인증번호 입력란 박스
	    var warnMsg = $(".mail_warn");		// 이메일 입력 경고글
	    
	    /* 이메일 형식 체크 */
	    if(mailF_ck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	        mail_warn_ck = true;
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        mail_warn_ck = false;
	        return false;
	    } 
	    
		$.ajax({
			type : "GET",
			url : "/mailCheck?email=" + email,
	        success:function(data){
	        	//console.log("data : " + data);
	        	cehckBox.attr("disabled",false);
	        	boxWrap.attr("id", "mail_ck_true");
	        	code = data;
	        }

		});

	});
	
	/* 인증번호 비교 */
	$("#email_ck").blur(function(){
		
		var inputCode = $("#email_ck").val();			// 입력코드    
	    var checkResult = $("#mail_ck_warn");			// 비교 결과
	    
	    if(inputCode == code){							// 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");
	        emailnum_ck = true;
	    } else {										// 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        emailnum_ck = false;
	    }
	    
	});

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

	/* 이름 형식 체크 */
	$('#name').on("propertychange change keyup paste input", function() {
		var name = $('#name').val();

		if (nameF_ck(name)) {
			$('.name_warn').css('display', 'none');
			name_warn_ck = true;
		} else {
			$('.name_warn').css('display', 'block');
			name_warn_ck = false;
		}
	});

	/* 생년월일 형식 체크 */
	$('#bday').on("propertychange change keyup paste input", function() {
		var bday = $('#bday').val();

		if (bdayF_ck(bday)) {
			$('.bday_warn').css('display', 'none');
			bday_warn_ck = true;
		} else {
			$('.bday_warn').css('display', 'block');
			bday_warn_ck = false;
		}
	});

	/* Form 형식 체크 */
	function idF_ck(userid) {
		let pattern = /^([A-Za-z])[A-Za-z0-9_!]{3,7}$/;
		return pattern.test(userid);
	}
	function pwdF_ck(userpwd) {
		let pattern = /^[\w!\.]{4,8}$/;
		return pattern.test(userpwd);
	}
	function nameF_ck(name) {
		let pattern = /^[가-힣]{2,}$/;
		return pattern.test(name);
	}
	function bdayF_ck(bday) {
		let pattern = /^(19|20)[\d]{2}[-\/](0[1-9]|1[0-2])[-\/](0[1-9]|[12][0-9]|3[0-1])$/;
		return pattern.test(bday);
	}
	function mailF_ck(email) {
		let pattern = /^[\w-]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
		return pattern.test(email);
	}
	function nickF_ck(nick_name) {
		let pattern = /^[가-힣a-zA-Z0-9]{0,11}$/
		return pattern.test(nick_name);
	}
</script>