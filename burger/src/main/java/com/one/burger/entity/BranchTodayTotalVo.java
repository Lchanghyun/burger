package com.one.burger.entity;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BranchTodayTotalVo {
	
	private int branch_no;
	private String branch_name;
	private int total_price;
	private Timestamp today_time;
	
	
	private List<BranchTodayTotalVo> branchTodayTotalVo_list;
}
