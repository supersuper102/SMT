<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- form 양식 체크하는 js파일 들어갈 자리 -->

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
			<span calss=""></span>
		</div>

		<div id="userpwd_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호</div>
			<div>
				<input type="password" name="userpwd" id="userpwd"
					placeholder="🔒Password">
			</div>
			<span calss=""></span>
		</div>

		<div id="userpwd2_wrap">
			<div style="color: #f56a6a; font-weight: bold;">비밀번호 확인</div>
			<div>
				<input type="password" name="userpwd2" id="userpwd2"
					placeholder="🔒Re Password">
			</div>
			<span calss=""></span>
		</div>

		<div id="name_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">이름</div>
			<div>
				<input type="text" name="name" id="name" placeholder="Name">
			</div>
			<span calss=""></span>
		</div>

		<div id="bday_wrap">
			<div style="color: #f56a6a; font-weight: bold;">생년월일</div>
			<div>
				<input type="date" name="bday" id="bday">
			</div>
			<span calss=""></span>
		</div>

		<div id="mail_wrap" style="width: 100%">
			<div style="color: #f56a6a; font-weight: bold;">이메일</div>
			<div>
				<input type="email" name="email" id="email">
			</div>
			<span calss=""></span>
		</div>

		<div id="mail_ck_wrap" style="width: 100%">
			<div style="color: #f56a6a; font-weight: bold;">인증번호 확인</div>
			<div class="mail_ck_box" style="width: 83%; float: left;" id="mail_ck_false">
				<input type="text" name="email_ck" id="email_ck" disabled="disabled">
			</div>
			<div align="right"
				style="width: 15%; float: right; text-align: center;">
				<button type="button" id="email_ck_button" class="button fit">전송</button>
			</div>
			<div style="clear: both;"></div>
			<span id="mail_ck_warn"></span>
		</div>


		<div id="nickname_wrap" style="padding-top: 20px;">
			<div style="color: #f56a6a; font-weight: bold;">닉네임</div>
			<div>
				<input type="text" name="nick_name" id="nick_name"
					placeholder="Nick Name">
			</div>
			<span calss=""></span>
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
			<button type="button" id="join_button" class="button special fit">회원가입</button>
		</div>
	</form>
</div>

<script>

	var code = "";                //이메일전송 인증번호 저장위한 코드

	 /* 유효성 검사 통과유무 변수 */
	 var userid_ck = false;            // 아이디
	 var id_ck = false;            // 아이디 중복 검사
	 var userpwd_ck = false;            // 비밀번호
	 var userpwd2_ck = false;            // 비밀번호 확인
	 var pwd_cor_ck = false;        // 비밀번호 - 확인 일치 확인
	 var name_ck = false;            // 이름
	 var bday_ck = false         // 생년월일 체크
	 var email_ck = false;            // 이메일
	 var emailnum_ck = false;        // 이메일 인증번호 확인
	 var nickname_ck = false         // 닉네임
	
	$(document).ready(function() {
		//회원가입 버튼(회원가입 기능 작동)
		$("#join_button").click(function() {
			alert('회원가입 완료');
			 /* 입력값 변수 */
	        var id = $('#userid').val();                 // id 입력란
	        var pw = $('#userpwd').val();                // 비밀번호 입력란
	        var pwck = $('#userpwd2').val();            // 비밀번호 확인 입력란
	        var name = $('#name').val();            // 이름 입력란
	        var birthday = $('#bday').val();        // 주소 입력란
	        var mail = $('#email').val();            // 이메일 입력란
	        var nickname = $('#nick_name').val();        // 주소 입력란
			$("#join_form").attr("action", "${myctx}/join");
			$("#join_form").submit();
		});
	});

	//아이디 중복검사
	$('#userid').on("propertychange change keyup paste input", function() {
		var userid = $('#userid').val(); // .id_input에 입력되는 값
		var data = {
			userid : userid
		} // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

		$.ajax({
			type : "post",
			url : "/userIdChk",
			data : data,
			success : function(result) {
				// console.log("성공 여부" + result);
				if (result != 'fail') {
					$('.id_ck_yes').css("display", "inline-block");
					$('.id_ck_no').css("display", "none");
				} else {
					$('.id_ck_no').css("display", "inline-block");
					$('.id_ck_yes').css("display", "none");
				}

			}// success 종료
		}); // ajax 종료
	});// function 종료

	/* 인증번호 이메일 전송 */
	$("#email_ck_button").click(function() {

		var email = $("#email").val(); // 입력한 이메일 변수
		var cehckBox = $("#email_ck");
	    var boxWrap = $(".mail_ck_box");    // 인증번호 입력란 박스
		
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
		
		var inputCode = $("#email_ck").val();        // 입력코드    
	    var checkResult = $("#mail_ck_warn");    // 비교 결과
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");        
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	    }
	    
	});
</script>