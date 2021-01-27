<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구구단 출력</title>
</head>
<body>
	<% 
	String msg = request.getParameter("msg");
	int dan = Integer.parseInt(msg);
	
	for(int i=1; i<10; i++){
		out.println(dan+" * "+i+" = "+(dan*i)+"<br>");
	}
	
	%>
</body>
</html>