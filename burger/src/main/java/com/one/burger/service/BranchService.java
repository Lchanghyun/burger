package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Branch;

public interface BranchService {
	public List<Branch> list() throws Exception;
	public List<Branch> list(Integer branch_no) throws Exception;

	
	public void insert(Branch branch) throws Exception;


}
