package com.smt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smt.mapper.MemberMapper;
import com.smt.model.MbtiVO;
import com.smt.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	/*회원 가입*/
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	/*아이디 중복 검사*/
	@Override
	public int idCheck(String userid) throws Exception {
		
		return membermapper.idCheck(userid);
	}
	
	/*닉네임 중복 검사*/
	@Override
	public int nickCheck(String nick_name) throws Exception {
		
		return membermapper.nickCheck(nick_name);
	}
	
	/*이메일 중복 검사*/
	@Override
	public int emailCheck(String email) throws Exception {
		
		return membermapper.emailCheck(email);
	}
	
	/* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }
    
    /*아이디 찾기*/
    @Override
    public MemberVO id_find(MemberVO findmember) throws Exception{
    	
    	return membermapper.id_find(findmember);
    }
    
    /*비밀번호 찾기*/
    @Override
    public int pwd_find(MemberVO findmember) throws Exception{
    	
    	return membermapper.pwd_find(findmember);
    }
    
    @Override
    public void pwd_update(MemberVO findmember) throws Exception{
    	
    	membermapper.pwd_update(findmember);
    }
    
    /*회원 정보 수정*/
    @Override
    public int member_modify_go(MemberVO member) throws Exception{
    	
    	return membermapper.member_modify_go(member);
    }
}
