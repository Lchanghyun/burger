package com.one.burger.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.one.burger.entity.MenuBranchMenuGoodsVo;
import com.one.burger.service.ChartService;
import com.one.burger.service.MenuService;
import com.one.burger.entity.BranchTotalSales;
import com.one.burger.entity.SalesSuperTotal;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/supervisorChart")
	public void getSupervisorChart(Model model) throws Exception {
		log.info("getSupervisorChart()");
		
		SimpleDateFormat format = new SimpleDateFormat("YYYY/MM");
		Date date = new Date();
		String sysdate = format.format(date);
		String year = sysdate.split("/")[0];
		
		model.addAttribute("sysdate", sysdate);
		model.addAttribute("year", year);
		model.addAttribute("menu_list", menuService.all_list());
		model.addAttribute("menu_sales", chartService.menu_sales(sysdate));
		
		Calendar c = Calendar.getInstance();
		int Ayear = c.get(Calendar.YEAR);
		int Amonth = c.get(Calendar.MONTH)+1;
		String now;
		String prev;
		if(Amonth<10) {
			now = Ayear+"/0"+Amonth;
			if(Amonth==1) {
				prev = (Ayear-1)+"/12";
			}
			else {
				prev = Ayear+"/0"+(Amonth-1);
			}
		}
		else {
			now = Ayear+"/"+Amonth;
			if(Amonth==10) {
				prev = Ayear+"/0"+(Amonth-1);
			}
			else {
				prev = Ayear+"/"+(Amonth-1);
			}
		}
		List<SalesSuperTotal> list = chartService.getSalesTotal(now);
		List<SalesSuperTotal> prevlist = chartService.getSalesTotal(prev);
		model.addAttribute("totalchartList",list);
		model.addAttribute("prevList",prevlist);
		model.addAttribute("length",list.size());
		model.addAttribute("nowyear",now.substring(0, 4));
		model.addAttribute("nowmonth",now.substring(5));
		model.addAttribute("prevyear",prev.substring(0,4));
		model.addAttribute("prevmonth",prev.substring(5));
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/monthtotalbranchChart")
	public ResponseEntity<JSONObject> superMonthChartPost(String year, String month, Model model) throws Exception{
		log.info("superMonthChartPost()");
		String choice = year+"/"+month;
		String prev;
		if(month.equals("01")) {
			prev = Integer.parseInt(year)-1 + "/12";
		}
		else {
			if(Integer.parseInt(month)<11) {
				prev = year + "/0"+ (Integer.parseInt(month)-1);
			}
			else {
				prev = year + "/"+ (Integer.parseInt(month)-1);
			}
		}
		List<SalesSuperTotal> list = chartService.getSalesTotal(choice);
		List<SalesSuperTotal> prevlist = chartService.getSalesTotal(prev);
		JSONObject obj = new JSONObject();
		obj.put("totalchartList",list);
		obj.put("prevList",prevlist);
		obj.put("length",list.size());
		obj.put("nowyear",year);
		obj.put("nowmonth",month);
		obj.put("prevyear",prev.substring(0,4));
		obj.put("prevmonth",prev.substring(5));
		return new ResponseEntity<JSONObject>(obj, HttpStatus.CREATED);
	}
		
	@PostMapping("/menuSales")
	@ResponseBody
	public List<MenuBranchMenuGoodsVo> PostMenuSales(String year, String month) throws Exception{
		String date =year+month;
		
		return chartService.menu_sales(date);
	}
	
	@GetMapping("/branchChart")
	public void getBranchChart(Model model, HttpSession session) throws Exception{
		log.info("getBranchChart()");

		
		int branch_no = (int) session.getAttribute("branch_no");
		SimpleDateFormat format = new SimpleDateFormat("YYYY/MM");
		Date date = new Date();
		String sysdate = format.format(date);
		String year = sysdate.split("/")[0];
		
		Map<String, Object> param = new HashMap<>();
		param.put("branch_no", branch_no);
		param.put("year", year);
		
		List<BranchTotalSales> list = chartService.total_sales(param);
		model.addAttribute("Tyear",year);
		model.addAttribute("Totalsales",list);

		// 지점 메뉴별 매출
		model.addAttribute("branch_menu_name", chartService.Bm_nameList(branch_no));
		model.addAttribute("branch_menu_sales", chartService.branchMenuChart(branch_no, sysdate));

	}
	
	@PostMapping("/totalYear")
	@ResponseBody
	public List<BranchTotalSales> totalYear(String year, HttpSession session) throws Exception{
		log.info(year);
		int branch_no = (int) session.getAttribute("branch_no");
		Map<String, Object> param = new HashMap<>();
		param.put("branch_no", branch_no);
		param.put("year", year);
		
		List<BranchTotalSales> list =chartService.total_sales(param);
		log.info("도착");
		return list;
		
	}
}	
