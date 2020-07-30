package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{//static을 쓰는 이유 : 공유의 개념
		
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/lolDB";
		String user = "root";
		String password = "1234";	
		Class.forName("com.mysql.jdbc.Driver"); //mysql 드라이버 지정
		conn = DriverManager.getConnection(url, user, password); //getConnection  : 데이터베이스 연결 정보,싱글톤 패턴			
		
		return conn;
	}
	
}
