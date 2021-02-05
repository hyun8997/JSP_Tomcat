<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
	<%
		// 쿠키를 통한 로그아웃
		Cookie c = new Cookie("memberLogin", "-150");
		c.setMaxAge(0);				//유지 시간 0으로 만들어서 없애는 것임
		response.addCookie(c);
		response.sendRedirect("login.jsp");
	
	%>

</body>
</html>