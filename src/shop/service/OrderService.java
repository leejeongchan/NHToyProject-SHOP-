package shop.service;

import java.util.List;

import shop.dao.OrderDao;
import shop.model.OrderVO;

public class OrderService {
	private static OrderService orderService = new OrderService();
	public static OrderService getInstance() {
		return orderService;
	}
	
	//주문 목록
	public List<OrderVO> orderList(String userId) throws Exception{
		return OrderDao.getInstance().orderList(userId);
	}
	
	//주문 전체 목록
	public List<OrderVO> orderAllList() throws Exception{
		return OrderDao.getInstance().orderAllList();
	}
	
	//주문 확정
	public void orderConfirm(String orderId) throws Exception{
		OrderDao.getInstance().orderConfirm(orderId);
	}
}
