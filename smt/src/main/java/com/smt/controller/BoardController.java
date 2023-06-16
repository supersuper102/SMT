package com.smt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {

	@GetMapping("/write")
	public String boardForm() {
		
		return "board/boardWrite";
		//WEB-INF/views/board/boardWrite.jsp
	}
	
	@PostMapping("/write")
	public String boardWrite() {

		return "board/boardList";
	}
	
	
	@GetMapping("/list")
	public String boardList() {
		
		return "board/boardList";
		//WEB-INF/views/board/boardList.jsp
	}
}
