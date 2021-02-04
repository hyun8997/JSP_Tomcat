package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;
import vo.BoardVO;

public class BoardV2_DAO {
   StringBuffer sb = new StringBuffer();
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   Connection conn = null;

   public BoardV2_DAO() {
      conn = OracleXEConnection.getInstance().getConnection();

   }// 생성자 end : 생성자 통해서 실행 

   // 게시글 입력 메소드 - addData()

   //   insert into board
   //   values (board_bno_seq.nextval, ?, ?, ?, sysdate, ?, ?, ?)

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

         /*
         pstmt.setInt(5, vo.getStatus());
         pstmt.setInt(6, vo.getHits());
          */
         pstmt.executeUpdate();

      } catch (SQLException e) {
         // TODO: handle exception
         e.printStackTrace();
      } 

   }// addData() end

   // 전체 게시글 조회 - getAllData() - 페이징 처리를 위해 시작번호, 끝번호가 필요.
   public ArrayList<BoardVO> getAllData(int startNo, int endNo){

      ArrayList<BoardVO> list = new ArrayList<BoardVO>();

      sb.setLength(0);
      sb.append("select * ");
      sb.append("from (select rownum rn, bno, title, writer, contents, regdate, ip, status, hits ");
      sb.append("from (select * from board ");
      sb.append("order by bno desc ) ");
      sb.append("where rownum <= ? ) ");
      sb.append("where rn >= ? ");
      
      
      /*   select *
         from ( 
            select rownum rn, empno,ename,sal
            from(select * from emp
                   order by sal desc)
                    where rownum <=5)
                where rn >=3; */
      try {

         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1,  endNo);
         pstmt.setInt(2,  startNo);
         
         rs = pstmt.executeQuery();

         while(rs.next()) {

            int bno = rs.getInt("bno");
            String title =rs.getNString("title");
            String writer =rs.getNString("writer");
            String contents =rs.getNString("contents");
            String regdate =rs.getNString("regdate");
            String ip =rs.getNString("ip");
            int status = rs.getInt("status");
            int hits = rs.getInt("hits");

            BoardVO vo = new BoardVO(bno, title, writer, contents, regdate, ip, status, hits);

            list.add(vo);
         }


      } catch(SQLException e) {
         e.printStackTrace();
      }
      return list;
   }// getAllData() end
   
   
   // 총 게시물 파악 메소드
   
//   select count(*)
//   from board
   
   public int getTotalCount() {
      sb.setLength(0);
      sb.append("select count(*) ");
      sb.append("from board ");
      
      int cnt = 0;
      
      try {
         pstmt = conn.prepareStatement(sb.toString());
         
         rs = pstmt.executeQuery();
         
         rs.next();
         
         cnt = rs.getInt(1);
         
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return cnt;
      
   }// getTotalCount() end
   

   // 데이터 한 건 조회 메소드 - 게시글 번호 - getData()
   public BoardVO getData(int bno){
      //      select * from board
      //      where bno = ?
      sb.setLength(0);
      sb.append("select * from board ");
      sb.append("where bno = ? ");

      BoardVO vo = null;

      try {
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, bno);

         rs = pstmt.executeQuery();

         rs.next(); // 반복문 - 게시글 번호가 pk 걸려있으므로 중복이 될 수 가 없음!

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

   }//getData end


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
   


      // 게시글 삭제 메소드 - (삭제) - DeleteData()
      public void DeleteData(int bno) {
         sb.setLength(0);
         sb.append("delete board " );
         sb.append("where bno = ? ");
         
         try {
            pstmt = conn.prepareStatement(sb.toString());
            pstmt.setInt(1, bno);
            
            pstmt.executeUpdate();
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }//DeleteData() end

      
      // 조회수 증가 메소드 - 게시글 번호 - raiseHits()
      public void raiseHits(int bno) {
    	  sb.setLength(0);
    	  sb.append("update board ");
    	  sb.append("set hits = hits+1 ");
    	  sb.append("where bno = ? ");
    	  
    	  try {
              pstmt = conn.prepareStatement(sb.toString());
              pstmt.setInt(1, bno);
              
              pstmt.executeUpdate();
              
           } catch (SQLException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
           }
      }//raiseHits() end
      
      
      //status를 통한 게시글 처리 check	statusCk()
      public int statusCk(int bno) {
    	  
    	  sb.setLength(0);
    	  sb.append("update board ");
    	  sb.append("set status = 1 ");
    	  sb.append("where bno = ? ");
    	  
    	  int result = -1;
    	  
    	  try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return result;
      }//statusCk() end
      
      
      


}