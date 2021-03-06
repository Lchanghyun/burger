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
	public List<MenuPhotoVO> searchlist(String menu_name) throws Exception{
		return sqlSession.selectList("menu.searchlist", menu_name);
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
	public boolean checkMenu(String menu_name) throws Exception{
		int menu = sqlSession.selectOne("menu.checkMenu",menu_name);
		return menu > 0;
	}
	public List<MenuBranchVO> branchList(Integer branch_no, String category) throws Exception{
		if(category!=null && category.equals("????????????")) {
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
	public List<MenuBranchVO> branchSearch(Integer branch_no, String key) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("branch_no",branch_no);
		data.put("key", key);
		return sqlSession.selectList("menu.branchSearch", data);
	}
	public void stopModify(int menu_no, String category) throws Exception{
		sqlSession.update("menu.stopModify2", menu_no);
		Map<String, Object> data = new HashMap<>();
		data.put("menu_no", menu_no);
		data.put("category", category);
		sqlSession.update("menu.stopModify1", data);
	}
	public List<Menu> all_list() throws Exception{
		return sqlSession.selectList("menu.all_list");
	}
}
