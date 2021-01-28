<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>resultHobby.jsp</title>
</head>
<body>
	<%
		String[] str = request.getParameterValues("box");	//파라메서 하나에 여러 변수가 들어올 수 있음
		
		for(String hobby : str){
			out.println("당신의 취미는 " + hobby + "입니다.");
		}
	%>
	
</body>
</html>