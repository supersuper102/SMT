package com.smt.service;

import com.smt.model.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String userid) throws Exception;

	/* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;
}