<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>scriptletEx01.jsp</title>
</head>
<body>
	<h2>Hello Jsp World</h2>
	<%  
		out.println("Hello Jsp World"); //�� �������� ���
	%>
	<br>
	<% out.println("�� ���� �ڹ� ���α׷����� <br> ��� �ǰ� �ֽ��ϴ�."); %>
	<br>
	<% out.println("�� ���� �ڹ� ���α׷�����"); %>
	<br>
	<% out.println("��� �ǰ� �ֽ��ϴ�."); %>
	
	<hr>
	<br>
	
	<%
		int i = 0;
	%>
	
	<% 
		int j = 20;
	
		int sum = i + j;
	%>
	
	<% 
		out.println("i+j="+sum); 
	%>
	
	
</body>
</html>