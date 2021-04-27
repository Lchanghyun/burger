package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Criteria;
import com.one.burger.entity.Notice;

public interface NoticeService {
	
	//공지사항 작성
	public void notice_write(Notice notice)throws Exception;

	//공지사항 목록
	public List<Notice> notice_list(Criteria cri)throws Exception;
	
	// 공지사항 총 개수
	public int cntNotice()throws Exception;
		
	//시퀀스
	public int notice_seq()throws Exception;
	
	//공지사항 detail
	public Notice notice_detail(Integer notice_no)throws Exception;
		
	//공지사항 수정
	public void notice_edit(Notice notice)throws Exception;
	
	//공지사항 삭제
	public void notice_delete(Integer notice_no)throws Exception;
}
