package com.smt.mapper;

import java.util.List;

import com.smt.model.ReplyVO;

public interface ReplyMapper {

	int insertReply(ReplyVO reply);//댓글 작성
	
	List<ReplyVO> selectReply(int bno);//댓글 목록
	
	int updateReply(ReplyVO reply);//댓글 수정
	
	int deleteReply(int rno);//댓글 삭제
	
	int deleteAllReply(int bno);//댓글 전체 삭제
}
