<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userCookieList.jsp</title>
</head>
<body>
	<!-- 쿠키 호출 -->
	<%
		Cookie[] cList = request.getCookies(); //배열로 받게 되어있음
	
		for(Cookie c : cList){
			String name = URLDecoder.decode(c.getName(), "UTF-8");		//인코딩을 했으므로 디코딩 필요
			String value = URLDecoder.decode(c.getValue(), "UTF-8");
	%>
	<h2><%=name %> : <%=value %></h2>
	<%
		}//for end
	%>
	
	
	
</body>
</html>