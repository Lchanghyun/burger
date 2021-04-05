package com.one.burger.service;

import com.one.burger.entity.Member;

public interface MemberService {
	//회원가입 메서드
	public void register(Member member) throws Exception;
}
