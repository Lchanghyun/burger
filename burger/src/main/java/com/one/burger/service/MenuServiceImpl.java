package com.one.burger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuPhoto;
import com.one.burger.repository.MenuRepository;
import com.one.burger.util.UploadFileUtils;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuRepository menuRepository;
	
	@Override
	public void register(Menu menu) throws Exception {
		MultipartFile file = menu.getFile();
		int num = menuRepository.getSequence();
		menu.setMenu_no(num);
		menuRepository.register(menu);
		
		MenuPhoto menuPhoto = new MenuPhoto();
		menuPhoto.setMenu_no(num);
		menuPhoto.setUpload_name(file.getOriginalFilename());
//		String savedName = UploadFileUtils.savedName(file.getOriginalFilename());
//		menuPhoto.setSave_name(savedName);
		menuPhoto.setFile_size(file.getSize());
		menuPhoto.setSave_type(file.getContentType());
		menuRepository.registerPhoto(menuPhoto);
	}
}
