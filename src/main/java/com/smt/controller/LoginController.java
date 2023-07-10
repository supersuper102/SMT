package com.smt.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smt.model.MemberVO;
import com.smt.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	/*
	 * @GetMapping("/id_find") public String idFindForm() { return "member/id_find";
	 * }
	 */

	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, HttpServletResponse response,
			MemberVO member,
			RedirectAttributes rttr,
			@RequestParam(defaultValue="off")String saveId) throws Exception {
		System.out.println("saveId:"+saveId);
		// System.out.println("login 메서드 진입");
		// System.out.println("전달된 데이터 : " + member);

		HttpSession session = request.getSession();
		String exPwd = "";
		String encodePwd = "";
		MemberVO lvo = memberService.memberLogin(member);

		if (lvo != null) { // 일치하는 아이디 존재시
			exPwd = member.getUserpwd(); // 사용자가 제출한 비밀번호
			encodePwd = lvo.getUserpwd(); // 데이터베이스에 저장한 인코딩된 비밀번호

			if (true == pwEncoder.matches(exPwd, encodePwd)) { // 비밀번호 일치여부 판단
				lvo.setUserpwd("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", lvo);	// session에 사용자의 정보 저장
                Cookie ck=new Cookie("userid",lvo.getUserid());
                if(saveId.equals("on")) {
                	ck.setMaxAge(7*24*60*60);
                }else {
                	ck.setMaxAge(0);
                }
                ck.setPath("/");
                response.addCookie(ck);
                return "/index";        // 메인페이지 이동
               
			} else {
				//log.info("일치하지 않는 비밀번호");
				rttr.addFlashAttribute("result", 0);            
                return "redirect:login";    // 로그인 페이지로 이동
            }
		} else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			//log.info("존재하지 않는 아이디");
			rttr.addFlashAttribute("result", 0);
			return "redirect:login"; // 로그인 페이지로 이동

		}
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {
		log.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "/index";

	}
	
	/* 이메일 인증 */
    @RequestMapping(value="/Findmail", method=RequestMethod.GET)
    @ResponseBody
    public String Findmail(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
    	//log.info("이메일 데이터 전송 확인");
    	//log.info("인증번호 : " + email);
        
    	/* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        //log.info("인증번호 " + checkNum);	
        
        /* 이메일 보내기 */
        String setFrom = "project2323@naver.com";
        String toMail = email;
        String title = "Say Mbti Type 아이디/비밀번호 찾기 이메일 입니다.";
        String content = 
                "Say Mbti Type 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "아이디/비밀번호 찾기 인증 번호는 <b>" + checkNum + "</b>입니다." + 
                "<br><br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주십시오.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum); //뷰로 반환 시 String 타입만 가능 (형변환)
        
        return num;
    }//Findmail 종료
	
    /* 아이디 찾기 */
    @RequestMapping(value = "/id_find", method = RequestMethod.GET)
    public String IdFind(HttpServletRequest request, Model model,
            MemberVO findmember) {
        
        
        return "member/id_find";
    }
    
    /* 아이디 찾기 결과 */
	@RequestMapping(value="/id_find_res")
	public String IdFindResult(HttpServletRequest request, MemberVO findmember, Model model,
			@RequestParam(required = false, value="name")String name,
			@RequestParam(required = false, value="email")String email) throws Exception{
		try {
			findmember.setName(name);
			findmember.setEmail(email);
			MemberVO id_find=memberService.id_find(findmember);
			
			model.addAttribute("findmember", id_find);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "member/id_find_res";
	}
     
	/* 비밀번호 찾기 */
    @RequestMapping(value = "/pwd_find", method = RequestMethod.GET)
    public String PwdFind(HttpServletRequest request, Model model,
            MemberVO member) {
        
        
        return "member/pwd_find";
    }
    
    /* 비밀번호 찾기 결과*/
	@RequestMapping(value = "/pwd_find_res", method = RequestMethod.POST)
    public String PwdFindResult(HttpServletRequest request, Model model,
    		 @RequestParam(required = true, value = "userid") String userid, 
    		 @RequestParam(required = true, value = "name") String name, 
    		 @RequestParam(required = true, value = "email") String email, 
    		 MemberVO findmember) {
		try {
			findmember.setUserid(userid);
			findmember.setName(name);
			findmember.setEmail(email);
			int pwd_find = memberService.pwd_find(findmember);
			
			if(pwd_find == 0) {
				 model.addAttribute("result", 0);
			     return "/member/pwd_find";
			}
			//임시 비밀번호 생성
			String newPwd = "";
			for(int i = 0; i < 8; i++) {
				newPwd += (char)((Math.random()*26)+97);
			}
			String enPwd = pwEncoder.encode(newPwd);
			findmember.setUserpwd(enPwd);
			
			memberService.pwd_update(findmember);
			
			model.addAttribute("newPwd",newPwd);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생되었습니다.");
		}
		
		return "member/pwd_find_res";
	}
	
	/* 마이페이지 이동 */
	@RequestMapping(value = "/mypage")
	public String mypage(HttpServletRequest request,Model model, HttpSession session){
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		
		
		return "/member/mypage";
	}
    
}
