package com.one.burger.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.Criteria;
import com.one.burger.entity.Notice;
import com.one.burger.entity.PageMaker;
import com.one.burger.service.NoticeService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 글 작성 이동
		@GetMapping("/notice_write")
		public void notice_write() throws Exception {
			log.info("공지사항 작성페이지 이동");
					
		}
	//공지사항 글 작성 데이터 전송
		@PostMapping("/notice_write")
		public String notice_write(Notice notice, HttpSession session) throws Exception {
			log.info("notice_write.jsp 이동");
			int super_no = (int)session.getAttribute("super_no");
			System.out.println(super_no);
			notice.setSuper_no(super_no);
			
			//회원가입 Service
			noticeService.notice_write(notice);
			log.info("공지사항 등록 완료 목록 고고");
			
			return "redirect:notice_list";
			
		}
		
	//공지사항 list 이동
		@GetMapping("/notice_list")
		public String notice_list(Model model, Criteria cri)throws Exception{
			log.info("공지사항 목록페이지 이동");

			model.addAttribute("notice_list", noticeService.notice_list(cri));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(noticeService.cntNotice());
			
			model.addAttribute("pageMaker", pageMaker);
			return "notice/notice_list";
			
		}
		
	//공지사항 detail 이동
		@GetMapping("/notice_detail")
		public void notice_detail(Model model, int notice_no, HttpSession session)throws Exception{
			log.info("공지사항 세부내용 이동");
			Integer branch_no;
			if(session.getAttribute("branch_no") == null) {
				branch_no = null;
			}
			else {
				branch_no = (int)session.getAttribute("branch_no");
			}
			model.addAttribute("sessionBranch", branch_no);
			model.addAttribute("notice_detail", noticeService.notice_detail(notice_no));
			
		}
		
	// 공지사항 수정edit
		@GetMapping("/notice_edit")
		public void notice_edit(Model model, int notice_no)throws Exception{
			log.info("공지사항 수정 이동");
			
			model.addAttribute("editList",noticeService.notice_detail(notice_no));
		}
		
	// 공지사항 수정
		@PostMapping("/notice_edit")
		public String notice_editPost(Notice notice, Model model) throws Exception {
			log.info("공지사항 수정하러 왔습니다");
			noticeService.notice_edit(notice);
			
			model.addAttribute("msg", "수정 완료되었습니당!");
			
			return "redirect:/notice/notice_detail?notice_no="+notice.getNotice_no();
			
		}
		
	 //공지사항 삭제
		@GetMapping("/notice_delete")
		public String notice_delete(int notice_no, Model model)throws Exception{
			
			noticeService.notice_delete(notice_no);
			model.addAttribute("msg", "삭제완료");
			
			return "redirect:/notice/notice_list";
		}
}
