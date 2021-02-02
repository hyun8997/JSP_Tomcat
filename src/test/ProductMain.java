package test;

import java.util.ArrayList;

import dao.ProductDAO;
import vo.ProductVO;

public class ProductMain {
	public static void main(String[] args) {
		//new ProductDAO();
		
		// ��ü ��ǰ�� imgfile ������ ��� ����غ�����
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductVO> list = dao.getAllData();
		
		for(ProductVO vo : list) {
			System.out.println(vo.getPno() +"\t"+ vo.getImgFile());
		}
		
		
		System.out.println("------------------------------------");
		//��ǰ��ȣ�� ���� ��ȸ
		ProductVO vo = dao.getData(10);
		System.out.println(vo.getPno()+" "+vo.getPname()+" "+vo.getBigImgFile());
		
		
		
		
		
		
		dao.close();
	}
}
