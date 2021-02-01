package d20210129;

import java.util.ArrayList;

import dao.DeptDAO;
import vo.DeptVO;

public class DeptMain {
	public static void main(String[] args) {
		DeptDAO dao = new DeptDAO();
		
		// 데이터 1건 조회
//		DeptVO vo = dao.selectOne(20);
//		
//		System.out.println(vo.getDeptno() + "\t" + vo.getDname() + "\t" + vo.getLoc());
		
		System.out.println("------------------------------------------");
		
		// 데이터 1건 추가
//		DeptVO vo1 = new DeptVO();
//		vo1.setDeptno(80);
//		vo1.setDname("영업2");
//		vo1.setLoc("강남");		
//		
//		int result = dao.insertOne(vo1);
//		
//		if(result==1) {
//			System.out.println("데이터베이스에 저장되었다는 성공정보를 바탕으로 다른 일을 수행할 수 있겠죠?");
//		}
		
		System.out.println("----------------------------------------");
		
		// 데이터 1건 수정
//		DeptVO vo2 = new DeptVO();
//		vo2.setDeptno(70);
//		vo2.setDname("총무1");
//		vo2.setLoc("여의도");		
//		
//		dao.updateOne(vo2);
		
		System.out.println("-------------------------------------------");
//		dao.deleteOne(80);
		
		System.out.println("--------------------------------------------");
		// 전제 데이터 조회
		ArrayList<DeptVO> list = dao.selectAll();
		
		for(DeptVO vo : list) {
			System.out.println(
					vo.getDeptno() + "\t" + vo.getDname() + "\t" + vo.getLoc()
					
					);
		}
		
	}
}
