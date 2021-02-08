<%@page import="bean.Goott_MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginMain.jsp</title>
</head>
<body>
	<%
		Goott_MemberBean gmb = new Goott_MemberBean();
		gmb.setId(request.getParameter("id"));
		
	%>
	
	<h2>id <%=gmb.getId() %>님 환영합니다.</h2>
	
	<a href="loginForm.jsp"><input type="button" value="로그아웃" /></a>
	
</body>
</html>