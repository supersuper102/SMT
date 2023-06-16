<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Editorial by HTML5 UP</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="../resources/assets/css/main.css" />

</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="/" class="logo"><strong>Editorial</strong> by HTML5 UP</a>

				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header align="center">
							<h2>게시판 글쓰기 페이지</h2>
						</header>

						<!-- 내가 작성------------------------------------ -->
						<form name="bf" id="bf" action="write" method="post"
							enctype="multipart/form-data">
							<table border="1">

								<tr>
									<td>제목</td>
									<td><input type="text" name="title"
										id="title"></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text" name="userid" id="userid">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<textarea name="content" id="content" rows="25" cols="50"></textarea>
									</td>
								</tr>
								<tr>
									<td>첨부 파일</td>
									<td><input type="file" name="origin_filename" id="origin_filename"></td>
								</tr>

							</table>

							<ul class="actions">
								<input type="submit" class="button special big" value="확인">
								<li><a href="/board/list" class="button big">취소</a></li>
							</ul>


						</form>
						<!-- -------------------------------- -->
					</div>

				</section>
				<!-- Section -->

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="/">Homepage</a></li>
						<li><a href="/board/list">Board</a></li>
						<li><a href="#">Elements</a>
						<li><span class="opener">AI 상담</span>
							<ul>
								<li><a href="book.html">책 추천</a></li>
								<li><a href="movie.html">영화 추천</a></li>
								<li><a href="chat.html">실시간 ai 상담</a></li>

							</ul></li>


					</ul>
				</nav>





				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="../resources/assets/js/jquery.min.js"></script>
	<script src="../resources/assets/js/skel.min.js"></script>
	<script src="../resources/assets/js/util.js"></script>

	<script src="../resources/assets/js/main.js"></script>

</body>
</html>