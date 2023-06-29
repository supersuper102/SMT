package com.smt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smt.mapper.ReplyMapper;
import com.smt.model.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public int insertReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyVO> selectReply(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int rno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
