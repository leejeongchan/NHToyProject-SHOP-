package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nhshop?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=EUC_KR","root","7342ysYS__");
			System.out.println("DB연결 성공!!");
		}catch(Exception e) {
			System.out.println("DB연결 실패!!");

			e.printStackTrace();
		}finally {
			
		}
		return conn;
	}
}
