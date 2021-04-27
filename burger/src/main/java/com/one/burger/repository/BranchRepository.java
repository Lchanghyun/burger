package com.one.burger.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	//지점관리자 가입 db로
	public void register(Branch branch) throws Exception {
		sqlSession.insert("branch.branch_join", branch);
	}
	
	//지점관리자 시퀀스
	public int branch_seq() throws Exception {
		return sqlSession.selectOne("branch.branch_seq");
	}
	
	//로그인
	public List<Branch> branchLogin(String id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectList("branch.login_auth", map);
	}
	
	public List<Branch> superLogin(String id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectList("branch.login_super", map);
	}
	
	public Branch find(int branch_no) {
		return sqlSession.selectOne("branch.branch_find", branch_no);
		
	}
	
	public Branch find2(String branch_id) {
		return sqlSession.selectOne("branch.branch_find2", branch_id);
	}

	
}

