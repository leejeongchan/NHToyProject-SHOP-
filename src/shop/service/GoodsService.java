package shop.service;


import java.util.List;

import shop.dao.GoodsDao;
import shop.model.CartVO;
import shop.model.GoodsVO;

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
	public List<GoodsVO> listAll() throws Exception{
		return GoodsDao.getInstance().listAll();
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
	public List<GoodsVO> listCate(int cateCode) throws Exception{
		return GoodsDao.getInstance().listCate(cateCode);
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
	

	
}
