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
	
	@PostMapping("/write")//boardWrite.jsp에서 submit했을 때 처리
	public String boardWrite() {
		
		


		return "board/boardList";
		//WEB-INF/views/board/boardList.jsp
	}
	
	
	@GetMapping("/list")
	public String boardList() {
		
		
		return "board/boardList";
		//WEB-INF/views/board/boardList.jsp
	}
	
	@GetMapping("/view/1")
	public String boardView() {
		
		return "board/boardView";
	}
	
	@GetMapping("/edit")//게시글 수정 페이지
	public String boardEditForm() {
		
		return "board/boardEdit";
	}
	
	@PostMapping("/edit")//게시글 수정 처리
	public String boardEdit() {
		
		
		return "board/boardView";
	}
	
	
	@PostMapping("/delete")
	public String boardDel() {
		
		return "redirect:list";
	}
	

}
