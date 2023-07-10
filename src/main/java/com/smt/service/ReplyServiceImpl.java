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
		
		return replyMapper.insertReply(reply);
	}

	@Override
	public List<ReplyVO> selectReply(int bno) {
		
		return this.replyMapper.selectReply(bno);
	}

	@Override
	public int updateReply(ReplyVO reply) {
		
		return this.replyMapper.updateReply(reply);
	}

	@Override
	public int deleteReply(int rno) {
		
		return this.replyMapper.deleteReply(rno);
	}

	@Override
	public int deleteAllReply(int bno) {
		
		return this.replyMapper.deleteAllReply(bno);
	}

}
