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
						${board.nick_name}
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
				<c:if test="${member.idx eq board.idx}"> <!-- 게시글 작성자만 수정,삭제버튼 나오게 -->
					<li><button type="submit" class="button" formaction="/board/edit"><span style="font-size:14pt; font-family:sans-serif">수정</span></button></li>
					<li><button type="submit" class="button" formaction="/board/delete"><span style="font-size:14pt; font-family:sans-serif">삭제</span></button></li>
				</c:if>
					<li><a href="/board/list" class="button special" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">목록</span></a></li>
					<li><a href="/board/write" class="button special" style="font-family:sans-serif"><span style="font-size:14pt; font-family:sans-serif">글쓰기</span></a></li>
				</ul>
	
			</form>
			<br><br>
		</c:if>
		
		
		<!-- 파일 다운로드를 위한 form------------------------------------ -->
		<form name="fileF" id="fileF" method="POST" action="../fileDown">
			<input type="hidden" name="fname" value="${board.filename}">
			<input type="hidden" name="origin_fname" value="${board.origin_filename}">
		</form>
		
		<!-- 댓글 작성을 위한 form----------------------------------------- -->
		<form name="rf" id="rf">
			<input type="hidden" name="bno" id="bno" value="${board.bno}">
			<b style="font-size:15pt; color:#f56a6a; margin-left:10px;">${member.nick_name}</b>
			<textarea name="replycontent" id="replycontent" rows="5" cols="10" style="margin-top:8px" placeholder="댓글을 입력하세요"></textarea>
			<button class="button special small" onclick="replyInsert()" style="margin-top:10px; float:right;">
			<span style="font-size:10pt; font-family:sans-serif">등록</span>
			</button>
		</form>
		<br>
		
		<!-- 댓글 목록 -->
		<div id="reply_data"></div>
		
	</div>
<script>
	
	//파일 다운로드 처리
	const goDown=function(){
		fileF.submit();
	}//----------------------

	//모든 댓글 목록 가져오기
	$(function(){
		getAllReply();
	});//----------------------
	
	//댓글 작성
	const replyInsert=function(){
		let bno=$('#bno').val();
		let replycontent=$('#replycontent').val();
		let jsonData={
				bno:bno,
				replycontent:replycontent
		};
		console.log(JSON.stringify(jsonData));
		
		$.ajax({
			type:'post',
			url:'/replyWrite',
			data:JSON.stringify(jsonData),
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			cache:false,
			success:function(res){
				if(res.result=="OK"){
					getAllReply();
				}else{
					alert('댓글 작성 실패');
				}
			},
			error:function(err){
				alert(err.status);
			}
		});
	}//-------------------------

	
	//모든 댓글 목록 가져오기
	const getAllReply=function(){
		let bno=$('#bno').val();
		let jsonData={
				bno:bno
		}
				
		$.ajax({
			type:'get',
			url:'/replyList?bno=' + bno,
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(res){
				//alert(JSON.stringify(res))
				showReply(res);
			},
			error:function(err){
				alert(err.status)
			}
		})
	}//------------------------------
	
	const showReply=function(res){
		let str= '<table>';
		$.each(res, (i, reply)=>{
			str+= '<tr id="replyText'+reply.rno+'">';
			str+= '<td style="width:10%; text-align:center; color:black;">';
			str+= reply.nick_name;
			str+= '</td>';
			
			str+= '<td width="65%; color:black;">';
			str+= reply.replycontent;
			str+= '</td>';
			
			str+= '<td width="15%">';
			str+= reply.wdate;
			str+= '</td>';
			
			//댓글 작성자만 수정, 삭제 나오게
			if(${member.idx}==reply.idx){
			str+= '<td style="width:10%">';
			str+= '<button class="btn" onclick="editReply('+reply.rno+')">수정</button> | ';
			str+= '<button class="btn" onclick="delReply(\''+reply.rno+'\')">삭제</button>';
			str+= '</td>';
			}
			
			str+= '</tr>';
			
			//댓글 수정 폼
			str+= '<tr id="editForm'+reply.rno+'" style="display: none;">';
			str+= '<td colspan="4">';
			str+= '<form name="ref" id="ref">';
			str+= '<textarea name="replycontent" id="replyEditcontent'+reply.rno+'" rows="2" cols="10">';
			str+= reply.replycontent;
			str+= '</textarea>';
			str+= '<button class="button special small" style="margin-top:10px; float:right;" onclick="submitEditReply(\''+reply.rno+'\')">';
			str+= '<span style="font-size:10pt; font-family:sans-serif">등록</span></button>';
			str+= '</form>';
			str+= '</td>';
			str+= '</tr>';
		})
			
			str+= '</table>';
		$('#reply_data').html(str);
	}//------------------------------
	
	//댓글 삭제
	const delReply=function(rno){

		let url = "/replyDel/"+rno;
		$.ajax({
			type:'delete',
			url:url,
			dataType:'json',
			cache:false,
			success:function(res){
				
				if(res.result=='OK'){
					getAllReply();
				}else{
					alert('댓글 삭제 실패');
				}
			},
			error:function(err){
				alert(err.status);
			}
		})
	}//------------------------------

	
	//댓글 수정 폼
  	const editReply=function(rno) {
	    // 댓글 숨김
	    document.getElementById("replyText"+rno).style.display = "none";

	    // 수정 폼 표시
	    document.getElementById("editForm"+rno).style.display = "table-row";
	}//------------------------------

	//댓글 수정 처리
   	const submitEditReply=function(rno){
   		let bno=$('#bno').val();
		let replycontent=$('#replyEditcontent'+rno).val();
		let jsonData={
				bno:bno,
				replycontent:replycontent
		};
		//alert(JSON.stringify(jsonData));
		
		$.ajax({
			type:'put',
			url:'/replyEdit/'+rno,
			data:JSON.stringify(jsonData),
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			cache:false,
			success:function(res){
				if(res.result=="OK"){
					getAllReply();
				}else{
					alert('댓글 수정 실패');
				}
			},
			error:function(err){
				alert(err.status);
			}
		});
	}//-------------------------
	
</script>
</section>
<!-- Section -->