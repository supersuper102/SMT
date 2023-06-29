<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="box" style="padding: 20px;">
	<form method="post" action="loginAction.jsp">
		<h3 style="color: #f56a6a; text-align: center;">LOGIN</h3>
		<div class="form" style="padding: 10px;">
			<input type="text" class="form-control" placeholder="ID"
				name="userid" id="userid" maxlength="20">
		</div>
		<div class="form" style="padding: 10px;">
			<input type="password" class="form-control" placeholder="Password"
				name="userpwd" id="userpwd" maxlength="20">
		</div>
		<div style="text-align: right; padding: 10px;">
			<input type="checkbox" name="saveId" id="saveId">
			<label for="saveId"> 아이디 저장 </label>
		</div>
		<div style="padding-bottom: 10px;">
			<button class="button special fit">LOGIN</button>
		</div>
		<div style="color: #f56a6a; text-align: center; font-weight: bold;">
			<a href=#>아이디 찾기</a>|
			<a href=#>비밀번호 찾기</a>|
			<a href="${myctx}/join">회원 가입</a>
		</div>
	</form>
</div>