package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import jdbc.ConnectionProvider;

public class GraphDao {
	private static GraphDao graphDao = new GraphDao();
	public static GraphDao getInstance() {
		return graphDao;
	}
	/*
	 * 상품별 고정 재고 출력
	 */
	public HashMap<Integer, Integer> getFixStock() throws SQLException{
		HashMap<Integer,Integer> map = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from `goodsStock`");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				map = new HashMap<Integer,Integer>();
				do {
					map.put(rs.getInt("gdsNum"), rs.getInt("gdsStock"));
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
				conn.close();
			}
		}
		return map;
	}
	public String getGoodsName(int gdsNum) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String gdsName= null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select gdsName from `goods` where gdsNum = ?");
			pstmt.setInt(1, gdsNum);
			rs = pstmt.executeQuery();
			rs.next();
			gdsName = rs.getString("gdsName");
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
				conn.close();
			}
		}
		return gdsName;
	}
	public HashMap<Integer, Integer> getCurrentStock() throws SQLException {
		HashMap<Integer,Integer> map = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select gdsNum, gdsStock from `goods`");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				map = new HashMap<Integer,Integer>();
				do {
					map.put(rs.getInt("gdsNum"), rs.getInt("gdsStock"));
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
				conn.close();
			}
		}
		return map;
	}
	//판매량: 고정 재고 - 현재 재고 
	public HashMap<Integer, Integer> getSellAmountStock() throws SQLException {
		HashMap<Integer,Integer> map = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			//현재 재고
			pstmt = conn.prepareStatement("select g.gdsNum, s.gdsStock-g.gdsStock as 'gdsSell' from `goods` g, `goodsStock` s where g.gdsNum = s.gdsNum");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				map = new HashMap<Integer,Integer>();
				do {
					
					map.put(rs.getInt("gdsNum"), rs.getInt("gdsSell"));
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
				conn.close();
			}
		}
		return map;	}
	
}
