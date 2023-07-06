package com.smt.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smt.model.MemberVO;
import com.smt.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {

		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		log.info("join 진입");
		/* System.out.println("member=="+member.getUserid()); */

		String exPwd = "";					// 인코딩 전 비밀번호
        String encodePwd = "";				// 인코딩 후 비밀번호
        
        exPwd = member.getUserpwd();            // 비밀번호 데이터 얻음
        encodePwd = pwEncoder.encode(exPwd);	// 비밀번호 인코딩
        member.setUserpwd(encodePwd);			// 인코딩된 비밀번호 member객체에 다시 저장
        
        /* 회원가입 쿼리 실행 */
        memberService.memberJoin(member);
        
		return "index";

	}
	
	// 아이디 중복 검사
		@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String userIdChkPOST(String userid) throws Exception{
			
			//log.info("userIdChk() 진입");
			int result = memberService.idCheck(userid);
			
			//log.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}	
		} // userIdChkPOST() 종료	
		
		/* 닉네임 중복 검사*/
		@RequestMapping(value = "/userNickChk", method = RequestMethod.POST)
		@ResponseBody
		public String userNickChkPOST(String nick_name) throws Exception{
			
			//log.info("userIdChk() 진입");
			int result = memberService.nickCheck(nick_name);
			
			//log.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}	
		} // userNickChkPOST() 종료
		
		
		/* 이메일 중복 검사*/
		@RequestMapping(value = "/userEmailChk", method = RequestMethod.POST)
		@ResponseBody
		public String userEmailChkPOST(String email) throws Exception{
			
			//log.info("userIdChk() 진입");
			int result = memberService.emailCheck(email);
			
			//log.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}	
		} // userEmailChkPOST() 종료
		
		/* 이메일 인증 */
	    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String mailCheckGET(String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	    	//log.info("이메일 데이터 전송 확인");
	    	//log.info("인증번호 : " + email);
	        
	    	/* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        log.info("인증번호 " + checkNum);	
	        
	        /* 이메일 보내기 */
	        String setFrom = "project2323@naver.com";
	        String toMail = email;
	        String title = "Say Mbti Type 회원가입 인증 이메일 입니다.";
	        String content = 
	                "Say Mbti Type 홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 <b>" + checkNum + "</b>입니다." + 
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
	    }//mailCheckGET 종료
}
