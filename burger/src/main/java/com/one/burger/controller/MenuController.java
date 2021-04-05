package com.one.burger.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchVO;
import com.one.burger.entity.MenuPhotoVO;
import com.one.burger.service.MenuService;
//import com.one.burger.util.UploadFileUtils;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/superlist")
	public void superList(Model model) throws Exception{
		log.info("superList()");
		List<MenuPhotoVO> allList = menuService.superlist();
		model.addAttribute("allList",allList);
	}
	@GetMapping("/categorylist")
	public String categoryList(Model model, String category) throws Exception{
		log.info("categoryList()");
		List<MenuPhotoVO> allList = menuService.categoryList(category);
		model.addAttribute("allList",allList);
		model.addAttribute("mCategory", category);
		return "menu/superlist";
	}
	
	@GetMapping("/branchlist")
	public void branchList(Model model, String my, String category, HttpSession session) throws Exception{
		log.info("branchList()");
		session.setAttribute("branch_no", 1);
		int branch_no = (Integer)session.getAttribute("branch_no");
		
		List<MenuPhotoVO> allList;
		
		if(my == null) { // 전체메뉴
			if(category == null) { //전체 카테고리
				allList = menuService.superlist();
			}
			else { // 카테고리 존재
				allList = menuService.categoryList(category);
				model.addAttribute("mCategory", category);
			}
			model.addAttribute("allList",allList);
			model.addAttribute("my",false);
		}
		else { // my 지점 메뉴목록
			if(category != null) {
				model.addAttribute("mCategory", category);
			}
			model.addAttribute("my",true);
		}
		List<MenuBranchVO> branchList = menuService.branchList(branch_no, category);
		model.addAttribute("branchList",branchList);
	}
	
	@PostMapping("/menuAdd")
	public ResponseEntity<String> menuAdd(Integer menu_no, HttpSession session) throws Exception{
		log.info("menuAdd()");
		session.setAttribute("branch_no", 1);
		int branch_no = (Integer)session.getAttribute("branch_no");
		menuService.menuAdd(menu_no, branch_no);
		return new ResponseEntity<String>("add",HttpStatus.OK);
	}
	
	@GetMapping("/modify")
	public void menuModify(Integer menu_no, Model model) throws Exception{
		log.info("menu-modifyGet()");
		MenuPhotoVO vo = menuService.read(menu_no);
		model.addAttribute("menu", vo);
	}
	
	@PostMapping("/modify")
	public String menuModifyPost(Menu menu, Model model) throws Exception{
		log.info("menu-modifyPost()");
		menuService.modify(menu);
		List<MenuPhotoVO> list = menuService.superlist();
		model.addAttribute("list",list);
		return "redirect:superlist";
	}
	
	@PostMapping("/remove")
	@ResponseBody
	public String menuRemove(Integer menu_no) throws Exception{
		log.info("menuRemove()");
		menuService.remove(menu_no);
		return "remove";
	}
	@PostMapping("/removeBranchMenu")
	@ResponseBody
	public String removeBranchMenu(Integer menu_no, String branch_no) throws Exception{
		log.info("removeBranchMenu()");
		menuService.removeBranchMenu(Integer.parseInt(branch_no), menu_no);
		return "remove";
	}
	
	@PostMapping("/soldoutAndResale")
	@ResponseBody
	public String soldoutAndResale(Integer branch_no, Integer menu_no, String menu_status) throws Exception{
		log.info("soldoutAndResale()");
		menuService.soldoutAndResale(branch_no, menu_no, menu_status);
		return "success";
	}
	
	@GetMapping("/register")
	public void menuInsert() {
		log.info("menu-registerGet()");
	}
	
	@PostMapping("/register")
	public String menuInsertPost(Menu menu, Model model) throws Exception{
		log.info("menu-registerPost()");
		menuService.register(menu);
		log.info("메뉴등록완료");
		return "redirect:superlist";
	}
	
	@PostMapping(value="/thumbUpload", produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> thumbUpload(MultipartFile file) throws Exception{
		log.info("thumbUpload()");
		
		String savedName = UploadFileUtils.makeThumbnail(uploadPath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(savedName, HttpStatus.CREATED);
	}
	
	@GetMapping("/photoShow")
	public ResponseEntity<byte[]> showPhoto(String fileName) throws Exception{
		log.info("파일명: "+fileName);
		File target = new File(uploadPath, fileName);
		
		try {
//			InputStream in;
//			in = new FileInputStream(uploadPath+fileName);
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			BufferedImage img = ImageIO.read(target);
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(img, formatName.toUpperCase(), os);
			byte[] result = os.toByteArray();
			return new ResponseEntity<byte[]>(result, HttpStatus.CREATED);
//			byte[] data = FileUtils.readFileToByteArray(target);
//			return ResponseEntity.ok().header("Content-Type", "application/octet-stream")
//				.header("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(fileName,"UTF-8")+"\"")
//				.header("Content-Length", String.valueOf(target.length()))
//				.header("Content-Encoding", "UTF-8")
//				.body(data);
		}
		catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.notFound().build();
		}
	}
	

}
