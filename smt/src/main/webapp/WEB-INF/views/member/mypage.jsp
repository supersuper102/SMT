<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div>
	<h1 style="color: #f56a6a; text-align: center;">My Page</h1>
	<div class="box" style="padding: 20px;">
		<div class="box" style="text-align: center;">
			<h1>🍊</h1>
		</div>
		<div>
			<h2 style="text-align: center;">${member.mbti_type} ${member.name}님 정보</h2>
		</div>
		<table border="1" style="text-align: center;">
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>|</td>
				<td>${member.userid}</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>|</td>
				<td>${member.email}</td>
			</tr>
			
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>|</td>
				<td>${member.nick_name}</td>
			</tr>

			<tr>
				<c:choose>
					<c:when test="${empty member.mbti_type}">
						<td style="text-align: center;">MBTI</td>
						<td>|</td>
						<td><a href="/mbtiSurvey.do" class="button special">MBTI 검사하러 가기</a></td>
					</c:when>
					<c:otherwise>
						<td style="text-align: center;">MBTI</td>
						<td>|</td>
						<td>${member.mbti_type}</td>
					</c:otherwise>
				</c:choose>
			</tr>

			<tr>
				<td style="text-align: center;">가입일</td>
				<td>|</td>
				<td>${member.indate}</td>
			</tr>
		</table>

		<ul class="actions" style="text-align: center; width: 100%;">
			<li style="width: 30%">
				<a href="#" class="button fit">
					<span style="font-size: 10pt;">작성글 목록</span>
				</a>
			</li>
			<li style="width: 30%">
				<a href="#" class="button fit">
					<span style="font-size: 10pt;">회원정보 수정</span>
				</a>
			</li>
			<li style="width: 30%">
				<a href="#" class="button fit">
					<span style="font-size: 10pt;">회원 탈퇴</span>
				</a>
			</li>
			<li></li>
		</ul>
	</div>
	
	
</div>