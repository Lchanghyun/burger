package com.one.burger.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.burger.entity.Branch;
import com.one.burger.entity.Member;
import com.one.burger.entity.Supervisor;
import com.one.burger.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/join") //공용주소
public class MemberController {

	@Autowired
	private MemberService memberService;
		
	//회원가입 페이지 이동
	@GetMapping("/member_join")
	public void memberJoin() throws Exception {
		log.info("회원가입페이지 이동");
				
	}
	
	//회원가입 Post 서버에 데이터전송
	@PostMapping("/member_join")
	public String memberJoinPost(@ModelAttribute Member member) throws Exception {
		log.info("member_join 이동");
		
		//회원가입 Service
		memberService.memberJoin(member);
		log.info("회원 등록 완료 다음페이지고고");
		
		return "redirect:join_success";
		
	}
	
	//회원가입 후 회원가입 성공페이지
	@GetMapping("/join_success")
	public void join_success() throws Exception {
		log.info("회원가입 성공!");
		
	}
	
	//지점관리자 가입 페이지 이동
	
	//로그인 페이지로 이동
	@GetMapping("/login_member")
	public void login() {
		log.info("로그인 페이지 이동");
		
	}
	
	//로그인 데이터 전송
	@PostMapping("/login_member")
	public String login(@ModelAttribute Member member, HttpSession session) throws Exception {
		boolean result = memberService.memberLogin(member);
		
		if(result) {
			Member loginMember = memberService.find(member.getMember_id());
			session.setAttribute("member_no", loginMember.getMember_no());
			
			System.out.println(session.getAttribute("check"));
			return "redirect:/"; //최상위 경로로 이동
		}
		else {
			return "redirect:login?error"; //로그인 실패
		}
	}

	//로그아웃
	@GetMapping("/logout_member")
	public String logout_member(HttpSession session) throws Exception{
		log.info("회원 로그아웃");
		
		session.invalidate();
		
		return "redirect:/";
	}

	//아이디 중복체크
	@RequestMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String member_id) throws Exception {
		Member member = memberService.find(member_id);
		if(member == null) {
			return "NNNNY";
		}
		else {
			return "NNNNN";
		}
	}
}




