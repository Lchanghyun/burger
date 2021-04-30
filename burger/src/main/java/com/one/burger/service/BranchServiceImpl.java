package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Branch;
import com.one.burger.repository.BranchRepository;

import lombok.extern.java.Log;

@Log
@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	private BranchRepository branchRepository;
	
	@Override
	public List<Branch> list() throws Exception {
		return branchRepository.list();
	}
	
	//지점관리자 가입
	@Override
	public void branchJoin(Branch branch) throws Exception {
		branch.setBranch_no(branchRepository.branch_seq());
		branchRepository.register(branch);
		
	}
	
	//지점관리자 로그인
	@Override
	public boolean branchLogin(String id, String pw) throws Exception {
		boolean resultA = branchRepository.branchLogin(id, pw).size() > 0 ;
		log.info("1이면 true 0이면 false : " + resultA );
		return resultA;
	}
	
	@Override
	public boolean superLogin(String id, String pw) throws Exception {
		boolean resultB = branchRepository.superLogin(id, pw).size() > 0;
		log.info("1이면 true 0이면 false : " + resultB);
		return resultB;
	}

	@Override
	public Branch find(int branch_no) throws Exception {
		return branchRepository.find(branch_no);
	}

	@Override
	public Branch find2(String branch_id) throws Exception {
		return branchRepository.find2(branch_id);
	}

	@Override
	public List<Branch> list(Integer branch_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}


