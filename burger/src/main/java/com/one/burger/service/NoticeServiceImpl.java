package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Criteria;
import com.one.burger.entity.Notice;
import com.one.burger.repository.NoticeRepository;

import lombok.extern.java.Log;

@Log
@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeRepository noticeRepository;
	
	@Override
	public void notice_write(Notice notice) throws Exception {
		noticeRepository.notice_write(notice);
	}

	@Override
	public List<Notice> notice_list(Criteria cri) throws Exception {
		return noticeRepository.notice_list(cri);
		
	}
	

	@Override
	public int notice_seq() throws Exception {
		return noticeRepository.notice_seq();
	}

	@Override
	public Notice notice_detail(Integer notice_no) throws Exception {
		return noticeRepository.notice_detail(notice_no);
	}

	@Override
	public void notice_edit(Notice notice) throws Exception {
		noticeRepository.notice_edit(notice);
		
	}

	@Override
	public void notice_delete(Integer notice_no) throws Exception {
		noticeRepository.notice_delete(notice_no);
		
	}

	@Override
	public int cntNotice() throws Exception {
		return noticeRepository.cntNotice();
	}

}
