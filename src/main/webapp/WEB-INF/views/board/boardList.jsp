<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
#tth {
	font-size: 13pt;
	font-weight: bold;
	background-color: rgb(253, 227, 227);
	text-align: center;
}

tr:not(:first-child) {
	font-size: 12pt;
	color: black;
	text-align: center;
}

tr:not(:first-child) td:nth-child(2) {
	text-align: left;
}

#lbtn {
	text-align: right;
	font-size: 15pt;
}

input {
	border: solid 1px #f56a6a;
}
</style>

<script>
function loginCheck(event){
	if(${ member eq null }){
		event.preventDefault();
		alert("로그인 후 이용가능합니다. 로그인 페이지로 이동합니다");
		window.location.href="/login";
	}
}
</script>

<!-- Banner -->
<section id="banner">
	<div class="content">
		<header>
			<h2 style="text-align: center; font-family: sans-serif">게시판 목록 페이지</h2>
		</header>

		<form name="bsearch" action="list" class="search-form">
			<select name="findType"
				style="padding: 5px; width: 10%; height: 120%; text-align: center; font-size: 15pt; font-family: sans-serif; font-weight: bold; color: #f56a6a; border: solid 1px #f56a6a; display:inline; background-color:rgb(254,244,244)">
				<option value="">검색유형▼</option>
				<option value="t" ${findType=='t' ? 'selected' : ''}>제목</option>
				<option value="c" ${findType=='c' ? 'selected' : ''}>내용</option>
				<option value="w" ${findType=='w' ? 'selected' : ''}>작성자</option>
				<option value="m" ${findType=='m' ? 'selected' : ''}>MBTI</option>
			</select> <input type="text" name="findKeyword"  value="${findKeyword}"
				style="width: 83%; height:120%; border: solid 1px #f56a6a; display:inline-block; font-size:15pt; padding:4pt 10pt">
			<button class="button special icon fa-search small" style="text-align:center; width:1.5%; font-size:12pt; padding:0.5px 40px 0.5px 27px;" ></button>
		</form>

		<table>
			<tr id="tth">
				<td style="width: 10%">글번호</td>
				<td style="width: 50%">제목</td>
				<td style="width: 10%">작성자</td>
				<td style="width: 20%">작성일</td>
				<td style="width: 10%">조회수</td>
			</tr>
			
			<c:if test="${boardArr eq null or empty boardArr}">
				<tr>
					<td colspan="5" style="font-size:15pt">
					<b>작성된 글이 없습니다</b>
					</td>
				</tr>
			</c:if>
			<c:if test="${boardArr ne null and not empty boardArr}">
				<c:forEach var="board" items="${boardArr}">
					<tr>
						<td>${board.bno}</td>
						<td style="max-width:300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
						<a href="/board/view/${board.bno}" onclick="loginCheck(event)" style="color:inherit; text-decoration:none; border-bottom: 0px;">${board.title}</a>
						<c:if test="${board.filesize>0}">
						<span>
							<img src="../resources/images/attach.png" style="width:20px; vertical-align:middle;">
						</span>
						</c:if>
						</td>
						<td><span style="color:#f56a6a">${board.mbti_type}</span> ${board.nick_name}</td>
						<td>${board.wdate}</td>
						<td>${board.readnum}</td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
		
		<ul class="actions" style="text-align: right">
			<li><a href="/board/write" class="button special small" onclick="loginCheck(event)">
			<span style="font-size: 12pt; font-family: sans-serif;">글쓰기</span></a></li>
		</ul>

		<ul class="pagination" style="text-align:center; font-size:15pt">
		<c:if test="${cpage eq 1}">
			<li><span class="button disabled small">Prev</span></li>
		</c:if>
		<c:if test="${cpage ne 1}">
			<li><a href="list?cpage=${cpage - 1}&findType=${findType}&findKeyword=${findKeyword}" class="button small">Prev</a></li>
		</c:if>
		
		<c:forEach var="i" begin="1" end="${pageCount}">
			<li>
			<a class="page <c:if test="${i eq cpage}">active</c:if>" href="list?cpage=${i}&findType=${findType}&findKeyword=${findKeyword}">${i}</a>
			</li>
		</c:forEach>
		
		<c:if test="${cpage eq pageCount}">
			<li><span class="button disabled small">Next</span></li>
		</c:if>
		<c:if test="${cpage ne pageCount}">
			<li><a href="list?cpage=${cpage + 1}&findType=${findType}&findKeyword=${findKeyword}" class="button small">Next</a></li>
		</c:if>
		</ul>
	</div>

</section>


<!-- Section -->