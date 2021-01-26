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
		out.println("Hello Jsp World"); //웹 페이지에 출력
	%>
	<br>
	<% out.println("이 줄은 자바 프로그램에서 <br> 출력 되고 있습니다."); %>
	<br>
	<% out.println("이 줄은 자바 프로그램에서"); %>
	<br>
	<% out.println("출력 되고 있습니다."); %>
	
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