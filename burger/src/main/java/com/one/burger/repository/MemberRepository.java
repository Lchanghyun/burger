package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Member;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입 db로
	public void register(Member member) throws Exception {
		sqlSession.insert("member.member_join", member);
	}
	//회원 시퀀스
	public int member_seq() throws Exception {
		return sqlSession.selectOne("member.member_seq");
	}
	
	//로그인
	public List<Member> memberLogin(Member member) {
		return sqlSession.selectList("member.login", member);
		
	}

	public Member find(int member_no) {
		return sqlSession.selectOne("member.find", member_no);		
	}

	public Member find2(String member_id) {
		return sqlSession.selectOne("member.find2", member_id);
		
	}

	
}
