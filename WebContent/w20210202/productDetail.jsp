<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% /* 공유되는 인수(변수) 선언용 스크립틀릿이므로 인식상 위로 */

	// 스크립틀릿에서 변수는 서로 공유된다.
	// JSP page 우선순위 : 스크립틀릿을 먼저 읽고 다음 자바 스크립트를 읽고 다음 HTML을 읽는다.
	
	String no = request.getParameter("pno");	//request는 요청 범위까지만 데이터가 유지-현재 페이지 까지만
	ProductDAO dao = new ProductDAO();
	ProductVO vo = new ProductVO();
	
	if(no!=null){		/* null처리 */
		int pno = Integer.parseInt(no);
		
		vo = dao.getData(pno);
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>productDetail.jsp</title>
<style type="text/css">
	#container {margin:10px;}

	#pic {
		float:left;
	}
	
	#desc {
		margin:50px;
		width: 500px;
		float: left;
	}
	
	#dc {
		color: red;
		font-weight: bold;
	}
	
	#price {text-decoration: line-through;}
	#imgBtns {border-top: 1px solid gray; cursor: pointer;}
	#name {border-top: 3px solid black;}
	
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cart").on('click', function() {
			
			pno = <%=vo.getPno()%>;
			
		/* 	pno=parseInt(pno)+3; ==> 스크립트에 넣어놨으므로 연산이 쉬움 */
			
			$("#no").val(pno);	<%-- 밑에 주석 처리한 value="<%=vo.getPno() 부분과 같은 동작 --%>
			
			document.frm.action = "cart.jsp";
			document.frm.submit();
		});
	});
</script>


</head>
<body>
	<form action="#" name="frm">
		<%-- <input type="hidden" name="no" id="no" value="<%=vo.getPno() %>"> --%>
		<input type="hidden" name="no" id="no">
	
	</form>

	<div id="container">
		
		<div id="pic">
			<img alt="<%=vo.getPname() %>" src="<%=vo.getBigImgFile() %>" id="pImg">
		</div>
		<div id="desc">
			<p>
				<h4><%=vo.getProdesc() %></h4>
			</p>
			<p id="name">상품명 : <%=vo.getPname() %></p>
			<p id="price">상품가 : <%=vo.getPrice() %></p>
			<P id="dc">
				할인가 : ￦ <%=vo.getPrice() - vo.getPrice()*vo.getDcratio()/100 %>
			</P>
			<div id="imgBtns">
				<img alt="즉시구매" src="../images/btn_buy.jpg">
				<img alt="장바구니" src="../images/btn_cart.jpg" id="cart">
				<img alt="위시리스트" src="../images/btn_wish.jpg">
			</div>
		</div>
		
		
	</div>
	
</body>
</html>