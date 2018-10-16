package jsp.member.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import jsp.util.DBconnection;

public class MemberDAO {
	private static MemberDAO instance;
	
	// 싱글톤 패턴
	private MemberDAO(){}
	public static MemberDAO getInstance(){
		if(instance==null)
			instance = new MemberDAO();
		return instance;
	}
	
	// String -> Date로 변경하는 메서드
	// 문자열로된 생년월일을 Date로 변경하기 위해 필요
	// java.util.Date클래스로는 오라클의 Date형식과 연동할 수 없다.
	// Oracle의 date형식과 연동되는 java의 Date는 java.sql.Date 클래스이다.
	public Date stringToDate(MemberBean member){
		String year = member.getBirthyy();
		String month = member.getBirthmm();
		String day = member.getBirthdd();
		
		Date birthday = Date.valueOf(year+"-"+month+"-"+day);
		
		return birthday;
	}
	
	public void insertMember(MemberBean member) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 커넥션을 가져온다.
			conn = DBconnection.getConnection();
			
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			// 쿼리 생성한다.
			// 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
			StringBuffer sql = new StringBuffer();
			sql.append("insert into JSP_MEMBER values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");
			stringToDate(member);
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail1()+"@"+member.getMail2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			
			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// 오류시 롤백
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {pstmt.close(); pstmt=null;}
				if (conn != null) {conn.close(); conn=null;}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	// 로그인시 아이디, 비밀번호 체크 메서드
	// 아이디, 비밀번호를 인자로 받는다.
	public int loginCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
		int x = -1;
		
		try {
			StringBuffer query = new StringBuffer();
			// 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			query.append("select password from jsp_member where id=?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
				
				if (dbPW.equals(pw))
					x = 1; // 넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증성공
				else
					x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
			} else {
				x = -1; // 해당 아이디가 없을 경우
			}
			
			return x;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) { pstmt.close(); pstmt=null; }
				if (conn != null) { conn.close(); conn=null; }
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}
