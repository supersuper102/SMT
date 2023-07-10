package com.smt.mapper;

import com.smt.model.MbtiVO;
import com.smt.model.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member);
	
	//아이디 중복 검사
	public int idCheck(String userid);
	
	//닉네임 중복 검사
	public int nickCheck(String nick_name);
	
	//이메일 중복 검사
	public int emailCheck(String email);
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member);
 
	/*아이디 찾기*/
    public MemberVO id_find(MemberVO findmember);
    
    /*비밀번호 찾기*/
    public int pwd_find(MemberVO findmember);
    public void pwd_update(MemberVO findmember);
    
    /*회원정보 수정*/
    public int member_modify_go(MemberVO member);
}
