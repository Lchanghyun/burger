package com.one.burger.service;


import java.util.List;


import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.GoodsBranchMenuVo;
import com.one.burger.entity.MenuBranchMenuVo;
import com.one.burger.entity.Today;

public interface BurgerOrderService {
	//주문하기 클릭시 나오는 메뉴
	public List<MenuBranchMenuVo> orderList(String branch_name) throws Exception;
	
	//시퀀스
	public Integer getSeq() throws Exception;
	
	//주문하기
	public void orderInsert(BurgerOrder burgerOrder) throws Exception;
	public void goodsInsert(Goods goods) throws Exception;
	
	
	//결제하기 리스트
	public List<GoodsBranchMenuVo> goodsList(int order_no) throws Exception;
	
	//결제하기
	public void TodayInsert(Today today)throws Exception;

	public Integer sysdateToday() throws Exception;

	public Integer branchNo(int order_no) throws Exception;

	public String branchAddr(int order_no) throws Exception;

	public boolean orderNoCheck(int order_no) throws Exception;
	
}
