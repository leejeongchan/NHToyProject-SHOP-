package shop.service;


import java.util.List;

import shop.dao.GoodsDao;
import shop.model.CartVO;
import shop.model.GoodsVO;
import shop.model.PageList;

public class GoodsService {
	private static GoodsService goodsService = new GoodsService();
	public static GoodsService getInstance() {
		return goodsService;
	}
	
	/*
	 * 상품 등록 서비스
	 */
	public void write(GoodsVO goods) throws Exception {
		GoodsDao.getInstance().write(goods);
	}
	
	/*
	 * 상품 목록 서비스
	 */
	public PageList listAll(int currentPageNumber, int pageSize, int blockSize) throws Exception{
		PageList pageList = null;
		List<GoodsVO> list = null;
		int totalCount = GoodsDao.getInstance().getCount();
		if(totalCount<=0) {
			return null;
		}
		System.out.println("totalCount: "+totalCount);
		pageList = new PageList(currentPageNumber,pageSize,blockSize,totalCount);
		list = GoodsDao.getInstance().listAll(pageList.getStartNo(),pageList.getEndNo());
		pageList.setList(list);
		return pageList;
	}
	/*
	 * Top 5 가져오기
	 */
	
	public List<GoodsVO> listTop() throws Exception{
		return GoodsDao.getInstance().listTop();
	}
	/*
	 * 카테고리별 목록 가져오기
	 */
	public PageList listCate(int cateCode,int currentPageNumber, int pageSize, int blockSize) throws Exception{
		PageList pageList = null;
		List<GoodsVO> list = null;
		System.out.println("[1]");
		int totalCount = GoodsDao.getInstance().getCountCate(cateCode);
		System.out.println("cateTotalCount: "+totalCount);
		if(totalCount<=0) {
			return null;
		}
		pageList = new PageList(currentPageNumber,pageSize,blockSize,totalCount);
		System.out.println("[2]");

		list = GoodsDao.getInstance().listCate(cateCode,pageList.getStartNo(),pageList.getEndNo());
		System.out.println("[3]"+list.get(0).getGdsName());

		pageList.setList(list);
		return pageList;
	}
	/*
	 * 상품 상세보기
	 */
	public GoodsVO goodsView(int gdsNum) throws Exception {
		return GoodsDao.getInstance().goodsView(gdsNum);
		
	}
	/*
	 * 카트 담기
	 */
	public void addCart(CartVO cart) throws Exception{
		GoodsDao.getInstance().addCart(cart);
	}
	/*
	 * 상품 추천
	 */
	public int recommand(int gdsNum) throws Exception{
		return GoodsDao.getInstance().recommand(gdsNum);
	}
	
	/*
	 * 관리자가 상품 삭제
	 */
	public void deleteGoods(int gdsNum) throws Exception{
		GoodsDao.getInstance().deleteGoods(gdsNum);
	}
	/*
	 * 상품 종료 플래그 설정(마감 시)
	 */
	public void endFlag(int gdsNum,int flag) throws Exception{
		GoodsDao.getInstance().endFlag(gdsNum,flag);
	}
	/*
	 * 재판매를 위한 업데이트
	 * 
	 */
	public void resellGoods(int gdsNum,int gdsStock,String gdsEndDate) throws Exception{
		GoodsDao.getInstance().resellGoods(gdsNum,gdsStock,gdsEndDate);
	}
	
	/*
	 * 상품 총 개 수 구하기
	 */
	public int getCount() throws Exception{
		return GoodsDao.getInstance().getCount();
	}
}
