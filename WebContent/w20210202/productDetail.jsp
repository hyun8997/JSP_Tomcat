<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% /* �����Ǵ� �μ�(����) ����� ��ũ��Ʋ���̹Ƿ� �νĻ� ���� */

	// ��ũ��Ʋ������ ������ ���� �����ȴ�.
	// JSP page �켱���� : ��ũ��Ʋ���� ���� �а� ���� �ڹ� ��ũ��Ʈ�� �а� ���� HTML�� �д´�.
	
	String no = request.getParameter("pno");	//request�� ��û ���������� �����Ͱ� ����-���� ������ ������
	ProductDAO dao = new ProductDAO();
	ProductVO vo = new ProductVO();
	
	if(no!=null){		/* nulló�� */
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
			
		/* 	pno=parseInt(pno)+3; ==> ��ũ��Ʈ�� �־�����Ƿ� ������ ���� */
			
			$("#no").val(pno);	<%-- �ؿ� �ּ� ó���� value="<%=vo.getPno() �κа� ���� ���� --%>
			
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
			<p id="name">��ǰ�� : <%=vo.getPname() %></p>
			<p id="price">��ǰ�� : <%=vo.getPrice() %></p>
			<P id="dc">
				���ΰ� : �� <%=vo.getPrice() - vo.getPrice()*vo.getDcratio()/100 %>
			</P>
			<div id="imgBtns">
				<img alt="��ñ���" src="../images/btn_buy.jpg">
				<img alt="��ٱ���" src="../images/btn_cart.jpg" id="cart">
				<img alt="���ø���Ʈ" src="../images/btn_wish.jpg">
			</div>
		</div>
		
		
	</div>
	
</body>
</html>