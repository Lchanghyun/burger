package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Branch;
import com.one.burger.repository.BranchRepository;

@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	private BranchRepository branchRepository;
	@Override
	public List<Branch> list() throws Exception {
		return branchRepository.list();
	}
	
	@Override
	public void insert(Branch branch) throws Exception {
		branchRepository.insert(branch);
	}

	@Override
	public List<Branch> list(Integer branch_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}


