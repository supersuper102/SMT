package com.smt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MbtiSurveyController {
	
	@RequestMapping("/mbtiSurvey.do")
	public String moveMbtiSurvey() {
		return "mbtiSurvey/mbtiMain";
	}
	
	@RequestMapping("/mbtiQuestion.do")
	public String moveMbtiQuestion() {
		return "mbtiSurvey/mbtiQuestion";
	}
	
	@RequestMapping("/mbtiResult.do")
	public String moveMbtiResult(HttpServletRequest httpServletRequest, Model model) {
		String result = httpServletRequest.getParameter("result");
		model.addAttribute("result", result);
		return "mbtiSurvey/mbtiResult";
	}
}
