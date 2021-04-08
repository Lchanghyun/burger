package com.one.burger.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchVO;
import com.one.burger.entity.MenuPhoto;
import com.one.burger.entity.MenuPhotoVO;

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
	public List<MenuPhotoVO> superlist() throws Exception{
		return sqlSession.selectList("menu.superlist");
	}
	public MenuPhotoVO read(Integer menu_no) throws Exception{
		return sqlSession.selectOne("menu.read", menu_no);
	}
	public void modify(Menu menu) throws Exception{
		sqlSession.update("menu.modify", menu);
	}
	public void modifyPhoto(MenuPhoto menuPhoto) throws Exception{
		sqlSession.update("menu.modifyPhoto", menuPhoto);
	}
	public void remove(Integer menu_no) throws Exception{
		sqlSession.update("menu.remove", menu_no);
		sqlSession.update("menu.stopmenu", menu_no);
	}
	public void removeBranchMenu(Integer branch_no, Integer menu_no, String menu_status) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("branch_no", branch_no);
		data.put("menu_no", menu_no);
		data.put("menu_status", menu_status);
		sqlSession.update("menu.removeBranchMenu", data);
	}
	public List<MenuPhotoVO> categoryList(String category) throws Exception{
		return sqlSession.selectList("menu.categorySearch", category);
	}
	public void menuAdd(Integer menu_no, Integer branch_no) throws Exception{
		Map<String,Object> data = new HashMap<>();
		data.put("menu_no",menu_no);
		data.put("branch_no", branch_no);
		data.put("menu_status",'0');
		sqlSession.insert("menu.menuAdd", data);
	}
	public List<MenuBranchVO> branchList(Integer branch_no, String category) throws Exception{
		if(category!=null && category.equals("판매중지")) {
			return sqlSession.selectList("menu.branchstoplist", branch_no);
		}
		Map<String, Object> data = new HashMap<>();
		data.put("branch_no", branch_no);
		data.put("category", category);
		return sqlSession.selectList("menu.branchlist", data);
	}
	public void soldoutAndResale(Integer branch_no, Integer menu_no, String menu_status) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("branch_no", branch_no);
		data.put("menu_no", menu_no);
		data.put("menu_status", menu_status);
		sqlSession.delete("menu.soldoutAndResale", data);
	}
	public String getBranchName(Integer branch_no) throws Exception{
		return sqlSession.selectOne("today.getBranchName", branch_no);
	}
}
