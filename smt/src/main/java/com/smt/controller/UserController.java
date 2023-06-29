package com.smt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smt.model.MemberVO;
import com.smt.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {

		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		log.info("join 진입");
		/* System.out.println("member=="+member.getUserid()); */

		// 회원가입 서비스 실행
		memberService.memberJoin(member);

		log.info("join Service 성공");

		return "index";

	}

}
