package com.smt.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.smt.mapper.BoardMapper;
import com.smt.model.BoardVO;

@Service("boardService")//이름을 지정하는 것은 선택 사항이며, 이름을 지정하지 않는다면, 클래스 이름이 기본적으로 빈의 이름으로 사용됨
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardMapper boardMapper;

	@Override
	public int insertBoard(BoardVO board) {
		
		return this.boardMapper.insertBoard(board);
		//this는 BoardServiceImpl를 가리키고 생략해도 됨
	}


	@Override
	public List<BoardVO> selectBoardAll2() {
		
		return this.boardMapper.selectBoardAll2();
	}
	
	@Override
	public List<BoardVO> selectBoardAll(Map<String, Object> map) {
		
		return this.boardMapper.selectBoardAll(map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		
		return this.boardMapper.getTotalCount(map);
	}

	@Override
	public BoardVO selectBoardByBno(int bno) {
		
		return this.boardMapper.selectBoardByBno(bno);
	}

	@Override
	public int updateReadnum(int bno) {
		
		return this.boardMapper.updateReadnum(bno);
	}

	@Override
	public int deleteBoard(int bno) {
		
		return this.boardMapper.deleteBoard(bno);
	}

	@Override
	public int updateBoard(BoardVO board) {

		return this.boardMapper.updateBoard(board);
	}




}
