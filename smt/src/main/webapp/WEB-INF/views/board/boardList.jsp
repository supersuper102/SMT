<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<!-- Banner -->
<section id="banner">
	<div class="content">
		<header>
			<h2 style="text-align: center; font-family: sans-serif">게시판 목록
				페이지</h2>
		</header>

		<form name="bsearch" action="list" class="search-form">
			<select name="findType"
				style="padding: 5px; width: 10%; height: 120%; text-align: center; font-size: 15pt; font-family: sans-serif; font-weight: bold; color: #f56a6a; border: solid 1px #f56a6a; display:inline; background-color:rgb(254,244,244)">
				<option value="">검색유형▼</option>
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="w">작성자</option>
			</select> <input type="text" name="findKeyword"
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

			<tr>
				<td>1</td>
				<td><a href="/board/view/1" style="text-decoration:none !important;  color:inherit;">안녕하세요</a>
				</td>
				<td>하민지</td>
				<td>2023-06-18</td>
				<td>0</td>
			</tr>

			<tr>
				<td>1</td>
				<td>안녕하세요</td>
				<td>하민지</td>
				<td>2023-06-18</td>
				<td>0</td>
			</tr>

			<tr>
				<td>1</td>
				<td>안녕하세요</td>
				<td>하민지</td>
				<td>2023-06-18</td>
				<td>0</td>
			</tr>

			<tr>
				<td>1</td>
				<td>안녕하세요</td>
				<td>하민지</td>
				<td>2023-06-18</td>
				<td>0</td>
			</tr>

			<tr>
				<td>1</td>
				<td>안녕하세요</td>
				<td>하민지</td>
				<td>2023-06-18</td>
				<td>0</td>
			</tr>

		</table>

		<ul class="actions" style="text-align: right">
			<li><a href="/board/write" class="button special small"><span
					style="font-size: 12pt; font-family: sans-serif;">글쓰기</span></a></li>
		</ul>

		<ul class="pagination" style="text-align:center; font-size:15pt">
			<li><span class="button disabled small">Prev</span></li>
			<li><a href="#" class="page active">1</a></li>
			<li><a href="#" class="page">2</a></li>
			<li><a href="#" class="page">3</a></li>
			<li><span>…</span></li>
			<li><a href="#" class="page">8</a></li>
			<li><a href="#" class="page">9</a></li>
			<li><a href="#" class="page">10</a></li>
			<li><a href="#" class="button small">Next</a></li>
		</ul>
	</div>

</section>


<!-- Section -->