package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import shop.model.OrderVO;

public class OrderDao {
	private static OrderDao orderDao = new OrderDao();
	public static OrderDao getInstance() {
		return orderDao;
	}
	//주문 목록 불러오기
	public List<OrderVO> orderList(String userId) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderVO> list = null;
		OrderVO orderVO = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement("select * from `order` where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					orderVO = makeUserFromResultSet(rs);
					list.add(orderVO);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
			if(conn!=null) {
				rs.close();
			}
		}
		return list;
	}
	
	/*
	 * rs 받아서 VO에 데이터 넣어주기 함수
	 */
	private OrderVO makeUserFromResultSet(ResultSet rs) throws SQLException {
		OrderVO orderVO = new OrderVO();
		orderVO.setOrderId(rs.getString("orderId"));
		orderVO.setUserId(rs.getString("userId"));
		orderVO.setUserAddress(rs.getString("userAddress"));
		orderVO.setOrderPhon(rs.getString("orderPhon"));
		orderVO.setAmount(rs.getInt("amount"));
		orderVO.setOrderRec(rs.getString("orderRec"));
		orderVO.setOrderState(rs.getInt("orderState"));
		return orderVO;
		
		
	}
	public List<OrderVO> orderAllList() throws SQLException{
		List<OrderVO> list = null;
		OrderVO order = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from `order`");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<OrderVO>();
				do {
					order = makeUserFromResultSet(rs);
					list.add(order);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			if(pstmt != null) {
				pstmt.close();
				
			}
			if(rs!=null) {
				rs.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}
		
		return list;
	}
	public void orderConfirm(String orderId) throws SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("update `order` set orderState = 1 where orderId = ?");
			pstmt.setString(1, orderId);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}
		
	}
}
