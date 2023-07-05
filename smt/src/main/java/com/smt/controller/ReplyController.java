package com.smt.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.smt.model.ReplyVO;
import com.smt.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class ReplyController {

	@Resource(name="replyService")
	private ReplyService replyService;
	
	@PostMapping(value="/replyWrite", produces="application/json")
	public ModelMap replyInsert(@RequestBody ReplyVO reply){
		log.info("replyWrite="+reply);
		
		int n = this.replyService.insertReply(reply);
		String str = (n>0)?"OK":"Fail";
		ModelMap map = new ModelMap("result", str);
		
		log.info("replyWrite="+reply);
		
		return map;
	}
	
	@GetMapping(value="/replyList", produces="application/json")
	public List<ReplyVO> replyAll(int bno){
		log.info("bno="+bno);
		
		List<ReplyVO> arr = this.replyService.selectReply(bno);

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
		String str = (n>0)?"OK":"Fail";
		ModelMap map = new ModelMap("result", str);
		
		log.info("replyEdit="+reply);
		
		return map;
	}
}
