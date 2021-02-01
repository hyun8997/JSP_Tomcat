package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sun.security.action.GetIntegerAction;
import vo.DeptVO;
import vo.Goott_MemberVO;

public class Goott_MemberDAO {
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public Goott_MemberDAO() {
		try {
			Class.forName(DRIVER);
			
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			System.out.println("conn : "+ conn);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
	}// Goott_MemberDAO() end
	
	// 멤버 추가
	public void addData(Goott_MemberVO mvo) {
		sb.setLength(0);
		sb.append("insert into GOOTT_MEMBER ");
		sb.append("values (GOOTT_MEMBER_MEMNO_SEQ.nextval, ?, ?, ?, ?, ?, ?, sysdate ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, mvo.getId());
			pstmt.setNString(2, mvo.getPw());
			pstmt.setNString(3, mvo.getName());
			pstmt.setNString(4, mvo.getBirth());
			pstmt.setNString(5, mvo.getMp());
			pstmt.setNString(6, mvo.getEmail());
			
			int result = pstmt.executeUpdate();
			System.out.println("result : "+ result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// addData() end
	

	// 전체 조회
		public ArrayList getAllData() {
			
			ArrayList<Goott_MemberVO> list = new ArrayList<Goott_MemberVO>();
			
			sb.setLength(0);
			sb.append("select * from GOOTT_MEMBER ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				// 실행
				rs = pstmt.executeQuery();
				
				// 레코드별로 로직 처리
				while(rs.next()) {
					// 현재 레코드에서 각각 값을 가져오기
					int memno = rs.getInt(1);
					String id = rs.getNString(2);
					String pw = rs.getNString(3);
					String name = rs.getNString(4);
					String birth = rs.getNString(5);
					String mp = rs.getNString(6);
					String regdate = rs.getNString(7);
					String email = rs.getNString(8);

					Goott_MemberVO vo = new Goott_MemberVO(id, pw, name, birth, mp, regdate, email, memno);
					
					// Collection에 담기
					list.add(vo);				
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;		
		}// selectAll() end
	
	
		// 자원반납
		public void close() {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}// close() end
	
}





