package test;

import dao.ProductDAO;
import vo.ProductVO;

public class InsertProduct {
	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
		
		ProductVO vo = new ProductVO();
		
//		vo.setPname("���̺���");
//		vo.setPrice(6000000);
//		vo.setDcratio(10);
//		vo.setProdesc("�Ͽ콺�� ���� ���縦 �ε巯�� �ڵ�� �����ο� ��Ƴ� ��Ư�� �ڶ�� �� ����. "
//				+ "���׷� ĵ����, ������ ���� ���� �𼭸� �� ���� ���� �ÿ��� Ʈ��ũ�� �����ϴ� ���� ������ �츮Ƽ���� �����̴� ������. "
//				+ "Ʈ������ ������ �����ִ� ��� �� ��Ƽ�� ü�� �� '���� ���� ��Ƽ��' ���͸��� ������ ���� Ż���� ��Ʈ���� Ư¡.");
//		vo.setQty(10);
//		vo.setImgFile("../images/lv_bag_big.jpg");
//		vo.setBigFile("../images/lv_bag_big.jpg");
	
		
		
//		vo.setPname("���");
//		vo.setPrice(6000000);
//		vo.setDcratio(5);
//		vo.setProdesc("���Ӱ� �����̴� ��������, ������ ����Ʈ �۾��� ������ ��� ��ƼĪ�� �ŷ����� ��Ʈ �ؽ�ó�� �����ϴ� Dior Caro ���Դϴ�. "
//				+ "�ε巯�� ������ �� ������ ũ����î ��� ��� ��Ʋ ������ ������ ���� ��ƽ ��� �ǴϽ� ��Ż ��Ÿ���� Ʈ����Ʈ CD �����ġ�� ��ĵ� �÷��� Ư¡�Դϴ�. "
//				+ "Ż���� �ñ״�ó CD ü�� ��ũ ��� ��Ʈ���� ���̵� �ڼ� ��Ʈ������ ��ü�� �� �־� ���� ��� �̺�� �迡 ��ġ�� ����ϰ� ����ϰ� ��Ÿ�ϸ��ϱ� "
//				+ "���� ���� ���Դϴ�.");
//		vo.setQty(20);
//		vo.setImgFile("../images/blackbag.jpg");
//		vo.setBigFile("../images/blackbag.jpg");
		
		
		
		
		int result = dao.addData(vo);
		
		System.out.println("result : "+result);
	}
}
