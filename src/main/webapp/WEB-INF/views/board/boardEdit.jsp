<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ckeditor 4 cdn--------------------------- -->
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<!-- ----------------------------------------- -->

<script>
	$(function() {
		CKEDITOR.replace('bcontent',{
			removeButtons:'Image',
		    height: '500px'
		});
		
		$('#bf').submit(function() {
			if (!$('#title').val()) {
				alert('제목을 입력하세요');
				return false;
			}

			if (!CKEDITOR.instances.bcontent.getData()) {
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

		
		<form name="bf" id="bf" action="edit/${board.bno}" method="post" style="font-size:15pt" enctype="multipart/form-data">
			<input type="hidden" name="bno" value="${board.bno }">
			<table>
				<tr>
					<td style="width:10%; text-align:center"><b>제목</b></td>
					<td style="width:80">
					<input type="text" name="title" id="title" value="${board.title}" style="font-size:14pt">
					</td>
				</tr>
				<tr>
					<td style="text-align:center"><b>작성자</b></td>
					<td>
					<span style="color:#f56a6a">${board.mbti_type}</span> ${board.nick_name}
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="content" id="bcontent" rows="25" cols="50" style="font-size:14pt">${board.content}</textarea>
					</td>
				</tr>
				<tr>
					<td style="text-align:center"><b>첨부 파일</b></td>
					<td>
						<c:if test="${board.filename ne null}">
							${board.origin_filename} [${board.filesize} bytes]
						</c:if>
						<br>
						<!-- <input type="file" name="filename" id="filename"> -->
						<!-- 새로 첨부하는 파일명------------------------------------------------- -->
						<input type="file" name="mfilename" id="filename">
						<!-- 예전에 첨부한 파일명을 hidden으로 보내자-------------------------------- -->
						<input type="hidden" name="old_filename" value="${board.filename}">
						<!-- --------------------------------------------------------------- -->			
					</td>
				</tr>

			</table>

			<ul class="actions" style="text-align: center">
				<li><button class="button special"><span style="font-size:14pt; font-family:sans-serif">완료</span></button></li>
				<li><a href="/board/view/${board.bno}" class="button" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">취소</span></a></li>
			</ul>


		</form>
		
	</div>

</section>
<!-- Section -->