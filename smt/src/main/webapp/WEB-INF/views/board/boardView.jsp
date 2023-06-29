<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- taglib functions-------------------------------------------- -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ------------------------------------------------------------ -->
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

		<c:if test="${board eq null}">
			<h1 style="text-align:center; font-family:sans-serif; color:#F56A6A">해당 게시글은 존재하지 않습니다.</h1>
		</c:if>
		
		<c:if test="${board ne null}">
			<!-- 내가 작성------------------------------------ -->
			<form name="bf" id="bf" method="post">
				<input type="hidden" name="bno" value="${board.bno}">
				<table>
					<tr>
						<td style="text-align:center; font-size:20px"><b>제목</b></td>
						<td colspan="3" style="font-size:14pt">
						${board.title}
						</td>
					</tr>
					<tr>
						<td style="width:10%; text-align:center; font-size:20px"><b>작성자</b></td>
						<td style="width:70%; font-size:14pt">
						${board.idx}
						</td>
						<td style="width:10%; font-size:12pt">${board.wdate}</td>
						<td style="width:10%; font-size:12pt">조회수 ${board.readnum}</td>
					</tr>
					<tr>
						<td colspan="4" style="font-size:14pt; padding: 15pt 15pt; color:black;">
						${board.content}
						
						<!-- 파일 확장자 검사를 위해 모두 소문자로 바꾸자 -->
	                    <c:set var="fname" value="${fn:toLowerCase(board.filename)}"/>
	                    <c:if test="${fn:endsWith(fname,'.jpg') or fn:endsWith(fname,'.png') or fn:endsWith(fname,'.gif')}">
							<img src="/resources/board_upload/${board.filename}">
						</c:if>
						</td>
					</tr>
					<tr>
						<td style="text-align:center; font-size:20px"><b>첨부 파일</b></td>
						<td colspan="3" style="font-size:14pt">
							<c:if test="${board.filename ne null}">
								<a href="#" onclick="goDown()" style="color:inherit; text-decoration:none; border-bottom: 0px;">
								${board.origin_filename} [${board.filesize} bytes]
								</a>
							</c:if>
						</td>
					</tr>
	
				</table>
	
				<ul class="actions" style="text-align:right;">
					<li><button type="submit" class="button" formaction="/board/edit"><span style="font-size:14pt; font-family:sans-serif">수정</span></button></li>
					<li><button type="submit" class="button" formaction="/board/delete"><span style="font-size:14pt; font-family:sans-serif">삭제</span></button></li>
					<li><a href="/board/list" class="button special" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">목록</span></a></li>
					<li><a href="/board/write" class="button special" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">글쓰기</span></a></li>
				</ul>
	
			</form>
			<br><br>
		</c:if>
		
		
		<!-- 파일 다운로드를 위한 form------------------------------------ -->
		<form name="fileF" id="fileF" method="POST" action="../fileDown">
			<input type="hidden" name="fname" value="<c:out value="${board.filename}"/>">
			<input type="hidden" name="origin_fname" value="<c:out value="${board.origin_filename}"/>">
		</form>
		
		<!-- 댓글 작성을 위한 form----------------------------------------- -->
		<form name="rf" id="rf">
			<input type="hidden" name="bno" value="${board.bno}">
			<input type="hidden" name="idx" value="${board.idx}">
			
			<textarea name="replycontent" id="replycontent" onfocus="clearPlaceholder()" onblur="setPlaceholder()" rows="5" cols="10" placeholder="댓글을 입력하세요"></textarea>
			<button class="button special small" onclick="reply()" style="margin-top:10px; float:right;"><span style="font-size:10pt; font-family:sans-serif">등록</span></button>
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
					<form name="ref" id="ref" method="post">
						<textarea name="replycontent" id="replyEditcontent" rows="2" cols="10">댓글 수정 눌렀을 때 댓글 내용이 나와야 함</textarea>
						<button class="button special small" style="margin-top:10px; float:right;" onclick="submitEditedReply()"><span style="font-size:10pt; font-family:sans-serif">등록</span></button>
					</form>
				</td>
			</tr>

		</table>
		<!-- -------------------------------- -->
	</div>
<script>
	
	//파일 다운로드 처리
	const goDown=function(){
		fileF.submit();
	}//----------------------

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