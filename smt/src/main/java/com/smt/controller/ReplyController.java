package com.smt.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.smt.service.ReplyService;

@Controller
public class ReplyController {

	@Resource(name="replyService")
	private ReplyService replyService;
	

	
}
