package shop.service;

import java.util.HashMap;

import shop.dao.GraphDao;

/*
 * 그래프 서비스
 */
public class GraphService {
	private static GraphService grapService = new GraphService();
	public static GraphService getInstance() {
		return grapService;
		
		
	}
	
	/*
	 * 상품별 고정 재고 출력 서비스
	 */
	public HashMap<Integer,Integer> getFixStock() throws Exception{
		return GraphDao.getInstance().getFixStock();
	}
	/*
	 * 상품 이름 가져오기?
	 */
	public String getGoodsName(int gdsNum) throws Exception{
		return GraphDao.getInstance().getGoodsName(gdsNum);
	}
	/*
	 * 상품별 현재 재고량
	 */
	public HashMap<Integer,Integer> getCurrentStock() throws Exception{
		return GraphDao.getInstance().getCurrentStock();
	}
}
