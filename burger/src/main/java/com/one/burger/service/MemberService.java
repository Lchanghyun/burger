package com.one.burger.service;

import com.one.burger.entity.Member;

public interface MemberService {
	
	//회원가입 처리
	public void memberJoin(Member member) throws Exception;
	
	//로그인 처리
	public boolean memberLogin(Member member) throws Exception;
	
	//find
	public Member find(int member_no) throws Exception;
	public Member find(String member_id) throws Exception;
	
}