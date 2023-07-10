package com.smt.service;

import com.smt.model.MbtiVO;
import com.smt.model.MemberVO;

public interface MemberService {

	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String userid) throws Exception;

	// 닉네임 중복 검사
	public int nickCheck(String nick_name) throws Exception;
	
	// 이메일 중복 검사
	public int emailCheck(String email) throws Exception;

	/* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;

    /* 아이디 찾기 */
    public MemberVO id_find(MemberVO findmember) throws Exception;
    
    /*비밀번호 찾기*/
    public int pwd_find(MemberVO findmember) throws Exception;
    public void pwd_update(MemberVO findmember) throws Exception;

    /*회원 정보 수정*/
    public int member_modify_go(MemberVO member) throws Exception;
}