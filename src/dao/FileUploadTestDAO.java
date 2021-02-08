package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.FileUploadTestVO;
import vo.ReBoardVO;

public class FileUploadTestDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public FileUploadTestDAO(){
		conn = OracleXEConnection.getInstance().getConnection();
	}
	
	
	//dbms에 저장 - insertData()
	public void insertData(FileUploadTestVO vo) {
		sb.setLength(0);
		sb.append("insert into fileuploadtest ");
		sb.append("values (fileuploadtest_fno_seq.nextval, ?, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getTitle());
			pstmt.setNString(2, vo.getWriter());
			pstmt.setNString(3, vo.getContents());
			pstmt.setNString(4, vo.getFilePath());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// insertData() end
	
	
	// writer 매칭 찾기 getData()
	public FileUploadTestVO getData(String writer) {
		FileUploadTestVO vo = null;
		
		sb.setLength(0);
		sb.append("select * from fileuploadtest ");
		sb.append("where writer = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, writer);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			vo = new FileUploadTestVO(rs.getInt(1), rs.getNString(2), rs.getNString(3), 
										rs.getNString(4), rs.getNString(5));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}// getData() end
	
	
	
	
	
	
	
	
	
	
	
	
}
