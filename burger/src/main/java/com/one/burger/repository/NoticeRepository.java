package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Criteria;
import com.one.burger.entity.Notice;

@Repository
public class NoticeRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void notice_write(Notice notice) {
		sqlSession.insert("notice.notice_write", notice);
	}

	public List<Notice> notice_list(Criteria cri) {
		return sqlSession.selectList("notice.listPage", cri);
	}
	
	public int cntNotice() {
		return sqlSession.selectOne("notice.cntNotice");
	}
	
	public int notice_seq() {
		return sqlSession.selectOne("notice.notice_seq");
		
	}

	public Notice notice_detail(int notice_no) {
		return sqlSession.selectOne("notice.notice_detail", notice_no);
	}

	public void notice_edit(Notice notice) {
		
		sqlSession.update("notice.notice_edit", notice);
	}

	public void notice_delete(Integer notice_no) {
		
		sqlSession.update("notice.notice_delete", notice_no);
	}

}
