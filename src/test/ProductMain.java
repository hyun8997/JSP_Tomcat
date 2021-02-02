package test;

import java.util.ArrayList;

import dao.ProductDAO;
import vo.ProductVO;

public class ProductMain {
	public static void main(String[] args) {
		//new ProductDAO();
		
		// 전체 상품의 imgfile 정보를 모두 출력해보세요
		ProductDAO dao = new ProductDAO();
		
		ArrayList<ProductVO> list = dao.getAllData();
		
		for(ProductVO vo : list) {
			System.out.println(vo.getPno() +"\t"+ vo.getImgFile());
		}
		
		
		System.out.println("------------------------------------");
		//상품번호로 개별 조회
		ProductVO vo = dao.getData(10);
		System.out.println(vo.getPno()+" "+vo.getPname()+" "+vo.getBigImgFile());
		
		
		
		
		
		
		dao.close();
	}
}
