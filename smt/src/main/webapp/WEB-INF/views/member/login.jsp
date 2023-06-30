<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="box" style="padding: 20px;">
	<form method="post" id="login_form">
		<h3 style="color: #f56a6a; text-align: center;">LOGIN</h3>
		
		<c:if test = "${result == 0 }">
			<div class = "login_warn" style="padding-bottom: 10px;">ID 또는 비밀번호를 확인하여 주십시오.</div>
		</c:if>
		
		<div class="form" style="padding: 10px;">
			<input type="text" class="form-control" placeholder="ID"
				name="userid" id="userid" maxlength="20">
		</div>
		
		<div class="form" style="padding: 10px;">
			<input type="password" class="form-control" placeholder="Password"
				name="userpwd" id="userpwd" maxlength="20">
		</div>
		
		<div style="text-align: right; padding: 5px;">
			<input type="checkbox" name="saveId" id="saveId">
			<label for="saveId"> 아이디 저장 </label>
		</div>
		
		
		<div style="padding-bottom: 10px;">
			<button class="button special fit" id="login_button">LOGIN</button>			
		</div>
		
		
		<div style="color: #f56a6a; text-align: center; font-weight: bold;">
			<a href=#>아이디 찾기</a>|
			<a href=#>비밀번호 찾기</a>|
			<a href="${myctx}/join">회원 가입</a>
		</div>
	</form>
</div>

<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $("#login_button").click(function(){
        
        //alert("로그인 버튼 작동");
    	/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/login");
        $("#login_form").submit();
    });
 
</script>