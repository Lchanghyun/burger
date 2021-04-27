package com.one.burger.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchVO;
import com.one.burger.entity.MenuPhotoVO;
import com.one.burger.service.MenuService;
import com.one.burger.util.UploadFileUtils;

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
	public void superList(Model model, String category, HttpSession session) throws Exception{
		log.info("superList()");
		String tempCategory = (String)session.getAttribute("tempCategory");
		List<MenuPhotoVO> allList;
		if(category == null) {
			if((tempCategory != null&&tempCategory.equals("")) || tempCategory == null) {
				allList = menuService.superlist();
			}
			else{
				allList = menuService.categoryList(tempCategory);
				category = tempCategory;
			}
		}
		else {
			allList = menuService.categoryList(category);
		}
		session.removeAttribute("tempCategory");
		model.addAttribute("allList",allList);
		model.addAttribute("mCategory", category);
	}
	@PostMapping("/superlist")
	public void superListSearch(Model model, String keyword) throws Exception{
		log.info("superListSearch()");
		List<MenuPhotoVO> allList;
		if(keyword.equals("")) {
			allList = menuService.superlist();
		}
		else {
			allList = menuService.searchlist(keyword);
		}
		model.addAttribute("allList", allList);
		model.addAttribute("key",keyword);
	}
	
	@GetMapping("/branchlist")
	public void branchList(Model model, String my, String category, HttpSession session) throws Exception{
		log.info("branchList()");
		session.setAttribute("branch_no", 1);
		int branch_no = (Integer)session.getAttribute("branch_no");
		String branch_name = menuService.getBranchName(branch_no);
		
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
		model.addAttribute("branch_name",branch_name);
	}
	@PostMapping("/branchlist")
	public void branchListSearch(Model model, String my, String keyword, HttpSession session) throws Exception{
		log.info("branchListSearch()");
		int branch_no = (Integer)session.getAttribute("branch_no");
		String branch_name = menuService.getBranchName(branch_no);
		String category = null;
		List<MenuPhotoVO> allList;
		List<MenuBranchVO> branchList;
		if(my == null) { // 전체메뉴
			if(keyword.equals("")) {
				allList = menuService.superlist();
			}
			else {
				allList = menuService.searchlist(keyword);
			}
			model.addAttribute("allList",allList);
			model.addAttribute("my",false);
		}
		else { // my 지점 메뉴목록
			model.addAttribute("my",true);
		}
		if(keyword.equals("")) {
			branchList = menuService.branchList(branch_no, category);
		}
		else {
			branchList = menuService.branchSearch(branch_no, keyword);
		}
		model.addAttribute("branchList",branchList);
		model.addAttribute("branch_name",branch_name);
		model.addAttribute("key",keyword);
	}
	
	@PostMapping("/menuAdd")
	public ResponseEntity<String> menuAdd(Integer menu_no, HttpSession session) throws Exception{
		log.info("menuAdd()");
		session.setAttribute("branch_no", 1);
		int branch_no = (Integer)session.getAttribute("branch_no");
		menuService.menuAdd(menu_no, branch_no);
		return new ResponseEntity<String>("add",HttpStatus.OK);
	}
	
	@PostMapping("/checkMenu")
	@ResponseBody
	public String checkMenu(String menu_name) throws Exception{
		log.info("checkMenu()");
		boolean check = menuService.checkMenu(menu_name);
		String result = check ? "o" : "x";
		return result;
	}
	@PostMapping("/stopModify")
	@ResponseBody
	public String stopModify(int menu_no, String category) throws Exception{
		log.info("stopModify()");
		menuService.stopModify(menu_no, category);
		return "success";
	}
	
	@PostMapping("/modifyTemp")
	public String modifyTemp(Integer menu_no, String category, RedirectAttributes redirectAttributes) throws Exception{
		log.info("modifyTemp()");
		MenuPhotoVO vo = menuService.read(menu_no);
		redirectAttributes.addFlashAttribute("menu", vo);
		redirectAttributes.addFlashAttribute("tempcategory", category);
		return "redirect:modify";
	}
	@GetMapping("/modify")
	public void menuModify() throws Exception{
		log.info("menu-modifyGet()");
	}
	
	@PostMapping("/modify")
	public String menuModifyPost(Menu menu, String tempcategory, Model model, HttpSession session) throws Exception{
		log.info("menu-modifyPost()");
		menuService.modify(menu);
		session.setAttribute("tempCategory", tempcategory);
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
	public String removeBranchMenu(Integer menu_no, String menu_status, HttpSession session) throws Exception{
		log.info("removeBranchMenu()");
		int branch_no = (int)session.getAttribute("branch_no");
		menuService.removeBranchMenu(branch_no, menu_no, menu_status);
		return "ok";
	}
	
	@PostMapping("/soldoutAndResale")
	@ResponseBody
	public String soldoutAndResale(Integer menu_no, String menu_status, HttpSession session) throws Exception{
		log.info("soldoutAndResale()");
		int branch_no = (int)session.getAttribute("branch_no");
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
		log.info("showPhoto()");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			in = new FileInputStream(uploadPath+fileName);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" +
					new String(fileName.getBytes("UTF-8"), 
							"ISO-8859-1") + "\"");
			entity = new ResponseEntity<byte[]>(
					IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		finally {
			in.close();
		}
		return entity;
	}

}
