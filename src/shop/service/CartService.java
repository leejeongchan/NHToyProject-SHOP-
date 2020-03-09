package shop.service;

import java.util.List;

import shop.dao.CartDao;
import shop.model.CartListVO;
import shop.model.OrderVO;

public class CartService {
	private static CartService cartService = new CartService();
	public static CartService getInstance() {
		return cartService;
	}
	
	//카트 리스트 불러오기
	public List<CartListVO> getCartList(String userId) throws Exception{
		return CartDao.getInstance().getCartList(userId);
	}
	
	//카트 삭제
	public void cartDelete(int cartNum) throws Exception{
		CartDao.getInstance().cartDelete(cartNum);
	}
	
	//주문 하기
	public void orderCart(OrderVO order) throws Exception{
		CartDao.getInstance().orderCart(order);
	}
}
