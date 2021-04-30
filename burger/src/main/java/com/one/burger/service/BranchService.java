package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Branch;

public interface BranchService {
	
	public List<Branch> list() throws Exception;
	public List<Branch> list(Integer branch_no) throws Exception;

	
	//지점 회원가입 처리
	public void branchJoin(Branch branch) throws Exception;
	
	//로그인처리
	public boolean branchLogin(String id, String pw) throws Exception;
	public boolean superLogin(String id, String pw)throws Exception;
	
	//find
	public Branch find(int branch_no)throws Exception;
	public Branch find2(String branch_id)throws Exception;



}
