<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>cart.jsp</title>

</head>
<body>
	
	<%
		String no = request.getParameter("no");
	%>
	
	<h1>�����Ͻ� ��ǰ��ȣ�� <%=no %>�Դϴ�.</h1>
	
	
</body>
</html>