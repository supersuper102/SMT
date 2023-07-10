<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box" style="padding: 20px;">
	<form method="post" id="id_find_res_form">
		<h3 style="color: #f56a6a; text-align: center;">아이디 찾기 결과</h3>
		<div class="form" style="padding: 10px; text-align: center; font-size: 20px">
			<c:choose>
				<c:when test="${empty findmember }">
					<span>조회 결과가 없습니다.</span>
					<span>입력정보를 확인하여 주십시오.</span>
				</c:when>
				<c:otherwise>
					<span>회원님의 아이디는 <b>"<c:out value="${findmember.userid}"></c:out>
							"
					</b> 입니다.
					</span>
				</c:otherwise>
			</c:choose>
		</div>
		
		<c:if test="${findmember==null }">
		<div style="padding: 10px;">
			<ul class="actions" style='text-align: center'
				id="id_find_res_button">
				<li><a href="${myctx}/id_find" class="button special">아이디 찾기 페이지로 이동</a></li>
			</ul>
		</div>
		</c:if>
		
		<c:if test="${findmember != null }">
		<div style="padding: 10px;">
			<ul class="actions" style='text-align: center'
				id="id_find_res_button">
				<li><a href="${myctx}/login" class="button special">로그인 페이지로 이동</a></li>
			</ul>
		</div>
		</c:if>
	</form>
</div>