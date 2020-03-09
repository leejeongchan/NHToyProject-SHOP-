package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import shop.model.CartListVO;
import shop.model.OrderVO;

public class CartDao {
	private static CartDao cartDao = new CartDao();
	public static CartDao getInstance() {
		return cartDao;
	}
	//카트 불러오기.
	public List<CartListVO> getCartList(String userId) throws SQLException{
		List<CartListVO> list = null;
		CartListVO cartListVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select c.cartNum, c.userId, c.gdsNum, c.cartStock, g.gdsName, g.gdsImg, g.gdsPrice from cart c , goods g where c.gdsNum = g.gdsNum and userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					cartListVO = makeCartFromResultSet(rs);
					list.add(cartListVO);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public CartListVO makeCartFromResultSet(ResultSet rs) throws SQLException {
		CartListVO cartListVO = new CartListVO();
		cartListVO.setCartNum(rs.getInt("cartNum"));
		cartListVO.setCartStock(rs.getInt("cartStock"));
		cartListVO.setGdsName(rs.getString("gdsName"));
		cartListVO.setGdsImg(rs.getString("gdsImg"));
		cartListVO.setUserId(rs.getString("userId"));
		cartListVO.setGdsNum(rs.getInt("gdsNum"));
		cartListVO.setGdsPrice(rs.getInt("gdsPrice"));
		return cartListVO;
	}
	//카트 삭제
	public void cartDelete(int cartNum) throws SQLException{
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("gdsNum delete: "+cartNum);
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("delete from cart where cartNum = ?");
			pstmt.setInt(1, cartNum);
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
	//카트에 있는 거 주문하기 주문 후 카트 내용 삭제
	public void orderCart(OrderVO order) throws SQLException{
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		//카트 내용 전체 삭제하기
		PreparedStatement pstmt2 = null;
		try {
			String sql = "insert into `order` values(?,?,?,?,?,?,?)";
			System.out.println("orderRec: "+order.getOrderRec()+"userId: "+order.getUserId()+" orderId: "+order.getOrderId()+" userAddress:" +order.getUserAddress()+" orderPhon: "+order.getOrderPhon()+" amount: "+order.getAmount());
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getOrderId());
			pstmt.setString(2, order.getUserId());
			pstmt.setString(3, order.getOrderRec());
			pstmt.setString(4, order.getUserAddress());
			pstmt.setString(5, order.getOrderPhon());
			pstmt.setInt(6, order.getAmount());
			pstmt.setInt(7, order.getOrderState());
			pstmt.executeUpdate();
			
			//카트 내용 삭제하기
			pstmt2 = conn.prepareStatement("delete from cart");
			pstmt2.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(pstmt2!=null) {
				pstmt2.close();
			}
			if(conn!=null) {
				conn.close();
			}
		}
	}
	
	
}
