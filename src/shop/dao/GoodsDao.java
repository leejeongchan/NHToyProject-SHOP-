package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import shop.model.CartVO;
import shop.model.GoodsVO;

public class GoodsDao {
	private static GoodsDao goodsDao = new GoodsDao();

	public static GoodsDao getInstance() {
		return goodsDao;
	}

	// 테이블에 상품 정보 삽입.
	public void write(GoodsVO goods) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("insert into goods values(?,?,?,?,?,?,?,now(),?,?)");
			pstmt.setInt(1, 0);
			pstmt.setString(2, goods.getGdsName());
			pstmt.setInt(3, goods.getCateCode());
			pstmt.setInt(4, goods.getGdsPrice());
			pstmt.setInt(5, goods.getGdsStock());
			pstmt.setString(6, goods.getGdsDes());
			pstmt.setString(7, goods.getGdsImg());
			pstmt.setInt(8, goods.getGdsHit());
			pstmt.setInt(9, goods.getGdsReplyCnt());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

	}

	// 상품 목록 전체 리스트
	public List<GoodsVO> listAll() throws SQLException {
		GoodsVO goodsVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<GoodsVO> list = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from goods");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					goodsVO = makeBoardFromResultSet(rs);
					list.add(goodsVO);
				}while(rs.next());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//상품 Top5 가져오기
	public List<GoodsVO> listTop() throws SQLException {
		GoodsVO goodsVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<GoodsVO> list = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from goods order by gdsHit desc limit 0,5");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					goodsVO = makeBoardFromResultSet(rs);
					list.add(goodsVO);
				}while(rs.next());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
				
			}
			if(conn!=null) {
				conn.close();
			}
		}
		return list;
	}

	
	// 상품 상세보기
	public GoodsVO goodsView(int gdsNum) throws SQLException{
		GoodsVO goodsVO = new GoodsVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from goods where gdsNum = ?");
			pstmt.setInt(1, gdsNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				goodsVO = makeBoardFromResultSet(rs);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
				
			}
			if(conn!=null) {
				conn.close();
			}
		}
		return goodsVO;
	}
	
	
	// resultset으로 이용하여 boarVO에 갱신하고 리턴
	private GoodsVO makeBoardFromResultSet(ResultSet rs) throws SQLException {
		GoodsVO goodsVO = new GoodsVO();

		goodsVO.setGdsNum(rs.getInt("gdsNum"));
		goodsVO.setGdsName(rs.getString("gdsName"));
		goodsVO.setCateCode(rs.getInt("cateCode"));
		goodsVO.setGdsPrice(rs.getInt("gdsPrice"));
		goodsVO.setGdsStock(rs.getInt("gdsStock"));
		goodsVO.setGdsDes(rs.getString("gdsDes"));
		goodsVO.setGdsImg(rs.getString("gdsImg"));
		goodsVO.setGdsReg(rs.getString("gdsReg"));
		goodsVO.setGdsHit(rs.getInt("gdsHit"));
		goodsVO.setGdsReplyCnt(rs.getInt("gdsReplyCnt"));
		

		return goodsVO;
	}
	//카테고리 별 목록 가져오기 
	public List<GoodsVO> listCate(int cateCode) throws SQLException {
		GoodsVO goodsVO = null;
		List<GoodsVO> listCate = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from goods where cateCode = ?");
			pstmt.setInt(1, cateCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCate = new ArrayList<>();
				do {
					goodsVO = makeBoardFromResultSet(rs);
					listCate.add(goodsVO);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
				
			}
			if(conn!=null) {
				conn.close();
			}
		}
		return listCate;
	}

	public void addCart(CartVO cart) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement("insert into cart values(?,?,?,?)");
			pstmt2 = conn.prepareStatement("update goods set gdsStock = gdsStock - ? where gdsNum = ?");
			
			pstmt.setInt(1, 0);
			pstmt.setString(2,cart.getUserId());
			pstmt.setInt(3, cart.getGdsNum());
			pstmt.setInt(4, cart.getCartStock());
			pstmt.executeUpdate();
			
			pstmt2.setInt(1, cart.getCartStock());
			pstmt2.setInt(2, cart.getGdsNum());
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
	//상품별 추천하기
	public int recommand(int gdsNum) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs =null;
		
		int count = 0;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement("update goods set gdsHit = gdsHit +1 where gdsNum = ?");
			pstmt.setInt(1, gdsNum);
			pstmt.executeUpdate();
			pstmt2 =conn.prepareStatement("select gdsHit from goods where gdsNum = ?");
			pstmt2.setInt(1, gdsNum);
			rs = pstmt2.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("gdsHit");
			}
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
		return count;
	}
	//관리자가 상품 삭제
	public void deleteGoods(int gdsNum) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt =conn.prepareStatement("delete from goods where gdsNum = ?");
			pstmt.setInt(1, gdsNum);
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
