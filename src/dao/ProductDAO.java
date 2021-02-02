package dao;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.ProductVO;

public class ProductDAO {
	/*
	 * // DBMS 접근하도록 하는 싱글톤 패턴 객체가 생성되었으므로 같은 코드는 필요없음 final String DRIVER =
	 * "oracle.jdbc.driver.OracleDriver"; final String URL =
	 * "jdbc:oracle:thin:@localhost:1521:XE"; final String USER = "scott"; final
	 * String PASSWORD = "tiger";
	 */

	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;

	public ProductDAO() {

		/*
		 * try { Class.forName(DRIVER);
		 * 
		 * conn = DriverManager.getConnection(URL, USER, PASSWORD);
		 * 
		 * System.out.println("conn : "+conn);
		 * 
		 * } catch (ClassNotFoundException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (SQLException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); }
		 */

		conn = OracleXEConnection.getInstance().getConnection(); // 인스턴스화 하고 커넥션 하기

	}// 생성자 end

	// 상품 정보 입력하는 메소드 - addData()
	public int addData(ProductVO vo) {
		sb.setLength(0);
		sb.append("insert into product ");
		sb.append("values (product_pno_seq.nextval, ?, ?, ?, ?, ?, ?, ? ) ");

		int result = -1;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getPname());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setInt(3, vo.getDcratio());
			pstmt.setNString(4, vo.getProdesc());
			pstmt.setInt(5, vo.getQty());
			pstmt.setNString(6, vo.getImgFile());
			pstmt.setNString(7, vo.getBigImgFile());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}// addData() end

	// 상품정보 전체 조회하는 메소드 - getAllData();
	public ArrayList<ProductVO> getAllData() {

		ArrayList<ProductVO> list = new ArrayList<ProductVO>();

		sb.setLength(0);
		sb.append("select * from product ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int pno = rs.getInt(1); // getInt("pno") 가능
				String pname = rs.getNString(2);
				int price = rs.getInt(3);
				int dcratio = rs.getInt(4);
				String prodesc = rs.getNString(5);
				int qty = rs.getInt(6);
				String imgFile = rs.getNString(7);
				String bigImgFile = rs.getNString(8);

				ProductVO vo = new ProductVO(pno, pname, price, dcratio, prodesc, qty, imgFile, bigImgFile);

				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getAllData() end

	
	// 개별 상품 정보를 조회 - 상품 번호로 조회(PK이므로) - getData()
	public ProductVO getData(int pno) {
		
		sb.setLength(0);
		sb.append("select * from product ");
		sb.append("where pno = ? ");
		
		ProductVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, pno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String pname = rs.getNString(2);
			int price = rs.getInt(3);
			int dcratio = rs.getInt(4);
			String prodesc = rs.getNString(5);
			int qty = rs.getInt(6);
			String imgFile = rs.getNString(7);
			String bigImgFile = rs.getNString(8);
			
			vo = new ProductVO(pno, pname, price, dcratio, prodesc, qty, imgFile, bigImgFile);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	
	
	
	
	
	
	// 자원반납
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// close() end

}
