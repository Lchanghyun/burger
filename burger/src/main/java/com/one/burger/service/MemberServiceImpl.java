package com.one.burger.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Member;
import com.one.burger.repository.MemberRepository;

import lombok.extern.java.Log;

@Log
@Service
public class MemberServiceImpl implements MemberService {

		@Autowired
		private MemberRepository memberRepository;
		

		@Override
		public void memberJoin(Member member) throws Exception {
			
			//Member 객체의 member_no를 채워주려는 거야(member_seq값으로)
//			int member_no =memberRepository.member_seq();
//			member.setMember_no(member_no);
			member.setMember_no(memberRepository.member_seq());
			memberRepository.register(member);
		}
		
		//회원 로그인
		@Override
		public boolean memberLogin(Member member) throws Exception {
			boolean result = memberRepository.memberLogin(member).size() > 0 ;
			log.info("result : " + result);
			
			return result;
		}

		@Override
		public Member find(int member_no) throws Exception {
			return memberRepository.find(member_no);
			
		}
		
		@Override
		public Member find(String member_id) throws Exception {
			return memberRepository.find2(member_id);
			
		}

}