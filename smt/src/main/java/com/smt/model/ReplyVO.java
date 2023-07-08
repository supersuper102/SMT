package com.smt.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;//댓글번호
	private int bno;//게시물 번호
	private int idx;//회원 번호
	private String replycontent;//댓글 내용
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date wdate;//댓글 작성일
	private int hit;//추천수
	
	private String nick_name;
	private String mbti_type;
}
