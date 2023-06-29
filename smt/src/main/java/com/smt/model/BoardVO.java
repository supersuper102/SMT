package com.smt.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private int bno;
	private int idx;
	private String title;
	private String content;
	private Date wdate;
	private int readnum;
	private String filename;//물리적 파일명 uuid_파일명
	private String origin_filename;//원본 파일명
	private long filesize;
	
	private String old_filename;//예전에 첨부한 파일명
	
	
	private String findType;
	private String findKeyword;
}
