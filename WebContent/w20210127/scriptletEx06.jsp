<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Calendar rightNow = Calendar.getInstance();
		
		int hour = rightNow.get(Calendar.HOUR_OF_DAY);
		int minutes = rightNow.get(Calendar.MINUTE);
		int seconds = rightNow.get(Calendar.SECOND);
	%>
	
	<h2>���� �ð��� <%=hour %>�� <%=minutes %>�� <%=seconds%>�� �Դϴ�. </h2>
</body>
</html>