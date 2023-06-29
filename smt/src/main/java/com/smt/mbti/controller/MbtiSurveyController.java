package com.smt.mbti.controller;

import org.springframework.stereotype.Controller;
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
	public String moveMbtiResult() {
		return "mbtiSurvey/mbtiResult";
	}
}
