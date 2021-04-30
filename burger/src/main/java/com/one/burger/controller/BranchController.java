package com.one.burger.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.Branch;
import com.one.burger.entity.Login;
import com.one.burger.entity.Supervisor;
import com.one.burger.service.BranchService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/join") //공용주소
public class BranchController {
	
	@Autowired
	private BranchService branchService;
	
	//지점관리자 가입 페이지 이동
	@GetMapping("/branch_join")
	public void branchJoin() throws Exception {
		log.info("지점관리자 가입 페이지 이동");
		
	}
		
	//지점관리자 가입 데이터 전송 Post
	@PostMapping("/branch_join")
	public String branchJoinPost(@ModelAttribute Branch branch, HttpSession session) throws Exception {
		log.info("지점관리자 가입 페이지로 이동");
		int super_no=0;
		if(session.getAttribute("supervisor_no") !=null) {
			super_no = (int)session.getAttribute("supervisor_no");
		}
		branch.setSuper_no(super_no);
		//지점가입 Service
		branchService.branchJoin(branch);
			
		log.info("지점관리자 가입완료");
			
		return "redirect:join_success_auth";
			
		}
	
	//지점 관리자 가입 후 가입성공 페이지
	@GetMapping("/join_success_auth")
	public void join_success_auth() throws Exception {
		log.info("지점 관리자 가입완료!");
	}
	
	//지점 관리자 로그인 페이지로 이동
	@GetMapping("/login_auth")
	public void login_auth() throws Exception {
		log.info("지점 관리자 / 본사 관리자 로그인 페이지 이동");
	}
	
	//로그인 데이터 전송
	@PostMapping("/login_auth")
	public String login(@ModelAttribute Login login, HttpSession session, Branch branch, Supervisor supervisor) throws Exception {
		boolean result;
		if(login.getGubun().equals("s")) {
			result = branchService.superLogin(login.getId(),login.getPw()); //본사로그인
		}
		else {
			result = branchService.branchLogin(login.getId(),login.getPw());
		}
		
		if(result) {
			session.setAttribute("branch", branch.getBranch_no());
			session.setAttribute("supervisor", supervisor.getSuper_no());
			return "redirect:/notice/notice_list";
		}
		else {
		
		return "redirect:login?error";
		}
	}
	
	//로그아웃
	@GetMapping("/logout_auth")
	public String logout_auth(HttpSession session) throws Exception {
		log.info("지점 관리자/본사 관리자 로그아웃");
		
		session.invalidate();
		
		return "redirect:/";
	}
}
