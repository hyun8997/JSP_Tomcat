package test;

import dao.ProductDAO;
import vo.ProductVO;

public class InsertProduct {
	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();
		
		ProductVO vo = new ProductVO();
		
//		vo.setPname("루이비통");
//		vo.setPrice(6000000);
//		vo.setDcratio(10);
//		vo.setProdesc("하우스의 깊은 역사를 부드러운 핸드백 디자인에 담아낸 독특한 쁘띠뜨 말 수플. "
//				+ "모노그램 캔버스, 리벳을 더한 가죽 모서리 및 가죽 네임 택에서 트렁크를 제작하는 루이 비통의 헤리티지가 엿보이는 아이템. "
//				+ "트렌디한 감성을 더해주는 골드 톤 노티컬 체인 및 '루이 비통 말티에' 레터링을 수놓은 넓은 탈착형 스트랩이 특징.");
//		vo.setQty(10);
//		vo.setImgFile("../images/lv_bag_big.jpg");
//		vo.setBigFile("../images/lv_bag_big.jpg");
	
		
		
//		vo.setPname("디올");
//		vo.setPrice(6000000);
//		vo.setDcratio(5);
//		vo.setProdesc("새롭게 선보이는 라인으로, 베이지 소프트 송아지 가죽의 까나쥬 스티칭이 매력적인 퀼트 텍스처를 연출하는 Dior Caro 백입니다. "
//				+ "부드러운 감촉의 이 가방은 크리스챤 디올 향수 보틀 씰에서 영감을 얻은 앤틱 골드 피니시 메탈 스타일의 트위스트 CD 잠금장치로 장식된 플랩이 특징입니다. "
//				+ "탈착식 시그니처 CD 체인 링크 숄더 스트랩을 와이드 자수 스트랩으로 교체할 수 있어 데이 룩과 이브닝 룩에 매치해 모던하고 우아하게 스타일링하기 "
//				+ "좋은 라지 백입니다.");
//		vo.setQty(20);
//		vo.setImgFile("../images/blackbag.jpg");
//		vo.setBigFile("../images/blackbag.jpg");
		
		
		
		
		int result = dao.addData(vo);
		
		System.out.println("result : "+result);
	}
}
