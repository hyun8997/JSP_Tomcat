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
		margin: auto;	/* 컨테이너를 중앙으로 */
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
	
	.price {text-decoration: line-through;}  /* 중간에 줄쳐짐 */
	.red {color: red;}
	.ratio {font-weight: bold;}
	
	p {
		text-align: center;	/* 글자를 중앙정렬 */
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
			<img alt="와~" src="../images/diorLogo.jpg">
		</div>
		
		<% 
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductVO> list = dao.getAllData();
			
			for(ProductVO vo : list){
		%>

		<div class="wrap">
			<%-- <%=vo.getPno() %> --%>
			<a href="productDetail.jsp?pno=<%=vo.getPno()%>">	<!-- pno를 같이 넘겨줌 -->
				<img id="voImg" alt="<%=vo.getPno() %> : <%=vo.getPname() %>" src="<%=vo.getImgFile() %>">
			</a>
			<p><%=vo.getPname() %></p>
			<p class="price"><%=vo.getPrice() %></p>		<!-- 추후에 묶일거 같으면 class, 아니면 id -->
			<p class="red">품절 임박</p>
			<p><%=vo.getDcratio() %> % 할인</p>
			<p class="ratio"> 
				<%=vo.getPrice() - vo.getPrice()*vo.getDcratio()/100%>
				<%-- <%=vo.getPrice() * (1-vo.getDcratio()*0.01)%> --%>
				원</p>
			
			<input type="button" value="장바구니">
			<input type="button" value="즉시주문">

		</div>
		<%
			}
		%>
		
	
	</div>
	
</body>
</html>