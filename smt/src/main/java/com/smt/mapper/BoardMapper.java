package com.smt.mapper;

import java.util.List;
import java.util.Map;

import com.smt.model.BoardVO;

public interface BoardMapper {

	int insertBoard(BoardVO board);

	//회원번호에 해당하는 닉네임 가져오기
	String getNicknameByIdx(int idx);
	
	// 페이지 처리 안하고 게시목록 가져오기
	List<BoardVO> selectBoardAll2();
	// 페이지 처리하고 게시목록 가져오기
	List<BoardVO> selectBoardAll(Map<String,Object> map);

	//총 게시글 수 가져오기
	int getTotalCount(Map<String, Object> map);

	// 글번호에 해당하는 글 가져오기
	BoardVO selectBoardByBno(int bno);   
	// 조회수 증가하기
	int updateReadnum(int bno);
	   
	
	int deleteBoard(int bno);
	int updateBoard(BoardVO board);
}
