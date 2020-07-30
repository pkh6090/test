package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mvc.database.DBConnection;

public class MemberDAO {

	private static MemberDAO instance; //싱글톤 패턴으로 한번만 인스턴스 생성
	//생성하고 다른 클래스에서 공유하여 사용	
	
	private MemberDAO() {
		//매게변수가 없는 기본 생성자				
	}
	
	public static MemberDAO getInstance() {
		//instance 최초 생성
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}
	
	
	public int duplecateID(String id) {
		int cnt=0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		String sql;		 
		sql = "select count(id) as cnt from member where id = ?";
		
		try {			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);	
			rs = pstmt.executeQuery(); //select는 executeQuery()			
			if (rs.next())	{				
				cnt= rs.getInt("cnt"); //rs에 값을 넣어둠(건수만 불러오므로 if문을 씀)
			}
		} catch (Exception ex) { //SQLException을 써도 무관
			System.out.println("아이디 중복 확인 실패: " + ex.getMessage()); //어디에서 오류가 났는지 바로 파악가능
		} 
		return cnt;
	}
}
