package com.one.burger.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Branch;

@Repository
public class BranchRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(Branch branch) throws Exception {
		//sqlSession.
	}
}

