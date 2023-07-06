<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box" style="padding: 20px;">
	<form method="post" id="id_find_res_form">
		<h3 style="color: #f56a6a; text-align: center;">임시 비밀번호 발급</h3>
		<div class="form" style="padding: 10px; text-align: center; font-size: 20px">
					<span>
					회원님의 임시 비밀번호는
					 <b>"${newPwd}"</b>
					 입니다.
					</span>
		</div>

		<div style="padding: 10px;">
			<ul class="actions" style='text-align: center'
				id="pwd_find_res_button">
				<li><a href="${myctx}/login" class="button special">로그인 페이지로 이동</a></li>
			</ul>
		</div>
	</form>
</div>