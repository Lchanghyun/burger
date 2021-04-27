package com.one.burger.controller;

import java.util.Calendar;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.SalesSuperTotal;
import com.one.burger.service.ChartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/supervisorChart")
	public void getSupervisorChart(Model model) throws Exception {
		log.info("getSupervisorChart()");
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		String now;
		String prev;
		if(month<10) {
			now = year+"/0"+month;
			if(month==1) {
				prev = (year-1)+"/12";
			}
			else {
				prev = year+"/0"+(month-1);
			}
		}
		else {
			now = year+"/"+month;
			if(month==10) {
				prev = year+"/0"+(month-1);
			}
			else {
				prev = year+"/"+(month-1);
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
		System.out.println(obj);
		return new ResponseEntity<JSONObject>(obj, HttpStatus.CREATED);
	}
	
	@GetMapping("/branchChart")
	public void getBranchChart() {
		log.info("getBranchChart()");
	}
}
