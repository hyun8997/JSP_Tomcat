<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receiveMsg.jsp</title>
</head>
<body>
	<% 
	//sendMsg.jsp에서 전달된 값을 receiveMsg.jsp에서 브라우저에 요청
	
	//form => name - value ===> name - parameter
	
	String msg = request.getParameter("msg");
	
	
	%>
	
	<h1>전달 받은 메세지 : <%=msg %></h1>
	
</body>
</html>