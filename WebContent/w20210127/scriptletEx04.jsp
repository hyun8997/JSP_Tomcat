<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		int year = 2021;
	
		public String getYear(){
			return "���ش�";
		}
	%>
	<h2><%= getYear() %> <%= year %>�⵵ �Դϴ�.</h2>
	
	<%
		float f;
		float f2 = 3.14f;
		double d = f2;
		
		double d2 = Math.round(f2);
		
		Date date = new Date();
	%>
	
	<h2><%= date %></h2>
	
	
</body>
</html>