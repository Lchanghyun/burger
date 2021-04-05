package com.one.burger.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchVO;
import com.one.burger.entity.MenuPhoto;
import com.one.burger.entity.MenuPhotoVO;
import com.one.burger.repository.MenuRepository;
//import com.one.burger.util.UploadFileUtils;

@Service
public class MenuServiceImpl implements MenuService{

	@Resource(name="uploadPath")
	String uploadPath;
	
	@Autowired
	private MenuRepository menuRepository;
	
	@Override
	public List<MenuPhotoVO> superlist() throws Exception{
		return menuRepository.superlist();
	}
	@Override
	public MenuPhotoVO read(Integer menu_no) throws Exception{
		return menuRepository.read(menu_no);
	}
	@Override
	public void register(Menu menu) throws Exception {
		MultipartFile file = menu.getFile();
		String savedName = UploadFileUtils.uploadFile(uploadPath,file.getOriginalFilename(),file.getBytes());
		
		int num = menuRepository.getSequence();
		menu.setMenu_no(num);
		menuRepository.register(menu);
		
		MenuPhoto menuPhoto = new MenuPhoto();
		menuPhoto.setMenu_no(num);
		menuPhoto.setUpload_name(file.getOriginalFilename());
		menuPhoto.setSave_name(savedName);
		menuPhoto.setFile_size(file.getSize());
		menuPhoto.setSave_type(file.getContentType());
		menuRepository.registerPhoto(menuPhoto);
	}
	@Override
	public void modify(Menu menu) throws Exception{
		int menu_no = menu.getMenu_no();
		menuRepository.modify(menu);
		if(!menu.getFile().isEmpty()) {
			MultipartFile file = menu.getFile();
			String savedName = UploadFileUtils.uploadFile(uploadPath,file.getOriginalFilename(),file.getBytes());
			MenuPhoto menuPhoto = new MenuPhoto();
			menuPhoto.setMenu_no(menu_no);
			menuPhoto.setUpload_name(file.getOriginalFilename());
			menuPhoto.setSave_name(savedName);
			menuPhoto.setFile_size(file.getSize());
			menuPhoto.setSave_type(file.getContentType());
			menuRepository.modifyPhoto(menuPhoto);
		}
	}
	@Override
	public void remove(Integer menu_no) throws Exception{
		menuRepository.remove(menu_no);
	}
	@Override
	public void removeBranchMenu(Integer branch_no, Integer menu_no) throws Exception{
		menuRepository.removeBranchMenu(branch_no, menu_no);
	}
	@Override
	public List<MenuPhotoVO> categoryList(String category) throws Exception{
		return menuRepository.categoryList(category);
	}
	@Override
	public void menuAdd(Integer menu_no, Integer branch_no) throws Exception{
		menuRepository.menuAdd(menu_no, branch_no);
	}
	@Override
	public List<MenuBranchVO> branchList(Integer branch_no, String category) throws Exception{
		return menuRepository.branchList(branch_no, category);
	}
	@Override
	public void soldoutAndResale(Integer branch_no, Integer menu_no, String menu_status) throws Exception{
		menuRepository.soldoutAndResale(branch_no, menu_no, menu_status);
	}
}
