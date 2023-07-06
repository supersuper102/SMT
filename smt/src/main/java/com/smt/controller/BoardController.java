package com.smt.controller;




import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.smt.model.BoardVO;
import com.smt.model.MemberVO;
import com.smt.service.BoardService;
import com.smt.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/board")
@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="replyService")
	private ReplyService replyService;
	
	@GetMapping("/write")
	public String boardForm(HttpSession session) {
		
		//로그인하지 않고 접근하면 로그인 페이지로 redirect
		MemberVO member = (MemberVO) session.getAttribute("member");
		if(member == null) 
			return "redirect:/login";
		
		return "board/boardWrite";
		//WEB-INF/views/board/boardWrite.jsp
	}
	
	@PostMapping("/write")//boardWrite.jsp에서 submit했을 때 처리
	public String boardWrite(Model m, @ModelAttribute BoardVO board,
			@RequestParam("mfilename") MultipartFile mf, HttpSession session) {
		
		// 회원 정보 가져오기
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    
	    // 작성자 정보 설정
	    board.setIdx(member.getIdx());
	    log.info("idx="+member.getIdx());
	    log.info("nick_name="+member.getNick_name());
		
		//1. 파일 업로드 처리
		//[1] 업로드 디렉토리 절대경로 얻기(resources/board_upload)
		ServletContext app = session.getServletContext();
		String upDir = app.getRealPath("/resources/board_upload");
		File dir = new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();//업로드 디렉토리 생성
		}
		
		if(!mf.isEmpty()) {//첨부파일이 있다면
			//[2] 업로드한 파일명과 파일크기 알아내기 => board에 setFilename(파일명), setFilesize(파일크기)
			String fname = mf.getOriginalFilename();//원본 파일명
			long fsize = mf.getSize();//파일크기
			
			UUID uid = UUID.randomUUID();
			String filename = uid.toString()+"_"+fname;
			log.info("fname: "+fname+", filename: "+filename+", fsize: "+fsize);

			board.setOrigin_filename(fname);//원본 파일명
			board.setFilename(filename);//물리적 파일명
			board.setFilesize(fsize);
			
			//[3] 업로드 처리
			try {
				mf.transferTo(new File(upDir, filename));
					log.info("upDir: "+upDir);
				}catch(IOException e) {
				log.error("파일업로드 에러: "+e);
			}

		}
		
		if(board.getTitle()==null || board.getContent()==null || board.getTitle().trim().isEmpty() || board.getContent().trim().isEmpty()) {
			return "redirect:write";
		}
		
		int n = this.boardService.insertBoard(board);
		
		String msg = (n>0)?"글이 작성되었습니다.":"글 작성을 실패하였습니다.";
		String loc = "list";
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);

		return "message";
	}
	
	
	@GetMapping("/list")
	public String boardList(Model m, @RequestParam(defaultValue="1") int cpage,
			 @RequestParam(defaultValue = "") String findType,
             @RequestParam(defaultValue = "") String findKeyword) {
		//List<BoardVO> boardArr = this.boardService.selectBoardAll();		
		//m.addAttribute("boardArr", boardArr);
		
		if(cpage<0) {
			cpage=1;//첫 페이지
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("findType", findType);
		map.put("findKeyword", findKeyword);
		
		//1. 총 게시글 수 가져오기
		int totalCount = this.boardService.getTotalCount(map);
		
		int pageSize = 5;
		
		int pageCount = (totalCount-1)/pageSize+1;
		
		if(cpage>pageCount) {
			cpage=pageCount;//마지막 페이지
		}
		log.info("findType, findKeyword = " + findType + ", " + findKeyword);
		log.info("TotalCount = "+totalCount);
		
		int start = (cpage-1)*pageSize;
		int end = cpage*pageSize+1;

		map.put("start", start);
		map.put("end", end);
		
		
		//2. 게시목록 가져오기
		List<BoardVO> boardArr = this.boardService.selectBoardAll(map);
		log.info("boardArr = " + boardArr);
		
		//회원번호(idx)로 닉네임 가져오기
		for (BoardVO board : boardArr) {
	        int writerIdx = board.getIdx();
	        String nickName = boardService.getNickNameByMemberIdx(writerIdx);
	        board.setNick_name(nickName);
	    }
		
		m.addAttribute("boardArr", boardArr);
		m.addAttribute("pageCount", pageCount);
		m.addAttribute("cpage", cpage);
		m.addAttribute("findType", findType);
	    m.addAttribute("findKeyword", findKeyword);
		
		return "board/boardList";
		//WEB-INF/views/board/boardList.jsp
	}
	
	@GetMapping("/view/{bno}")
	public String boardView(Model m, @PathVariable("bno") int bno, HttpSession session) {
		
		//로그인하지 않고 접근하면 로그인 페이지로 redirect
		MemberVO member = (MemberVO) session.getAttribute("member");
		if(member == null) 
			return "redirect:/login";
		
		//조회수 증가
		this.boardService.updateReadnum(bno);
				
		//글번호로 해당 글 가져오기
		BoardVO board = this.boardService.selectBoardByBno(bno);
		
		//회원번호(idx)로 닉네임 가져오기
		int writerIdx = board.getIdx();
	    String nickName = boardService.getNickNameByMemberIdx(writerIdx);
	    board.setNick_name(nickName);
		
		m.addAttribute("board", board);
		
		return "board/boardView";
	}
	
	@PostMapping("/edit")//수정 페이지 보여주기
	public String boardEditFrom(Model m, @ModelAttribute BoardVO vo) {
		
		//글번호로 해당 글 가져오기
		BoardVO board = this.boardService.selectBoardByBno(vo.getBno());
		
		//회원번호(idx)로 닉네임 가져오기
		int writerIdx = board.getIdx();
	    String nickName = boardService.getNickNameByMemberIdx(writerIdx);
	    board.setNick_name(nickName);
	    
		m.addAttribute("board", board);
		
		return "board/boardEdit";
	}
	
	@PostMapping("/edit/{bno}")//수정 처리
	public String boardEdit(Model m, @PathVariable("bno") int bno, @ModelAttribute BoardVO board,
			@RequestParam("mfilename") MultipartFile mf, HttpSession session) {
		
		//1. 파일 업로드 처리
		//[1] 업로드 디렉토리 절대경로 얻기(resources/board_upload)
		ServletContext app = session.getServletContext();
		String upDir = app.getRealPath("/resources/board_upload");
		File dir = new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();//업로드 디렉토리 생성
		}
		
		if(!mf.isEmpty()) {//첨부파일이 있다면
			//[2] 업로드한 파일명과 파일크기 알아내기 => board에 setFilename(파일명), setFilesize(파일크기)
			String fname = mf.getOriginalFilename();//원본 파일명
			long fsize = mf.getSize();//파일크기
			//파일 컨텐트 타입
			//String ftype = mf.getContentType();
			
			UUID uid = UUID.randomUUID();
			String filename = uid.toString()+"_"+fname;
			log.info("fname: "+fname+", filename: "+filename+", fsize: "+fsize);
			board.setOrigin_filename(fname);//원본 파일명
			board.setFilename(filename);//물리적 파일명
			board.setFilesize(fsize);
			
			//[3] 업로드 처리
			try {
				mf.transferTo(new File(upDir, filename));
					log.info("upDir: "+upDir);
				}catch(IOException e) {
				log.error("파일업로드 에러: "+e);
			}
			
			if(board.getOld_filename()!=null) {
				File df = new File(upDir, board.getOld_filename());
				if(df.exists()) {
					boolean b = df.delete();
					log.info("old file delete: "+b);
				}
			}
		}
		
		
		int n = boardService.updateBoard(board);
		
		String msg = (n>0)?"글이 수정되었습니다.":"글 수정을 실패하였습니다.";
		String loc = "/board/list";
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "message";
	}
	
	
	@PostMapping("/delete")
	public String boardDel(Model m, @ModelAttribute BoardVO vo, HttpSession session) {
		
		BoardVO board = this.boardService.selectBoardByBno(vo.getBno());
		m.addAttribute("board", board);
		
		//댓글 삭제
		this.replyService.deleteAllReply(vo.getBno());
		
		//db에서 글 삭제
		int n = this.boardService.deleteBoard(vo.getBno());
		
		String upDir = session.getServletContext().getRealPath("/resources/board_upload");
		//서버에 첨부한 파일이 있다면 서버에서 삭제 처리
		if(n>0 && board.getFilename()!=null) {
			File f = new File(upDir, board.getFilename());
			if(f.exists()) {
				boolean b = f.delete();
				log.info("파일 삭제 여부: "+b);
			}
		}
		
		String msg = (n>0)?"글이 삭제되었습니다":"글 삭제를 실패하였습니다";
		String loc = "list";
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "message";
	}
	
	@PostMapping(value="/fileDown", produces="application/octet-stream")
	@ResponseBody
	public ResponseEntity<org.springframework.core.io.Resource> fileDownload(
			HttpServletRequest req,
			@RequestHeader("User-Agent") String userAgent,
			@RequestParam("fname") String fname, @RequestParam("origin_fname") String origin_fname) {
		log.info("fname=="+fname);
		log.info("origin_fname=="+origin_fname);
		
		//1.업로드된 디렉토리의 절대경로 얻기
		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/board_upload");
		
		String filePath = upDir+File.separator+fname;
		log.info("filePath: "+filePath);
		org.springframework.core.io.Resource resource = new FileSystemResource(filePath);
		
		//2. FileSystemResource 객체 생성해서 파일의 절대경로 정보를 넘긴다. => 알아서 파일과 스트림 연결해서 다운로드 함
		if(!resource.exists()) {
			//해당 파일이 없다면
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);//404
		}
		//2_2. 브라우저별 인코딩 처리
		String downName=null;
		boolean checkIE=(userAgent.indexOf("MSIE")>-1 || userAgent.indexOf("Trident")>-1);//ie인 경우 TRUE값 할당함
		try {
		if(checkIE) {
			//IE인 경우
			downName=URLEncoder.encode(origin_fname, "UTF-8").replaceAll("\\+", " ");
		}else {
			//그외 브라우저인 경우
			origin_fname = origin_fname.replace(",", "");//크롬은 파일명에 콤마(,)가 있으면 다운로드 되지 않음
			downName = new String(origin_fname.getBytes("UTF-8"),"ISO-8859-1");
		}
		}catch(UnsupportedEncodingException e) {
			log.error("파일 다운로드 중 에러: "+e);
		}
		//3. HttpHeader 통해 헤더 정보 설정해서 ResponseEntity에 담아 반환함
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+downName);
		
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);//200
	}

}
