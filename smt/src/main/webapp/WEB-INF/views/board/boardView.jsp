<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.btn{
		all:unset;
	}
</style>



<!-- Banner -->
<section id="banner">
	<div class="content">
		<header style="text-align: center">
			<h2 style="text-align:center; font-family:sans-serif">게시판 게시글 페이지</h2>
		</header>

		<!-- 내가 작성------------------------------------ -->
		<form name="bf" id="bf" action="write" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td style="width:10%; text-align:center; font-size:20px"><b>제목</b></td>
					<td style="width:80; font-size:14pt">
					안녕하세요
					</td>
				</tr>
				<tr>
					<td style="text-align:center; font-size:20px"><b>작성자</b></td>
					<td style="font-size:14pt">
					하민지
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size:14pt">
					프론트 만들기
					</td>
				</tr>
				<tr>
					<td style="text-align:center; font-size:20px"><b>첨부 파일</b></td>
					<td style="font-size:14pt">
					파일이름
					</td>
				</tr>

			</table>

			<ul class="actions" style="text-align:right;">
				<li><a href="/board/edit" class="button"><span style="font-size:14pt; font-family:sans-serif">수정</span></a></li>
				<li><button class="button" formaction="/board/delete"><span style="font-size:14pt; font-family:sans-serif">삭제</span></button></li>
				<li><a href="/board/list" class="button special" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">목록</span></a></li>
				<li><a href="/board/write" class="button special" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">글쓰기</span></a></li>
			</ul>

		</form>
		<br><br>
		
		<form name="rf" id="rf">
			<textarea name="replycontent" id="replycontent" onfocus="clearPlaceholder()" onblur="setPlaceholder()" rows="5" cols="10" placeholder="댓글을 입력하세요"></textarea>
			<button class="button special small" style="margin-top:10px; float:right;"><span style="font-size:10pt; font-family:sans-serif">등록</span></button>
		</form>
		<br>
		
		<table>
			<tr>
				<td style="width:10%; text-align:center; color:black;">하민지</td>
				<td style="width:65; color:black;">댓글 쓰기</td>
				<td style="width:15%">2023-06-20</td>
				<td style="width:10%">
					<button class="btn">수정</button> |
					<button class="btn">삭제</button>
				</td>
			</tr>
			<tr>
				<td style="width:10%; text-align:center; color:black;">하민지</td>
				<td style="width:65; color:black;">댓글 쓰기</td>
				<td style="width:15%">2023-06-20</td>
				<td style="width:10%">
					<button class="btn">수정</button> |
					<button class="btn">삭제</button>
				</td>
			</tr>
			<tr id="replyText">
				<td style="width:10%; text-align:center; color:black;">하민지</td>
				<td style="width:65%; color:black;">댓글 쓰기</td>
				<td style="width:15%">2023-06-20</td>
				<td style="width:10%">
					<button class="btn" onclick="editReply(this)">수정</button> |
					<button class="btn">삭제</button>
				</td>
				
			</tr>
			<tr id="editForm" style="display: none;">
				<td colspan="4">
					<form name="ref" id="ref">
						<textarea name="replycontent" id="replyEditcontent" rows="2" cols="10">댓글 수정 눌렀을 때 댓글 내용이 나와야 함</textarea>
						<button class="button special small" style="margin-top:10px; float:right;" onclick="submitEditedReply()"><span style="font-size:10pt; font-family:sans-serif">등록</span></button>
					</form>
				</td>
			</tr>

		</table>
		<!-- -------------------------------- -->
	</div>
<script>
  function editReply(button) {
	    // 기존 텍스트 숨김
	    document.getElementById("replyText").style.display = "none";
	    // 원래 작성된 댓글을 가져와서 수정 폼에 설정
	    var originalReply = button.parentNode.parentNode.getElementsByTagName("td")[1].innerText;
	    document.getElementById("replyEditcontent").value = originalReply;
	    // 수정 폼 표시
	    document.getElementById("editForm").style.display = "table-row";
	}

	function submitEditedReply() {
	    // 수정된 내용을 가져옴
	    var editedReply = document.getElementById("replyEditcontent").value;
	    // 수정된 내용을 기존 텍스트에 설정
	    document.getElementById("replyText").innerText = editedReply;
	    // 수정 폼 숨김
	    document.getElementById("editForm").style.display = "none";
	    // 기존 텍스트 표시
	    document.getElementById("replyText").style.display = "inline";
	}
</script>
</section>
<!-- Section -->