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
			out.println("���� �����̳� ���� : " + application.getServerInfo() + "<br>");
			out.println("���� ���� ��ġ : " + application.getRealPath("application.jsp") + "<br>");
			
			application.log("�α� ��� �����");
		%>
	</div>
</body>
</html>