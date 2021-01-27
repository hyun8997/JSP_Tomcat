<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application.jsp</title>
</head>
<body>
	<div style="font-size: 24px">
		<%
			out.println("서블릿 컨테이너 정보 : " + application.getServerInfo() + "<br>");
			out.println("파일 실제 위치 : " + application.getRealPath("application.jsp") + "<br>");
			
			application.log("로그 기록 남기기");
		%>
	</div>
</body>
</html>