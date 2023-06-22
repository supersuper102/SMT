<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
	$(function() {
		$('#bf').submit(function() {
			if (!$('#title').val()) {
				alert('제목을 입력하세요');
				return false;
			}

			if (!$('#content').val()) {
				alert('내용을 입력하세요');
				return false;
			}

			return true;
		})//submit----------------

	})
</script>
<!-- Banner -->
<section id="banner">
	<div class="content">
		<header style="text-align: center">
			<h2 style="text-align:center; font-family:sans-serif">게시판 수정 페이지</h2>
		</header>

		<!-- 내가 작성------------------------------------ -->
		<form name="bf" id="bf" action="edit" method="post" enctype="multipart/form-data" style="font-size:15pt">
			<table>
				<tr>
					<td style="width:10%; text-align:center"><b>제목</b></td>
					<td style="width:80">
					<input type="text" name="title" id="title" value="안녕하세요" style="font-size:14pt">
					</td>
				</tr>
				<tr>
					<td style="text-align:center"><b>작성자</b></td>
					<td>
					하민지
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="content" id="content" rows="25" cols="50" style="font-size:14pt">프론트 만들기</textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align:center"><b>첨부 파일</b></td>
					<td>
					<input type="file" name="filename" id="filename">
					</td>
				</tr>

			</table>

			<ul class="actions" style="text-align: center">
				<li><button class="button special"><span style="font-size:14pt; font-family:sans-serif">완료</span></button></li>
				<li><a href="/board/view/1" class="button" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">취소</span></a></li>
			</ul>


		</form>
		<!-- -------------------------------- -->
	</div>

</section>
<!-- Section -->