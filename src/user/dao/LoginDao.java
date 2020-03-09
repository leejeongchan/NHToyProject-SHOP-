package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.ConnectionProvider;
import user.model.UserVO;
public class LoginDao {
	private static LoginDao loginDao = new LoginDao();
	public static LoginDao getInstance() {
		return loginDao;
	}
	
	public LoginDao() {}
	
	
	//회원가입 시 중복체크 AJax
	public int IdChk(String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = ConnectionProvider.getConnection();
		System.out.println("연결..?");
		try {
			pstmt = conn.prepareStatement("select * from user where userId = ?");
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			if(rs.next()) { //존재함
				return 0; 
			}else { //존재하지 않음
				return 1;
			}
		}catch(Exception e) {
			
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(Exception e) {
				
			}
		}
		return -1;
	}
	
	//회원가입
	public void register(UserVO user) throws SQLException {
		PreparedStatement pstmt = null;
		Connection conn = ConnectionProvider.getConnection();
		try {
			System.out.println("user: "+user.getUserId());
			pstmt = conn.prepareStatement("insert into user values(?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserPhNumber());
			pstmt.setInt(7, user.getUserAdmin());
			System.out.println("1");
			pstmt.executeUpdate();
			System.out.println("2");

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(Exception e) {
				
			}
		}
	}
	
	//로그인
	public UserVO login(String userId) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserVO user = null;
		Connection conn = ConnectionProvider.getConnection();
		try {
			pstmt = conn.prepareStatement("select * from user where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = makeUserFromResultSet(rs);
			}else {
				return null;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(Exception e) {
				
			}
		}
		return user;
	}
	
	/*
	 * rs 받아서 VO에 데이터 넣어주기 함수
	 */
	private UserVO makeUserFromResultSet(ResultSet rs) throws SQLException {
		UserVO user = new UserVO();
		user.setUserId(rs.getString("userId"));
		user.setUserPwd(rs.getString("userPwd"));
		user.setUserName(rs.getString("userName"));
		user.setUserAddress(rs.getString("userAddress"));
		user.setUserEmail(rs.getString("userEmail"));
		user.setUserPhNumber(rs.getString("userPhNumber"));
		user.setUserAdmin(rs.getInt("userAdmin"));
		
		return user;
		
		
	}
	/*
	 * 회원 정보 리스트 가져오기
	 */
	public List<UserVO> userList() throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserVO user = null;
		List<UserVO> list = null;
		Connection conn = ConnectionProvider.getConnection();
		try {
			pstmt = conn.prepareStatement("select * from user");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<UserVO>();
				do {
					user = makeUserFromResultSet(rs);
					list.add(user);
				}while(rs.next());
			}else {
				return null;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch(Exception e) {
				
			}
		}
		return list;
	}
	//회원 삭제
	public void deleteMember(String userId) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("delete from user where userId =?");
			pstmt.setString(1, userId);
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

	public void adminMember(String userId) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("update user set userAdmin = 1 where userId = ?");
			pstmt.setString(1, userId);
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
