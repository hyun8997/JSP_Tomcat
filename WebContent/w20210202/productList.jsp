<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>productList.jsp</title>
<style type="text/css">
	* {
		margin: 0px;
		padding: 0;
		/* background-color: pink; */
	}
	
	#container {
		width: 1000px;
		margin: auto;	/* �����̳ʸ� �߾����� */
	}
	
	#logo{
		margin-top: 50px;
		margin-bottom: 50px;
		width: 1000px;
		text-align: center;
	}
	
	#voImg {
		width: 300px;
		height: 250px;
	}
	
	.wrap {
		width: 300px;
		border: 1px solid white;
		margin-left: 10px;
		margin-bottom: 10px;
		float: left;
	}
	
	.price {text-decoration: line-through;}  /* �߰��� ������ */
	.red {color: red;}
	.ratio {font-weight: bold;}
	
	p {
		text-align: center;	/* ���ڸ� �߾����� */
	}
	
	input {
		background-color: white;
		margin-left:47px;
		
		
		border: none;
		padding: 10px 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		cursor: pointer;
		
		border-radius:10px;
	}
	
	input:hover {
    	background-color: lightgray;
	}

	
</style>
</head>
<body>
	<div id="container">
		<div id="logo">
			<img alt="��~" src="../images/diorLogo.jpg">
		</div>
		
		<% 
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductVO> list = dao.getAllData();
			
			for(ProductVO vo : list){
		%>

		<div class="wrap">
			<%-- <%=vo.getPno() %> --%>
			<a href="productDetail.jsp?pno=<%=vo.getPno()%>">	<!-- pno�� ���� �Ѱ��� -->
				<img id="voImg" alt="<%=vo.getPno() %> : <%=vo.getPname() %>" src="<%=vo.getImgFile() %>">
			</a>
			<p><%=vo.getPname() %></p>
			<p class="price"><%=vo.getPrice() %></p>		<!-- ���Ŀ� ���ϰ� ������ class, �ƴϸ� id -->
			<p class="red">ǰ�� �ӹ�</p>
			<p><%=vo.getDcratio() %> % ����</p>
			<p class="ratio"> 
				<%=vo.getPrice() - vo.getPrice()*vo.getDcratio()/100%>
				<%-- <%=vo.getPrice() * (1-vo.getDcratio()*0.01)%> --%>
				��</p>
			
			<input type="button" value="��ٱ���">
			<input type="button" value="����ֹ�">

		</div>
		<%
			}
		%>
		
	
	</div>
	
</body>
</html>