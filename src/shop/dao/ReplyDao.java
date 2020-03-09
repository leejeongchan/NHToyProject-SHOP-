package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import shop.model.GoodsReplyVO;

public class ReplyDao {
	private static ReplyDao replyDao = new ReplyDao();

	public static ReplyDao getInstance() {
		return replyDao;
	}

	// 댓글 삽입
	public void reply(GoodsReplyVO reply) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("insert into goodsReply values(?,?,?,?,now())");
			pstmt.setInt(1, 0);
			pstmt.setInt(2, reply.getGdsNum());
			pstmt.setString(3, reply.getUserId());
			pstmt.setString(4, reply.getRepContent());
			pstmt.executeUpdate();
			pstmt2 = conn.prepareStatement("update goods set gdsReplyCnt = gdsReplyCnt +1 where gdsNum = ?");
			pstmt2.setInt(1, reply.getGdsNum());
			pstmt2.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if(pstmt2!=null) {
				pstmt2.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
	//댓글 목록 가져오기
	public List<GoodsReplyVO> replyList(int gdsNum) throws SQLException {
		// TODO Auto-generated method stub
		List<GoodsReplyVO> list = null;
		GoodsReplyVO reply = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from goodsReply");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					reply = makeReplyFromResultSet(rs);
					list.add(reply);

				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}

	// resultset으로 이용하여 boarVO에 갱신하고 리턴
	private GoodsReplyVO makeReplyFromResultSet(ResultSet rs) throws SQLException {
		GoodsReplyVO reply = new GoodsReplyVO();
		
		reply.setRepNum(rs.getInt("repNum"));
		reply.setGdsNum(rs.getInt("gdsNum"));
		reply.setUserId(rs.getString("userId"));
		reply.setRepContent(rs.getString("repContent"));
		reply.setRepReg(rs.getString("repReg"));


		return reply;
	}
	//댓글 삭제 와 해당 글 댓글 수도 감소
	public void deleteReply(int repNum) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		System.out.println("repNum: "+repNum);
		try {
			conn = ConnectionProvider.getConnection();
			//댓글 수 감소
			pstmt2 = conn.prepareStatement("update goods set gdsReplyCnt = gdsReplyCnt - 1 where gdsNum = (select gdsNum from goodsReply where repNum = ?)");
			pstmt2.setInt(1, repNum);
			boolean a =pstmt2.execute();
			
			pstmt = conn.prepareStatement("delete from goodsReply where repNum = ?");
			pstmt.setInt(1, repNum);
			pstmt.executeUpdate();
			
			
			System.out.println("댓글 수 감소 통과"+a+" "+repNum);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if(pstmt2!=null) {
				pstmt2.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
	//댓글이 자신의 댓글인지 판단
	public String deleteIdChk(int repNum) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userId = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select userId from goodsReply where repNum = ?");
			pstmt.setInt(1, repNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userId = rs.getString("userId");
			}
			

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
		return userId;
	}
	//댓글 수정
	public void modifyReply(int repNum, String repContent) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("repNum: "+repNum+" repContent: "+repContent);
		try {
			conn = ConnectionProvider.getConnection();
			
			pstmt = conn.prepareStatement("update goodsReply set repContent = ? where repNum = ?");
			pstmt.setString(1, repContent);
			pstmt.setInt(2, repNum);
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

}
