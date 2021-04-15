package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Branch;

@Repository
public class BranchRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Branch> list() throws Exception{
		return sqlSession.selectList("branch.list");
	}

	public void insert(Branch branch) throws Exception {
		//sqlSession.
	}

}

