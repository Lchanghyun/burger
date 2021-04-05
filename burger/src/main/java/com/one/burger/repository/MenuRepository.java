package com.one.burger.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuPhoto;

@Repository
public class MenuRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public void register(Menu menu) throws Exception{
		sqlSession.insert("menu.register", menu);
	}
	public void registerPhoto(MenuPhoto menuPhoto) throws Exception{
		sqlSession.insert("menu.registerPhoto", menuPhoto);
	}
	public int getSequence() throws Exception{
		return sqlSession.selectOne("menu.getSequence");
	}
}
