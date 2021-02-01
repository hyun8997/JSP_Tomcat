package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.DeptVO;

// DAO(Data Access Object) : DB에 쉽게 접근하기 위한 객체

public class DeptDAO {
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	// 객체 호출 시 db 접속이 완료되도록 처리
	public DeptDAO() {
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
	}// 생성자 end
	
	// 1건의 정보 조회 - 부서번호를 입력받아 부서번호, 부서이름, 부서위치 정보를 조회 
	public DeptVO selectOne(int deptno) {
		sb.setLength(0);
		sb.append("select * from dept ");
		sb.append("where deptno = ? ");
		
		DeptVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String dname = rs.getNString(2);
			String loc = rs.getNString(3);
			
			vo = new DeptVO(deptno, dname, loc);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return vo;
	}// selectOne() end
	
	// 데이터 추가
	//public void insertOne(DeptVO vo) {
	public int insertOne(DeptVO vo) {
		sb.setLength(0);
		sb.append("insert into dept ");
		sb.append("values (?, ?, ? ) ");
		
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getDeptno());
			pstmt.setNString(2, vo.getDname());
			pstmt.setNString(3, vo.getLoc());
			
			//int result = pstmt.executeUpdate();
			
			//System.out.println("result : "+ result);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;
	}// insertOne() end
	
	// 데이터 수정
	public void updateOne(DeptVO vo) {
		sb.setLength(0);
		sb.append("update dept ");
		sb.append("set dname = ?, loc = ? ");
		sb.append("where deptno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getDname());
			pstmt.setNString(2, vo.getLoc());
			pstmt.setInt(3, vo.getDeptno());;
			
			int result = pstmt.executeUpdate();
			
			System.out.println("result : "+ result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}// updateOne() end
	
	// 데이터 1건 삭제
	public void deleteOne(int deptno) {
		sb.setLength(0);
		sb.append("delete dept ");
		sb.append("where deptno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, deptno);
			
			int result = pstmt.executeUpdate();
			
			System.out.println("result : "+ result);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}// deleteOne() end
	
	// 전체 조회
	public ArrayList selectAll() {
		
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		
		sb.setLength(0);
		sb.append("select * from dept ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			// 실행
			rs = pstmt.executeQuery();
			
			// 레코드별로 로직 처리
			while(rs.next()) {
				// 현재 레코드에서 각각 값을 가져오기
				int deptno = rs.getInt(1);
				String dname = rs.getNString(2);
				String loc = rs.getNString(3);
				
				// VO 객체에 값을 전달
//				DeptVO vo = new DeptVO();
//				vo.setDeptno(deptno);
//				vo.setDname(dname);
//				vo.setLoc(loc);
				
				DeptVO vo = new DeptVO(deptno, dname, loc);
				
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

























