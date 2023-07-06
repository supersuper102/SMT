package com.smt.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.smt.model.MemberVO;
import com.smt.model.ReplyVO;
import com.smt.service.BoardService;
import com.smt.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class ReplyController {

	@Resource(name="replyService")
	private ReplyService replyService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@PostMapping(value="/replyWrite", produces="application/json")
	public ModelMap replyInsert(@RequestBody ReplyVO reply, HttpSession session){
		log.info("replyWrite="+reply);

		// 회원 정보 가져오기
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    // 로그인 회원의 idx를 reply의 idx에 넣기
	    reply.setIdx(member.getIdx());

		int n = this.replyService.insertReply(reply);
		String str = (n>0)?"OK":"Fail";
		ModelMap map = new ModelMap("result", str);
		
		log.info("replyWrite="+reply);
		log.info("member.getIdx()="+member.getIdx());
		log.info("reply.getIdx()="+reply.getIdx());
		
		return map;
	}
	
	@GetMapping(value="/replyList", produces="application/json")
	public List<ReplyVO> replyAll(int bno){
		log.info("bno="+bno);
		
		List<ReplyVO> arr = this.replyService.selectReply(bno);
		
		//회원번호(idx)로 닉네임 가져오기
		for (ReplyVO reply : arr) {
	        int writerIdx = reply.getIdx();
	        String nickName = boardService.getNickNameByMemberIdx(writerIdx);
	        reply.setNick_name(nickName);
		}

		log.info("arr="+arr);
		return arr;
	}
	
	@DeleteMapping(value="/replyDel/{rno}", produces="application/json")
	public ModelMap replyDelete(@PathVariable("rno") int rno) {
		log.info("rno="+rno);
		
		int n = replyService.deleteReply(rno);
		
		String str = (n>0)?"OK":"Fail";
		ModelMap map = new ModelMap("result", str);
		return map;
	}
	
	@PutMapping(value="/replyEdit/{rno}", produces="application/json")
	public ModelMap replyEdit(@PathVariable("rno") int rno, @RequestBody ReplyVO reply){
		log.info("rno"+rno);
		
		reply.setRno(rno);
		log.info("replyEdit="+reply);
		
		int n = this.replyService.updateReply(reply);
		
		//회원번호(idx)로 닉네임 가져오기
		int writerIdx = reply.getIdx();
		String nickName = boardService.getNickNameByMemberIdx(writerIdx);
		reply.setNick_name(nickName);
		
		String str = (n>0)?"OK":"Fail";
		ModelMap map = new ModelMap("result", str);
		
		log.info("replyEdit="+reply);
		
		return map;
	}
}
