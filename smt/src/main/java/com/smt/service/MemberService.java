package com.smt.service;

import com.smt.model.MemberVO;

public interface MemberService {

	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
}