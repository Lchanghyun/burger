package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchVO;
import com.one.burger.entity.MenuPhotoVO;

public interface MenuService {
	public void register(Menu menu) throws Exception;
	public List<MenuPhotoVO> superlist() throws Exception;
	public MenuPhotoVO read(Integer menu_no) throws Exception;
	public void modify(Menu menu) throws Exception;
	public void remove(Integer menu_no) throws Exception;
	public void removeBranchMenu(Integer branch_no, Integer menu_no) throws Exception;
	public List<MenuPhotoVO> categoryList(String category) throws Exception;
	public void menuAdd(Integer menu_no, Integer branch_no) throws Exception;
	public List<MenuBranchVO> branchList(Integer branch_no, String category) throws Exception;
	public void soldoutAndResale(Integer branch_no, Integer menu_no, String menu_status) throws Exception;
}
