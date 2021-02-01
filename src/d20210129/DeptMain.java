package d20210129;

import java.util.ArrayList;

import dao.DeptDAO;
import vo.DeptVO;

public class DeptMain {
	public static void main(String[] args) {
		DeptDAO dao = new DeptDAO();
		
		// ������ 1�� ��ȸ
//		DeptVO vo = dao.selectOne(20);
//		
//		System.out.println(vo.getDeptno() + "\t" + vo.getDname() + "\t" + vo.getLoc());
		
		System.out.println("------------------------------------------");
		
		// ������ 1�� �߰�
//		DeptVO vo1 = new DeptVO();
//		vo1.setDeptno(80);
//		vo1.setDname("����2");
//		vo1.setLoc("����");		
//		
//		int result = dao.insertOne(vo1);
//		
//		if(result==1) {
//			System.out.println("�����ͺ��̽��� ����Ǿ��ٴ� ���������� �������� �ٸ� ���� ������ �� �ְ���?");
//		}
		
		System.out.println("----------------------------------------");
		
		// ������ 1�� ����
//		DeptVO vo2 = new DeptVO();
//		vo2.setDeptno(70);
//		vo2.setDname("�ѹ�1");
//		vo2.setLoc("���ǵ�");		
//		
//		dao.updateOne(vo2);
		
		System.out.println("-------------------------------------------");
//		dao.deleteOne(80);
		
		System.out.println("--------------------------------------------");
		// ���� ������ ��ȸ
		ArrayList<DeptVO> list = dao.selectAll();
		
		for(DeptVO vo : list) {
			System.out.println(
					vo.getDeptno() + "\t" + vo.getDname() + "\t" + vo.getLoc()
					
					);
		}
		
	}
}
