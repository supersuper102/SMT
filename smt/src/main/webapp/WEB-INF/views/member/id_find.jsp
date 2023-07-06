<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box" style="padding: 20px;">
	<form method="post" id="id_find_form">
		<h3 style="color: #f56a6a; text-align: center;">아이디 찾기</h3>

		<div id="name_wrap">
			<div style="padding: 10px;">
			<div style="color: #f56a6a; font-weight: bold;">이름</div>
				<input type="text" class="form-control" placeholder="Name"
					name="name" id="name" maxlength="20">
			<span class="name_warn">이름은 한글로 2자 이상만 가능합니다.</span>
			<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
		</div>

		<div id="mail_wrap" style="width: 100%; padding: 10px;">
			<div style="color: #f56a6a; font-weight: bold;">이메일</div>
			<div>
				<input type="email" name="email" id="email" placeholder="Email">
			</div>
			<span class="mail_warn"></span>
			<span class="final_email_ck">이메일을 입력해주세요.</span>
		</div>

		<div id="mail_ck_wrap" style="width: 100%; padding: 10px;">
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
		
		<div style="padding-bottom: 10px; padding-top: 10px;">
			<button class="button special fit" id="id_find_button"><span>아이디 찾기</span></button>			
		</div>
	</form>
</div>

<script>

var code = "";
var name_ck = false;			// 이름
var name_warn_ck = false;		// 이름 형식체크
var email_ck = false;			// 이메일
var emailnum_ck = false;		// 이메일 인증번호 확인
var mail_warn_ck = false;		// 이메일 형식체크

    /* 버튼 클릭 메서드 */
    $("#id_find_button").click(function(){
    	var name = $('#name').val();			// 이름 입력란
    	var email = $('#email').val();			// 이메일 입력란
    	
    	/* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            name_ck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            name_ck = true;
        }
    	
        /* 이메일 유효성 검사 */
        if(email == ""){
            $('.final_email_ck').css('display','block');
            email_ck = false;
        }else{
            $('.final_email_ck').css('display', 'none');
            email_ck = true;
        }
        
        //alert("로그인 버튼 작동");
        /* 최종 유효성 검사 */
        if(name_ck&&email_ck&&emailnum_ck&&name_warn_ck&&mail_warn_ck){
        	$("#id_find_form").attr("action", "${myctx}/id_find_res");
			$("#id_find_form").submit();
        }
        
        return false; 
        
	});
    
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
			url : "/Findmail?email=" + email,
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
    
    /*Form 형식 체크*/
    function nameF_ck(name) {
		let pattern = /^[가-힣]{2,}$/;
		return pattern.test(name);
	}
    
    function mailF_ck(email) {
		let pattern = /^[\w-]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
		return pattern.test(email);
	}
</script>