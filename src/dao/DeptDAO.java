package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.DeptVO;

// DAO(Data Access Object) : DB�� ���� �����ϱ� ���� ��ü

public class DeptDAO {
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "scott";
	final String PASSWORD = "tiger";
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	// ��ü ȣ�� �� db ������ �Ϸ�ǵ��� ó��
	public DeptDAO() {
		try {
			Class.forName(DRIVER);
			
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			System.out.println("conn : "+ conn);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����̹� �ε� ����");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB ���� ����");
		}
	}// ������ end
	
	// 1���� ���� ��ȸ - �μ���ȣ�� �Է¹޾� �μ���ȣ, �μ��̸�, �μ���ġ ������ ��ȸ 
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
	
	// ������ �߰�
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
	
	// ������ ����
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
	
	// ������ 1�� ����
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
	
	// ��ü ��ȸ
	public ArrayList selectAll() {
		
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		
		sb.setLength(0);
		sb.append("select * from dept ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			// ����
			rs = pstmt.executeQuery();
			
			// ���ڵ庰�� ���� ó��
			while(rs.next()) {
				// ���� ���ڵ忡�� ���� ���� ��������
				int deptno = rs.getInt(1);
				String dname = rs.getNString(2);
				String loc = rs.getNString(3);
				
				// VO ��ü�� ���� ����
//				DeptVO vo = new DeptVO();
//				vo.setDeptno(deptno);
//				vo.setDname(dname);
//				vo.setLoc(loc);
				
				DeptVO vo = new DeptVO(deptno, dname, loc);
				
				// Collection�� ���
				list.add(vo);				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;		
	}// selectAll() end
	
	// �ڿ��ݳ�
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

























