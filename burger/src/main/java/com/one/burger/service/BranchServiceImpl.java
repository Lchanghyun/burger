package com.one.burger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Branch;
import com.one.burger.repository.BranchRepository;

@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	private BranchRepository branchRepository;
	
	@Override
	public void insert(Branch branch) throws Exception {
		branchRepository.insert(branch);
	}
}

