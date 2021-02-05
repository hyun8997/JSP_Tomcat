package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.ReBoardVO;

public class ReBoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public ReBoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}// ������ end
	
	
	// ��� �Է� �޼ҵ� - insertReply()
	public void insertReply(ReBoardVO vo) {
		sb.setLength(0);
		sb.append("insert into reboard ");
		sb.append("values (reboard_renum_seq.nextval, ?, ?, sysdate, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getId());
			pstmt.setNString(2, vo.getContents());
			pstmt.setInt(3, vo.getRef());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// insertReply() end
	
	
	// 
	public ArrayList<ReBoardVO> getAllReply(){
		ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
		
		sb.setLength(0);
		sb.append("select * from reboard ");
		sb.append("order by renum desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReBoardVO rvo = 
						new ReBoardVO(rs.getInt(1), rs.getNString(2), rs.getNString(3), 
								rs.getNString(4), rs.getInt(5));
				list.add(rvo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getAllReply() end
	
	
	// ref(bno)�� ã�� ��� �������� �Լ� getAllReply() �����ε�!!!
	public ArrayList<ReBoardVO> getAllReply(int ref){
		ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
		
		sb.setLength(0);
		sb.append("select * from reboard ");
		sb.append("where ref = ? ");
		sb.append("order by renum desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, ref);

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReBoardVO rvo = 
						new ReBoardVO(rs.getInt(1), rs.getNString(2), rs.getNString(3), 
								rs.getNString(4), rs.getInt(5));
				list.add(rvo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getAllReply() end
	
	
	
	
	
	
	
}
