package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.BoardVO;

public class BoardDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public BoardDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}// 생성자 end
	
	
	//게시글 입력 메소드 - addData()
	public void addData(BoardVO vo) {
		sb.setLength(0);
		sb.append("insert into board ");
		sb.append("values (board_bno_seq.nextval, ?, ?, ?, sysdate, ?, 0, 0 ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getTitle());
			pstmt.setNString(2, vo.getWriter());
			pstmt.setNString(3, vo.getContents());
			pstmt.setNString(4, vo.getIp());
//			pstmt.setInt(5, vo.getStatus());	//사용자로부터 입력 받지 않으며, null 처리가 필요함!!!!
//			pstmt.setInt(6, vo.getHits());
			
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addData() end
	
	
	//전체 받기 - getAllData()
	public ArrayList<BoardVO> getAllData() {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();

		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("order by bno desc ");

		try {
			pstmt = conn.prepareStatement(sb.toString());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int bno = rs.getInt(1);
				String title = rs.getNString(2);
				String writer = rs.getNString(3);
				String contents = rs.getNString(4);
				String regdate = rs.getNString(5);
				String ip = rs.getNString(6);
				int status = rs.getInt(7);
				int hits = rs.getInt(8);

				BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits);

				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getAllData() end
	
	
	// 데이터 한 건 조회 메소드 - 게시글 번호 - getData()
	public BoardVO getData(int bno) {
		BoardVO vo = null;
		
		sb.setLength(0);
		sb.append("select * from board ");
		sb.append("where bno =? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String title = rs.getNString(2);
			String writer = rs.getNString(3);
			String contents = rs.getNString(4);
			String regdate = rs.getNString(5);
			String ip = rs.getNString(6);
			int status = rs.getInt(7);
			int hits = rs.getInt(8);
			
			vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}// getData() end
	
	
	// 게시글 수정 메소드 - (제목, 내용) - modifyData()
    public void modifyData(BoardVO vo) {
       sb.setLength(0);
       sb.append("update board ");
       sb.append("set title = ?, contents = ? ");
       sb.append("where bno = ? ");
       
       try {
          pstmt = conn.prepareStatement(sb.toString());
          pstmt.setNString(1,  vo.getTitle());
          pstmt.setNString(2,  vo.getContents());
          pstmt.setInt(3,  vo.getBno());
          
          pstmt.executeUpdate();
       } catch (SQLException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }

    }//modifyData() end
	
	
	
	
	
	// 게시글 삭제 메소드 - 게시글 번호 - deleteData()
	public void deleteData(int bno) {
		sb.setLength(0);
		sb.append("delete board ");
		sb.append("where bno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}//deleteData() end
	
	
	
	
}
